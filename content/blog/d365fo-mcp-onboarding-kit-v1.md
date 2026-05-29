---
title: "D365 F&O MCP Onboarding Kit (v1.0.0) — three clicks to a working AI-ready workspace"
description: "A WPF installer that gets a new D365 F&O developer from a fresh laptop to a fully-configured, MCP-powered VS Code workspace in about three minutes. No JSON editing, no manual extension installs, no 'where do I get the MCP server' hunt."
date: 2026-05-30
tags: [D365FO, MCP, PowerShell, Copilot, Onboarding, AI-ERP, AIBS]
showReadingTime: true
showWordCount: true
showAuthor: true
---

Every D365 Finance & Operations project starts with the same boring half-day of setup: install Git, install VS Code, clone the right workspace, download the X++ MCP server EXE, paste paths into `.vscode/mcp.json`, fill in `d365fo-mcp.json`, wire up Azure DevOps config, fix at least two things you got slightly wrong, then finally start working.

I built a **one-click installer** that does all of it. v1.0.0 is now live.

> Microsoft-internal — published under `mcaps-microsoft`. Access via the repo link below.

## What it actually does

A WPF installer wizard with **three pages**: Welcome → Installing → Done. The whole flow takes about three clicks plus a minute or two of waiting.

| # | Step | Source |
|---|---|---|
| 1 | **Git for Windows** | `winget install Git.Git` (skipped if present) |
| 2 | **Visual Studio Code** | `winget install Microsoft.VisualStudioCode` (skipped if present) |
| 3 | **DevWorkspace** | Cloned from `mcaps-microsoft/DevWorkspace-for-Dynamics-Finance-and-Operations` |
| 4 | **AI-First skills** | Cloned from `mcaps-microsoft/ISDAIFirstAiBS` |
| 5 | **Local X++ MCP server** | Latest release of `mcaps-microsoft/Xpp-MCP-for-Dynamics-Finance-and-Operations` |
| 6 | **`.vscode/mcp.json` patch** | Points `D365FODevMCP.command` to the just-extracted EXE |
| 7 | **Profile save** | `%USERPROFILE%\.aibs-onboarding\profile.json` for future re-runs |

When the wizard finishes, you open the cloned workspace folder in VS Code and the four MCP servers light up automatically.

## The four MCP servers you get out of the box

| Server | Type | Purpose |
|---|---|---|
| **D365FODevMCP** | stdio (local EXE) | Offline AOT authoring — tables, classes, forms, build, BP checks |
| **DevMachine** | http | Runtime MCP on your D365FO Dev VM or Tier-2 — OData CRUD, form interaction, API invocation |
| **ado** | stdio (pwsh) | Azure DevOps work items, queries, comments |
| **microsoft-learn** | http | Official Microsoft Learn documentation search |

This is the same fleet of MCP servers we standardised on across D365 F&O engagements, so any AI-First skill or agent in the workspace can target them without further setup.

## Why I built it

We were doing the same setup over and over on every project — Carlsberg, internal engagements, demos. Done manually, people get it subtly wrong (one wrong path in `mcp.json` and Copilot silently sees zero tables), and then spend a day debugging "why isn't this working".

A standard installer means **everyone starts day one with an identical, working environment** and can immediately focus on the actual work.

## v1.0.0 highlights

- **Pure MCP focus** — no VS Code extension bundled. Teams that want the D365 F&O AI Co-Lead extension install it separately.
- **Bright new icon** — high-contrast white background with bold blue **AI** glyph, multi-size embedded (16-256 px). Visible on dark taskbars and tiny in tray.
- **PSGallery-resilient release pipeline** — GitHub Actions runner now registers the PowerShell Gallery before installing `ps2exe`, so the release zip builds reliably.
- **Single-page wizard** — name + install path, that's it. No URL prompts up front; the in-repo validation skill walks you through the rest the first time you start a Copilot chat (when you actually have your sandbox URL and ADO project handy).
- **Fully idempotent** — re-run any time to fast-forward the cloned repos, upgrade the MCP server EXE, or repair `mcp.json`.

## Try it

Repo: [`mcaps-microsoft/D365FO-MCP-Onboarding`](https://github.com/mcaps-microsoft/D365FO-MCP-Onboarding)

Direct download: [latest release](https://github.com/mcaps-microsoft/D365FO-MCP-Onboarding/releases/latest)

1. Download the `.zip` asset and unzip anywhere.
2. Double-click `Run Installer.lnk` (or the `.exe` inside).
3. Enter your name, pick an install path, click **Install**.

That's it. Open the cloned `DevWorkspace-for-Dynamics-Finance-and-Operations` folder in VS Code and start chatting with Copilot.

---

If you find a rough edge or want a feature, [open an issue on the repo](https://github.com/mcaps-microsoft/D365FO-MCP-Onboarding/issues). Pull requests welcome.
