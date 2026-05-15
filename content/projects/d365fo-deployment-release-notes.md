---
title: "D365 F&O Deployment Release Notes"
description: "Automated deployment release notes for D365 Finance & Operations — published to Azure DevOps project wiki on every build, with live environment progress tracking, package versions, and data entity change detection."
date: 2026-05-15
tags: [D365FO, Azure DevOps, Release Notes, Wiki, ALM, DevOps, Mermaid, Pipeline]
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
- **Work items** — User Stories, Tasks, Bugs with clickable ADO links
- **Pull Requests** — who raised, source/target branch, who approved
- **Data Entity Changes** — new/modified/deleted entities with field-level detail
- **Package Versions** — Platform, Foundation, and ISV packages with versions
- **Environment Progress** — colored mermaid flowchart updated live by the release pipeline
- **Empty section cleanup** — sections with no data are automatically removed

## Key features

| Feature | Details |
|---|---|
| **Colored mermaid diagram** | Green = Deployed, Orange = In progress, Grey = Pending, Red = Failed |
| **Clickable env links** | Environment URLs as compact links below the diagram |
| **Entity change tracking** | Detects new entities, modified fields, extensions, deleted fields |
| **Package audit trail** | Every build records the exact NuGet package versions used |
| **Newest-first sort** | Latest build always appears at top of wiki nav |
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

See the [README](https://github.com/vjanardhana12/d365fo-deployment-release-notes#readme) for the full setup guide.

## Links

- **GitHub**: [vjanardhana12/d365fo-deployment-release-notes](https://github.com/vjanardhana12/d365fo-deployment-release-notes)
