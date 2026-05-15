---
title: "Automated Deployment Release Notes for D365 F&O"
description: "How to auto-generate deployment release notes for Dynamics 365 Finance & Operations and publish them to Azure DevOps project wiki — with live environment tracking, entity change detection, and package version audit."
date: 2026-05-15
tags: [D365FO, Azure DevOps, Release Notes, Wiki, ALM, DevOps, Pipeline]
showReadingTime: true
showWordCount: true
showAuthor: true
---

Every D365 F&O project needs deployment release notes. Most teams write them manually — copying work item IDs, listing what changed, tracking which environment has which build. It's tedious and error-prone.

I built a pipeline template that does all of this automatically.

## The problem

- Release notes are manual, inconsistent, and often outdated
- Nobody tracks which NuGet/ISV package versions are in each build
- Data entity changes (new fields, new entities, extensions) are invisible — data migration teams get surprised
- No single view of "which environment has this build deployed?"

## The solution

A reusable Azure DevOps pipeline stage that:

1. **Generates a wiki page per build** with all linked work items, PRs, and metadata
2. **Detects data entity changes** by diffing the X++ metadata between commits — shows added/modified/deleted entities with field-level detail
3. **Records package versions** from `packages.config` — Platform, Foundation, and ISV packages
4. **Draws a live environment diagram** using Mermaid — each release stage updates the diagram with deployment status (Deployed / In progress / Pending / Failed)
5. **Sorts newest-first** in the wiki navigation
6. **Cleans up empty sections** — if no bugs in this build, the Bugs section disappears entirely

## What it looks like

After a build, you get a wiki page like this:

```
Release Notes – D365 Finance and Operations

Release information: ⏳ Awaiting deployment    ← replaced with release link after deploy

Environments:
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│ DEV-Deployed │──▶│ SIT-Deployed │──▶│ UAT-Pending  │──▶ ...
└──────────────┘   └──────────────┘   └──────────────┘

# User Stories          ← from ADO work items
# Tasks                 ← from ADO work items
# Bugs                  ← severity, priority, found-in-env
# Data Entity Changes   ← auto-detected from git diff
# Pull Requests         ← who raised, who approved
# Package Versions      ← from packages.config
```

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
    templateFile: 'release-notes-template/main-template.md'
    packagesConfigPaths: |
      $(Build.SourcesDirectory)\path\to\packages.config
```

That's it. Every build now generates a wiki page automatically.

## Customization

The generic template uses standard ADO fields only (System.Title, System.AreaPath, etc.). If your project has custom fields (like `Custom.ReleaseNote` or `Custom.FoundInEnvironment`), check the `examples/custom-template-example.md` in the repo for how to extend the template.

## Links

- **GitHub**: [vjanardhana12/d365fo-deployment-release-notes](https://github.com/vjanardhana12/d365fo-deployment-release-notes)
- **Project page**: [Projects → D365 F&O Deployment Release Notes](/projects/d365fo-deployment-release-notes/)
