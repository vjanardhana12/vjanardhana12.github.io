---
title: "ADO Dev Task Creator"
description: "Automates creation of dev task hierarchy (Tech Review, Tech Design, Code Review, Unit Test, Walkthrough) under any ADO Document Deliverable. CSV batch mode and dry-run included."
date: 2026-05-01
tags: [D365FO, PowerShell, Azure-DevOps, ALM, Automation]
repo: "https://github.com/vjanardhana12/ado-dev-task-creator"
version: "1.0.0"
visibility: "public"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

Automates creation of the **standard development task hierarchy** under an Azure DevOps Document Deliverable (DD) — Technical Review, Code Extensions, Technical Design, Code Review, Unit Testing, and Walkthrough — with proper assignment, estimates, and parent/child linking.

```
DD (existing)
├── Technical Review (Task)         → developer
└── Development (Code Extensions)   → developer
    ├── Technical Design (Task)     → developer
    ├── Code Review (Task)          → reviewer (dev lead)
    ├── Unit Testing (Task)         → developer
    └── Walkthrough (Task)          → developer
```

- **Config-driven** — all project settings in `config.json`, no hardcoded values
- **Batch mode** — process multiple DDs from a CSV in one run
- **Dry run** — preview ADO changes before applying
- **Idempotent** — checks for existing children before creating
- **Pre-built for Carlsberg EMEA** — custom fields, stakeholders, reviewer auto-assignment included; trivial to fork for any project

## Quick start

1. Install Azure CLI with the DevOps extension: `az extension add --name azure-devops`
2. Sign in to your ADO org
3. Update `config.json` with your project, iteration, and reviewer
4. Run interactively: `.\create-dev-tasks.ps1`

Batch mode:
```powershell
.\create-dev-tasks.ps1 -InputCsv .\dd-input-template.csv
```

## Why it matters

Manual task creation per DD wastes 5-10 minutes and is error-prone — wrong assignees, missing fields, broken hierarchies. This script ships a consistent, idempotent, project-aware flow that takes seconds and is safe to re-run.

Open source under MIT License.
