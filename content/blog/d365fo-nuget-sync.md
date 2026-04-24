---
title: "D365 F&O NuGet Sync — one-click LCS to Azure DevOps Artifacts"
date: 2026-04-24
draft: false
description: "A small PowerShell tool that compares your ADO feed with local .nupkg files and pushes only what's missing. Single EXE. Open source."
tags: ["D365FO", "PowerShell", "ALM", "DevOps", "NuGet"]
showHero: false
showReadingTime: true
---

If you've set up a D365 F&O build pipeline, you know the drill. Microsoft drops a new platform version on the **LCS Shared Asset Library**, you download 5 NuGet packages (one of them 450 MB), and push them to your **Azure DevOps Artifacts feed** with `nuget push` — one at a time. Easy to miss a package. Easy to push duplicates and get `409 Conflict`. Easy to lose track of which version is in the feed.

I got tired of that, so I built a small tool.

## What it does

**One click. Compare. Push only what's needed.**

![Banner and saved configuration](/img/blog/d365fo-nuget-sync/01-banner-config.png)

The tool reads your ADO feed first, lists what's already there, then scans your local folder for `.nupkg` files. You get a clean SKIP / PUSH / MISSING table — no surprises.

![Compare table and parallel push](/img/blog/d365fo-nuget-sync/02-compare-push.png)

If anything's missing, it opens LCS in your browser. You drop the files in the folder, the tool detects them, and queues them for push. Up to **3 parallel uploads** by default (configurable), so the big 350 MB packages don't block each other.

![Success card with summary](/img/blog/d365fo-nuget-sync/03-success.png)

## Why not just use the LCS API?

Short answer: the LCS API requires AAD app registration, client secrets, and project IDs to manage. And Microsoft is migrating away from LCS to **PPAC (Power Platform Admin Center)** — investing in LCS API integration is a dead end.

The semi-automated approach (script → opens LCS → you click download → script pushes) gives you 90% of the automation with 10% of the setup pain. When PPAC fully takes over, the tool will be updated to point at the new location.

## How to get it

- **Download:** [github.com/vjanardhana12/d365fo-nuget-sync/releases/latest](https://github.com/vjanardhana12/d365fo-nuget-sync/releases/latest)
- **Source:** [github.com/vjanardhana12/d365fo-nuget-sync](https://github.com/vjanardhana12/d365fo-nuget-sync)
- **License:** MIT

A single 54 KB `.exe`. Double-click it. Enter your ADO feed URL and email once (saved per-user to `%LOCALAPPDATA%`). Generate a PAT with **Packaging (Read & Write)** scope. Done.

## What's in the box

| | |
|---|---|
| **Smart compare** | Queries your feed first — skips packages already in the feed |
| **Parallel uploads** | Up to 3 concurrent (use `-MaxParallel <N>` to tune) |
| **Per-user config** | Feed URL/email saved, PAT never written to disk |
| **Self-update check** | Silently checks GitHub on startup, tells you if there's a newer version |
| **PowerShell 5.1 + 7+** | Works on any modern Windows |
| **No LCS API / AAD app** | Browser-based asset library access, no service principal needed |

## Why open source?

Because every D365 F&O dev hits this same problem, and a tool that solves it for one team should solve it for everyone. MIT-licensed, source on GitHub, fork it and customize for your org if you want.

If you find a bug or want a feature, [open an issue](https://github.com/vjanardhana12/d365fo-nuget-sync/issues). Pull requests welcome.

---

Built in a couple of evenings. Polished, tested, released. Sometimes the most useful tools are the small ones.
