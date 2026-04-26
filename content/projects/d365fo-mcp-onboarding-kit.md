---
title: "D365 F&O MCP Onboarding Kit"
description: "Self-service kit to onboard D365 F&O developers to MCP. DevLead wizard, TFC and FC PowerShell setups, and a generic project-init flow."
date: 2026-04-23
tags: [D365FO, MCP, PowerShell, AI-ERP, Onboarding]
repo: "https://github.com/mcaps-microsoft/D365FO-MCP-Onboarding"
version: "1.0.0"
visibility: "ms-internal"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A **self-service onboarding kit** for D365 Finance & Operations developers to get up and running with **MCP (Model Context Protocol)** servers. Works against any tenant/environment.

- **DevLead wizard** — generates per-project onboarding kits with Carlsberg-style or generic templates.
- **TFC + FC setups** — pre-configured PowerShell flows for Functional Consultants and Technical Consultants.
- **Generic project-init** — creates `d365fo-mcp.json`, `ado-config.json`, `.vscode/mcp.json` from interactive prompts.
- **Self-updating** — `Setup.bat` always pulls latest from ADO before running.

## Quick start

> Microsoft-internal. Access via the linked repo above.

1. Clone the onboarding repo.
2. Run `Setup.bat` — it pulls latest, builds the MCP server EXE, and configures your workspace.
3. Open VS Code; MCP tools auto-load from `.vscode/mcp.json`.

## Why it matters

Each D365 F&O project (Carlsberg, generic Microsoft engagements, etc.) needs a consistent MCP server setup with the right paths, prefixes, and naming conventions. This kit standardizes the onboarding so every developer on a project starts with an identical, working environment.

Microsoft-internal — published under `mcaps-microsoft`.
