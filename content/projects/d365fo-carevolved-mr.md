---
title: "CAREvolved-MR"
description: "Code Analysis Report tool for Microsoft Dynamics 365 F&O — Multi-Root variant. Source-driven local builds with X++ compile, BP, and AppChecker across multiple metadata roots, producing a Word + Excel CAR report."
date: 2026-05-26
tags: [D365FO, CAR, Code-Analysis, Best-Practices, AppChecker, Multi-Root]
repo: "https://github.com/mcaps-microsoft/D365FO-CAREvolved-MR"
download: "https://github.com/mcaps-microsoft/D365FO-CAREvolved-MR/releases/latest"
version: "1.12.1.0"
visibility: "ms-internal"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A fork of the Microsoft `CAREvolved` CAR runner (1.12.0.x line) re-engineered for **source-driven, multi-root local builds**. Runs the X++ compiler (`xppc`), best-practice analyzer (`xppbp`), and AppChecker against your custom packages and produces a Word + Excel **Code Analysis Report (CAR)**.

## What's different in `-MR`

| Capability | `-MR` behaviour |
|---|---|
| **Multi-root metadata** | `MetadataFolderPath` accepts multiple semicolon-separated source repos; the runner builds a unified runtime view via NTFS junctions and removes them on exit |
| **Optional `-xref`** | `xppc -xref` is **off by default** (silently fails to emit DLLs without SQL Server). Opt in via `EnableXref` |
| **Hidden `xppc`** | Runs hidden + stdio is teed into `Xppc-Stdio-<Pkg>.txt` |
| **Mtime-aware dep cache** | Dependency packages rebuild only when source `Ax*.xml` mtime is newer than the existing DLL — typical incremental run drops to **~1 minute** |
| **Per-dep build reason** | Console log shows `Cached: A, B, C` plus `[i/N] X (source newer by 2h 14m) <- referenced by: ...` |
| **PLD\\bin auto-mirror** | After each target builds, its DLL (and deps) are copied into `PackagesLocalDirectory\\bin\\` so downstream targets and `xppbp` resolve them in the canonical location — eliminates thousands of false cross-package errors on cloud VMs |
| **Output folder reorg** | Per-package noise moved into `compiler\\`, `bp\\`, `appchecker\\` subfolders. Root keeps only user-facing artifacts (Word, Excels, RunSummary log) |

## Quick start

1. Ships with a default `CAREvolved.config` (VM-style, PLD at `K:\\AosService\\PackagesLocalDirectory`). Edit the `TODO` placeholders.
2. For UDE local dev boxes, use the included `CAREvolved.UDE.config`:
   ```cmd
   CAREvolved.exe -p="CAREvolved.UDE.config"
   ```
3. Run `CAREvolved.exe`.
4. Find the report in your configured `OutputFolderPath`.

A typical run takes **~20 min on UDE** or **~30 min on a cloud VM** for a 3-package model set; cached incremental runs are **~1 minute**.

### First-time setup (UDE only)

1. Run `Setup\\Setup-CAREvolved-Env.cmd` **as Administrator** — sets the `DynamicsVSTools` environment variable.
2. Run `Setup\\Prepare-PLD.ps1` — compiles label resources for all standard PLD packages to avoid `BPErrorUnknownLabel` false positives (~20-30 min first run; subsequent runs detect the marker and skip).

On a cloud-hosted VM, no setup is needed.

## Why it matters

Standard CAREvolved targets a single metadata root and rebuilds dependencies every run, taking 30+ minutes per pass even when nothing changed. The **-MR variant** is built for real-world multi-repo projects (HUB + Foundation + ISV) where developers need fast, iterative CAR runs on their dev box — incremental runs land in a minute, and the PLD\\bin auto-mirror eliminates the classic "thousands of false errors" problem on shared cloud VMs.

Published under **mcaps-microsoft** — visible to any Microsoft colleague on the EMU.
