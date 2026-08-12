---
title: "D365 F&O CAR Unified"
description: "Customization Analysis Report tool for Dynamics 365 F&O. Modern successor to CAREvolved: multi-root, UDE-ready, Office-free Excel, better UX, and a drop-in Azure DevOps pipeline pack."
date: 2026-07-27
tags: [D365FO, BP, CAR, PowerShell, DevOps, UDE, Pipeline]
repo: "https://github.com/vjanardhana12/CarUnified"
version: "1.0.0"
visibility: "ms-internal"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

**CAR Unified** is the modern **Customization Analysis Report** tool for Dynamics 365 Finance & Operations — a direct successor to CAREvolved, rewritten to work across today's F&O dev topologies (Tier-1 dev VMs, UDE, cloud-hosted boxes) with a much cleaner workflow and no Excel-on-machine dependency.

Point it at one or more metadata roots, run one command, get one consolidated report you can attach to a PR or drop into a wiki.

## Why it exists

CAREvolved solved multi-root BP for its time, but the F&O world has moved on:

- **UDE / cloud-hosted dev boxes** don't look like Tier-1 VMs — the old CAR flow needed too many manual tweaks.
- Teams don't want an **Office / Excel** installation on their build agents just to render a report.
- Report scope needs to **auto-derive from the models the build actually produces**, not be hand-listed per project.
- Findings need to slot straight into a **pipeline gate**, not stay stuck as a local HTML.

CAR Unified addresses all four with the same rule set that CAREvolved v1.12 shipped — findings parity is preserved.

## Highlights

- **Same findings as CAREvolved v1.12.0.242** — no regression on rule coverage; adds custom **CARBP** rules on top.
- **Multi-root source support** — merge multiple metadata roots (base, custom models, partner deliverables) into one virtual workspace.
- **UDE + Tier-1 support** — same config shape on both.
- **Office-free Excel output** — reports render without a local Office install; safe to run on agents.
- **Auto-target derivation** — report targets are inferred from the models your build produces; no manual model lists.
- **Two ship modes**
  - `CarUnified-v1.0.0.zip` — run locally on a dev VM. Extract, edit `CarUnified.config`, run `CarUnified.exe`.
  - `CarUnified-Pipeline-v1.0.0.zip` — Azure DevOps pipeline pack (YAML + runner + integration snippet). Drop into your repo's `pipelines/` folder.

## Status

**v1.0.0** — production-ready. Microsoft-internal; access via the linked repo. Maintainer: Vinod Kumar K J (AIBS).
