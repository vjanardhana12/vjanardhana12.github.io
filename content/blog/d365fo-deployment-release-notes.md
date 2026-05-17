---
title: "Automated Deployment Release Notes for D365 F&O (v1.0.0)"
description: "Auto-generate deployment release notes for Dynamics 365 Finance & Operations and publish them to Azure DevOps project wiki — single unified template, compact env strip, live release status, package & entity audit."
date: 2026-05-17
tags: [D365FO, Azure DevOps, Release Notes, Wiki, ALM, DevOps, Pipeline]
showReadingTime: true
showWordCount: true
showAuthor: true
---

Every D365 F&O project needs deployment release notes. Most teams write them manually — copying work item IDs, listing what changed, tracking which environment has which build. It's tedious, inconsistent, and almost always out of date.

I built a reusable pipeline template that does all of this automatically. v1.0.0 is now live on GitHub.

## What you get on every build

A single wiki page per build with everything reviewers, support and data-migration teams need:

| Section | Source |
|---|---|
| Build metadata table | Build details (branch, commit, build date, triggered by) |
| Deployment status strip | Live release REST API — `[Env1](url) 🟢 → [Env2](url) ⚪ → [Env3](url) ⚪` |
| Release link | Auto-flips `⏳ Awaiting deployment` → `[Release 213](url) 🟢 _Deployed_` |
| User Stories / Document Deliverables / Tasks / Bugs / Configuration Deliverables | Linked work items |
| Data Migration / Test Notes / Known Issues / Rollback Plan | Static placeholder rows (filled in manually as needed) |
| Notes | `Custom.ReleaseNote` + `Custom.RootCauseNotes` per work item |
| Pull Requests | Who raised, source/target branch, who approved (🟢 / ✓) |
| Package Versions | Appended from `packages.config` (Platform / Foundation / ISV) |

Every page renders the **full set of sections** even when empty — reviewers always know what to look for. Empty sections show a single `_No xxx linked to this build._` row instead of being silently removed.

## Legend (4 icons)

🟢 Deployed · 🟠 Partial · 🔴 Failed · ⚪ Pending

## Single unified template

One Handlebars template (`release-notes-template.md`) handles all four branches via a conditional:

```handlebars
{{#unless (eq (replace buildDetails.sourceBranch "refs/heads/" "") "main")}}
> **Commit** [`{{substring buildDetails.sourceVersion 0 8}}`]({{buildDetails.repository.url}}/commit/{{buildDetails.sourceVersion}})
{{/unless}}
```

- `main` builds: Commit blockquote omitted (not meaningful for daily CD)
- `release` / `prod` / `hotfix`: Commit blockquote rendered as a callout above the metadata table

Same `release-notes-stage.yaml` is reused by every branch pipeline.

## Compact env strip (no Mermaid)

The deployment status used to be a Mermaid flowchart. v1.0.0 replaces it with a compact strip — easier to read, looks great in PR previews, no Mermaid renderer needed:

```
[DevTest](url) 🟢 → [SIT](url) 🟢 → [UAT](url) 🟢 → [PROD](url) ⚪
```

The post-deployment task updates the strip after every stage by querying the live release stages via REST.

## Setup (5 minutes)

### Prerequisites

Install two free marketplace extensions:
- [Generate Release Notes (XplatGenerateReleaseNotes)](https://marketplace.visualstudio.com/items?itemName=richardfennellBM.BM-VSTS-XplatGenerateReleaseNotes)
- [Wiki Updater (WikiUpdaterTask)](https://marketplace.visualstudio.com/items?itemName=richardfennellBM.BM-VSTS-WIKIUpdater-Tasks)

### One-time setup

```powershell
# 1. Create wiki folder structure
.\setup\Setup-WikiStructure.ps1 -Organization "https://dev.azure.com/yourorg" -Project "YourProject" -WikiName "YourProject.wiki"

# 2. Grant build service permission (fixes TF401027)
.\setup\Grant-BuildPermission.ps1 -Organization "https://dev.azure.com/yourorg" -Project "YourProject"
```

### Add to your pipeline

```yaml
- template: pipelines/release-notes-stage.yaml
  parameters:
    wikiRepoUrl: 'https://yourorg@dev.azure.com/yourorg/YourProject/_git/YourProject.wiki'
    branchFolder: 'Main-branch'
    templateFile: 'release-notes-template/release-notes-template.md'
    packagesConfigPaths: |
      $(Build.SourcesDirectory)\path\to\packages.config
```

### Add to your release pipeline

Drop `Update-WikiReleaseNotes.ps1` into each release stage as a post-deployment task to refresh the strip + flip the release link.

```powershell
.\Update-WikiReleaseNotes.ps1 `
    -Environment "DEV" `
    -WikiRepoUrlBase "https://dev.azure.com/yourorg/YourProject/_git/YourProject.wiki" `
    -EnvUrlMapJson '{"DEV":"https://yourenv-dev.sandbox.operations.eu.dynamics.com/","UAT":"https://yourenv-uat.sandbox.operations.eu.dynamics.com/"}'
```

## Customization

The generic template uses standard ADO fields only. If your project has custom fields (like `Custom.ReleaseNote` or `Custom.FoundInEnvironment`), see `examples/custom-template-example.md` in the repo.

## Why v1.0.0?

This release consolidates everything proven on a live customer rollout (multi-country D365 F&O implementation) into a single reusable template:

- **One template** (was two: `main-template.md` + `release-template.md`)
- **Compact strip** (was Mermaid flowchart — needed mermaid plugin, didn't render in some clients)
- **4-icon legend** including ⚪ Pending (was missing — In progress was conflated with Pending)
- **`_Deployed_` suffix on the release cell** (was just the link — easy to miss at a glance)
- **Kept-empty sections** (was: silently removed — reviewers couldn't tell if section was empty or just missing)
- **Encoding-safe hourglass matcher** (was: silently failed if the script was saved in a different encoding)

## Links

- **GitHub**: [vjanardhana12/d365fo-deployment-release-notes](https://github.com/vjanardhana12/d365fo-deployment-release-notes)
- **Release**: [v1.0.0](https://github.com/vjanardhana12/d365fo-deployment-release-notes/releases/tag/v1.0.0)
- **Project page**: [Projects → D365 F&O Deployment Release Notes](/projects/d365fo-deployment-release-notes/)
