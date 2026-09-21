---
title: "D365 F&O NuGet Sync Tool"
description: "One-click sync of D365 F&O NuGet packages from LCS Shared Asset Library to Azure DevOps Artifacts."
date: 2026-09-21
tags: [D365FO, PowerShell, ALM, DevOps, NuGet, Azure-DevOps]
download: "https://github.com/vjanardhana12/d365fo-nuget-sync/releases/latest/download/Sync-D365FONuGet.zip"
repo: "https://github.com/vjanardhana12/d365fo-nuget-sync"
version: "1.0.0"
visibility: "public"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

One-click sync of the **core D365 F&O NuGet package set** from the **LCS Shared Asset Library** to your **Azure DevOps Artifacts** feed.

- **Smart compare** — queries your ADO feed first, only pushes what's missing or newer. No wasted uploads.
- **Parallel uploads** — up to 3 concurrent. Big 350 MB packages don't block each other.
- **Safe by default** — your PAT isn't stored between runs. Per-user config in `%LOCALAPPDATA%`.
- **Self-updating** — silently checks GitHub for newer versions on startup.
- **No setup** — no PowerShell modules, no NuGet CLI install, no AAD app. Just double-click.

## Quick start

1. Click **Download** above to get the latest `Sync-D365FONuGet.zip`.
2. Right-click the zip → **Properties → Unblock**, extract it, then double-click **`Sync-D365FONuGet.bat`** — it works even where `.exe` files are blocked. (Prefer the app? `Sync-D365FONuGet.exe` is in the zip too.)
3. Provide your ADO feed, email, and PAT on first run (saved per-user; PAT not stored between runs).
4. Re-run anytime — only new packages get uploaded (~30 sec for "all in sync").

## Why it matters

D365 F&O builds need the right NuGet packages from LCS present in your ADO feed. Each platform version is a set of 5 packages totalling **~2 GB**, which you'd otherwise download from LCS and push to Azure DevOps by hand — slow and easy to get wrong. This tool does it in one click and about 30 seconds.

Open source under MIT License.
