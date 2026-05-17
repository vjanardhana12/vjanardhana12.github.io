---
title: "D365 F&O Deployment Release Notes"
description: "Automated deployment release notes for D365 Finance & Operations — single unified template, compact env strip, live release status, package & entity audit. Published to Azure DevOps project wiki on every build."
date: 2026-05-17
tags: [D365FO, Azure DevOps, Release Notes, Wiki, ALM, DevOps, Pipeline]
repo: "https://github.com/vjanardhana12/d365fo-deployment-release-notes"
version: "1.0.0"
visibility: "public"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A **plug-and-play pipeline template** that auto-generates deployment release notes for D365 F&O builds and publishes them to the Azure DevOps project wiki.

Every CI build creates a wiki page with:
- **Build metadata table** — branch, build, prepared-for / prepared-by, build date, triggered by
- **Deployment status strip** — compact `[Env1](url) 🟢 → [Env2](url) ⚪` updated live by the release pipeline
- **Release link** — auto-flips `⏳ Awaiting deployment` to `[Release N](url) 🟢 _Deployed_`
- **Work items** — User Stories, Document Deliverables, Tasks, Bugs, Configuration Deliverables (all clickable)
- **Notes** — `Custom.ReleaseNote` + `Custom.RootCauseNotes` per work item
- **Pull Requests** — who raised, source/target branch, who approved (🟢 / ✓)
- **Data Entity Changes** — new/modified/deleted entities and extensions with field-level detail
- **Package Versions** — Platform, Foundation, and ISV packages with versions
- **Section-of-record layout** — every page renders the full set of sections so reviewers always know what to look for; empty sections show a single `_No xxx linked to this build._` row

## Key features

| Feature | Details |
|---|---|
| **Single unified template** | One Handlebars template for `main` / `release` / `prod` / `hotfix` (Commit blockquote conditional on branch) |
| **Compact env strip** | `[Env](url) icon → [Env](url) icon` — no Mermaid plugin needed |
| **4-icon legend** | 🟢 Deployed · 🟠 Partial · 🔴 Failed · ⚪ Pending |
| **Clickable env links** | `EnvUrlMapJson` maps env names to D365 URLs |
| **Entity change tracking** | Detects new entities, modified fields, extensions, deleted fields |
| **Package audit trail** | Every build records the exact NuGet package versions used |
| **Newest-first sort** | Latest build always appears at top of wiki nav |
| **Encoding-safe** | UTF-32 char codes for emoji; works under Windows PowerShell 5.1 default encoding |
| **Non-blocking** | Entire stage is independent — never blocks your build or deployment |
| **One-time setup** | Two PowerShell scripts: wiki structure + build permission |

## Quick start

```bash
git clone https://github.com/vjanardhana12/d365fo-deployment-release-notes.git
```

1. Install two free marketplace extensions (XplatGenerateReleaseNotes + WikiUpdaterTask)
2. Run `setup/Setup-WikiStructure.ps1` (creates wiki folders)
3. Run `setup/Grant-BuildPermission.ps1` (fixes TF401027 permission error)
4. Add the reusable stage template to your pipeline YAML
5. Add `Update-WikiReleaseNotes.ps1` to each release stage to refresh the strip + flip the release link

See the [README](https://github.com/vjanardhana12/d365fo-deployment-release-notes#readme) for the full setup guide.

## Links

- **GitHub**: [vjanardhana12/d365fo-deployment-release-notes](https://github.com/vjanardhana12/d365fo-deployment-release-notes)
- **Release**: [v1.0.0](https://github.com/vjanardhana12/d365fo-deployment-release-notes/releases/tag/v1.0.0)
- **Blog post**: [Automated Deployment Release Notes for D365 F&O](/blog/d365fo-deployment-release-notes/)
