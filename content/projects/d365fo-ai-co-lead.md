---
title: "D365 F&O AI Co-Lead"
description: "VS Code extension - your AI partner across the F&O delivery lifecycle. Six role-aware Copilot Chat partners, in-product Agent Factory, role-filtered dashboard."
date: 2026-05-01
tags: [D365FO, VSCode, AI, Copilot, MCP, Agents, ALM, DevOps]
download: "https://github.com/vjanardhana12/d365fo-ai-co-lead/releases/latest/download/d365fo-ai-co-lead-1.0.0.vsix"
repo: "https://github.com/vjanardhana12/d365fo-ai-co-lead"
version: "1.0.0"
visibility: "public"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A **VS Code extension** that gives every D365 F&O delivery role — Architect, FC, Dev Lead, Developer, Tester, PM — a personalised AI cockpit. Six role-aware Copilot Chat partners, an in-product Agent Factory, and a dashboard that only shows the tiles relevant to the role you've picked.

- **Six chat partners** — `@d365fo-co-lead` (master) plus one per role (`@d365fo-architect`, `@d365fo-fc`, `@d365fo-dev-lead`, `@d365fo-developer`, `@d365fo-tester`, `@d365fo-pm`).
- **Agent Factory** — create your own role-aware AI agents inside the extension. No editing markdown skill files.
- **Project-aware** — every project carries its own ADO/F&O spec; the same agent adapts to your project's conventions instead of being hardcoded.
- **Two execution modes** — every tile has a click-driven Quick Mode and an "Ask AI" Agent Mode. Same backend, two surfaces.
- **MCP-powered** — leverages `D365FODevMCP` (X++/AOT), `DevMachine` (runtime), `ado` (work items), and Microsoft Learn MCPs.

## Quick start

1. Click **Download** above (or install from VS Code: `code --install-extension d365fo-ai-co-lead-1.0.0.vsix`).
2. Open the **D365 F&O** activity bar → **Open Dashboard**.
3. Add an Identity (ADO email + PAT) → add a Project Connection (or import via Project Initiation Kit).
4. Set your role(s): VS Code Settings → `d365fo.myRoles`.
5. In Copilot Chat, type `@d365fo-co-lead` and try `/dashboard`, `/connections`, `/agents`, `/role`.

## Why it matters

Internal D365 skill repos hand-edit markdown files for one delivery model — they break when ADO field naming or work item types differ. This extension models a per-project spec so the **same agent works across N projects, no forking**. It also serves all six delivery roles, not just developers, and lets end users build their own agents in-product. **No other internal D365 tool offers an Agent Factory.**

Open source under MIT License. v1.0 ships the platform; v1.1 wires AI mode end-to-end (FDD/TDD/test-case generators, PR triage, defect triage). See [ROADMAP](https://github.com/vjanardhana12/d365fo-ai-co-lead/blob/main/ROADMAP.md).
