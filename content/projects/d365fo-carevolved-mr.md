---
title: "D365 F&O CAREvolved Multi-Root"
description: "Multi-root CAR / Best Practices runner for Dynamics 365 Finance & Operations. Runs BP checks across multiple metadata roots in parallel on UDE and CHE / Tier-1 dev VMs."
date: 2026-05-30
tags: [D365FO, BP, PowerShell, DevOps]
repo: "https://github.com/mcaps-microsoft/D365FO-CAREvolved-MR"
version: "0.1.0"
visibility: "ms-internal"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A **PowerShell-based CAR (Code Analysis Report) / Best Practices runner** built for real-world D365 F&O codebases that span **multiple metadata roots** — the kind you get on large engagements with several custom models, partner models, and ISV layers sitting side by side.

It merges those roots into a single virtual workspace, runs BP checks **in parallel**, and produces a consolidated report you can ship to a PR review or an ADO work item.

## Why it exists

The stock BP runner assumes one `PackagesLocalDirectory` and one set of models. The moment you have:

- A Tier-1 dev VM with the standard package directory **plus** a side-loaded customer metadata folder, or
- A UDE / cloud-hosted dev box where your custom models live outside the default packages path, or
- Multiple partner deliverables that need to be analysed together before a release,

…you end up running BP three or four times, manually stitching the outputs, and missing cross-model issues entirely.

CAREvolved MR fixes that with a single config and one command.

## Highlights

- **Multi-root by design** — point it at any number of metadata directories; it builds a unified model lookup and runs BP once across the lot.
- **Works on UDE *and* Tier-1 / CHE dev VMs** — same config shape, different paths.
- **Parallel execution** — packages are analysed concurrently with a configurable thread cap so large codebases finish in minutes, not hours.
- **Consolidated output** — one HTML / JSON report covering every root, ready to attach to a PR.
- **CI-friendly** — exit codes and machine-readable output mean you can wire it into an Azure DevOps pipeline as a gate.

## Status

**v0.1.0** — early but usable. Microsoft-internal; access via the linked repo above.
