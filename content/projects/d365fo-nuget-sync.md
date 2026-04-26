---
title: "D365 F&O NuGet Sync Tool"
description: "One-click sync of D365 F&O NuGet packages from LCS Shared Asset Library to Azure DevOps Artifacts."
date: 2026-04-25
tags: [D365FO, PowerShell, ALM, DevOps, NuGet, Azure-DevOps]
download: "https://github.com/vjanardhana12/d365fo-nuget-sync/releases/latest/download/Sync-D365FONuGet.zip"
repo: "https://github.com/vjanardhana12/d365fo-nuget-sync"
version: "1.0.1"
visibility: "public"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

One-click sync of the **core D365 F&O NuGet package set** from the **LCS Shared Asset Library** to your **Azure DevOps Artifacts** feed.

- **Smart compare** — queries your ADO feed first, only pushes what's missing or newer. No wasted uploads.
- **Parallel uploads** — up to 3 concurrent. Big 350 MB packages don't block each other.
- **Safe by default** — PAT never saved. Per-user config in `%LOCALAPPDATA%`.
- **Self-updating** — silently checks GitHub for newer versions on startup.
- **No setup** — no PowerShell modules, no NuGet CLI install, no AAD app. Just the EXE.

## Quick start

1. Click **Download** above to get the latest `Sync-D365FONuGet.zip`.
2. Extract and double-click `Sync-D365FONuGet.exe`.
3. Provide your ADO org, feed, and PAT on first run (saved per-user).
4. Re-run anytime — only new packages get uploaded (~30 sec for "all in sync").

## Why it matters

D365 F&O development requires the right NuGet packages from LCS to be present in your ADO feed for builds and packaging. Manual download/upload is slow, error-prone, and uses ~2 GB per release. This tool reduces that to one click and ~30 seconds.

Open source under MIT License.
