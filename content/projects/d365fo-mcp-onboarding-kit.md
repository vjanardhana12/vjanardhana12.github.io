---
title: "D365 F&O MCP Onboarding Kit"
description: "One-click installer that bootstraps a complete Dynamics 365 Finance & Operations developer workspace with MCP servers, AI-First skills, and the local X++ MCP server — in about three minutes."
date: 2026-05-30
tags: [D365FO, MCP, PowerShell, AI-ERP, Onboarding, Copilot]
repo: "https://github.com/mcaps-microsoft/D365FO-MCP-Onboarding"
version: "1.0.0"
visibility: "ms-internal"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A **WPF installer wizard** that gets a new D365 F&O developer from a fresh laptop to a fully working MCP-powered VS Code workspace in roughly **three clicks**.

Download the release zip, double-click the EXE, pick an install folder — done. No JSON editing, no manual extension installs, no "now where do I get the MCP server" hunt.

## What gets installed

| # | Step | Source |
|---|---|---|
| 1 | **Git for Windows** | `winget install Git.Git` (skipped if present) |
| 2 | **Visual Studio Code** | `winget install Microsoft.VisualStudioCode` (skipped if present) |
| 3 | **DevWorkspace for D365 F&O** | Cloned from `mcaps-microsoft/DevWorkspace-for-Dynamics-Finance-and-Operations` |
| 4 | **AI-First skills + prompts** | Cloned from `mcaps-microsoft/ISDAIFirstAiBS` |
| 5 | **Local X++ MCP server** | Latest release of `mcaps-microsoft/Xpp-MCP-for-Dynamics-Finance-and-Operations` |
| 6 | **`.vscode/mcp.json` patch** | Points `D365FODevMCP.command` to the just-extracted EXE |
| 7 | **Profile save** | `%USERPROFILE%\.aibs-onboarding\profile.json` for future re-runs |

## MCP servers configured in the workspace

After install, the cloned workspace's `.vscode/mcp.json` ships with four MCP servers wired up and ready to use:

| Server | Type | Purpose |
|---|---|---|
| **D365FODevMCP** | stdio (local EXE) | Offline AOT authoring — tables, classes, forms, build, BP checks |
| **DevMachine** | http | Runtime MCP exposed by your D365FO Dev VM or Tier-2 — OData CRUD, form interaction, API invocation |
| **ado** | stdio (pwsh) | Azure DevOps work items, queries, comments |
| **microsoft-learn** | http | Official Microsoft Learn documentation search |

## Quick start

> Microsoft-internal. Access via the linked repo above.

1. Download the latest zip from the [releases page](https://github.com/mcaps-microsoft/D365FO-MCP-Onboarding/releases/latest).
2. Unzip anywhere and double-click `Run Installer.lnk` (or the EXE inside).
3. The wizard opens — enter your name, pick an install path, click **Install**.
4. When it finishes, open the cloned `DevWorkspace-for-Dynamics-Finance-and-Operations` folder in VS Code. The repo's validation prompt walks you through the last bits of config (`d365fo-mcp.json`, `ado-config.json`, DevMachine URL) the first time you start a Copilot chat.

The wizard is fully idempotent — re-run any time to fast-forward repos, upgrade the MCP server EXE, or repair `mcp.json`.

## Why it matters

Every D365 F&O engagement needs the same boring foundation: Git, VS Code, the right MCP servers in `.vscode/mcp.json`, project metadata in `d365fo-mcp.json`, ADO config, and a local copy of the X++ MCP server EXE. Done manually that's an hour of copy-paste — and people get it subtly wrong, then spend a day debugging "why doesn't Copilot see my tables".

This kit standardises that foundation across every project so every developer starts day one with an **identical, working environment** and can immediately focus on the actual work.

## v1.0.0 highlights

- **Pure MCP focus** — no VS Code extension bundled; if a team wants the D365 F&O AI Co-Lead extension on top, they install it separately.
- **Brand-new bright icon** — high-contrast white + blue so it actually shows up on dark taskbars.
- **PSGallery-resilient release pipeline** — GitHub Actions runner registers the PowerShell Gallery repo before building, so `ps2exe` builds don't randomly fail.
- **Single-page wizard** — name + path + go. No URL prompts up front (collected later when you actually have your sandbox).
