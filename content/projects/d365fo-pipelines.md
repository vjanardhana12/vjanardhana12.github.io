---
title: "D365 F&O Azure DevOps Pipelines"
description: "Reusable Azure DevOps YAML pipelines for Dynamics 365 F&O (X++) — PR/main/release CI, deployable LCS package, ISV NuGet publish, auto package-version floating, and rich release notes with optional wiki publish."
date: 2026-08-12
tags: [D365FO, Azure-DevOps, Pipeline, ALM, DevOps, Release-Notes, NuGet]
repo: "https://github.com/microsoft/Pipelines-for-Finance-and-Operations"
visibility: "public"
showReadingTime: false
showWordCount: false
showAuthor: false
---

## What it does

A set of **reusable Azure DevOps YAML pipelines and supporting assets** for Dynamics 365 Finance & Operations (X++) projects, covering the full build/release loop: compile X++, produce a deployable LCS package, publish an ISV NuGet, float package dependencies, and generate rich release notes.

The templates are **generic** — every project-specific value is marked with a `TODO` or an obvious placeholder, so you copy them in, search for `TODO`, and fill in your specifics.

## How it fits together

- **PR builds** (`pr-ci.yaml`) validate compilation before merge.
- **main / release builds** (`main-ci.yaml`, `release-ci.yaml`) compile, stamp the model version, and produce a deployable package for LCS; optionally float NuGet dependencies and generate release notes.
- **ISV pipelines** publish add-on models (source or binary) to your Azure Artifacts feed, which the main build references as dependencies.
- **Release notes** stage collects PRs + linked work items and adds a **Changed Objects by Type** section and **Package Versions** — with optional publish to the project wiki.

## Which pipeline do I use?

| Scenario | Use |
|---|---|
| Your own implementation model, source in Git | **Main development** |
| An ISV/add-on you own the source of, consumed via NuGet | **ISV Source code** |
| A third-party ISV delivered as compiled binaries | **ISV Binary** |

## What's inside

- `main-ci.yaml` / `pr-ci.yaml` / `release-ci.yaml` — build validation, deployable package, release notes
- Classic (designer) release definitions to import & remap — with and without wiki publish
- `Update-PackageVersions.ps1` — float `packages.config` to latest feed versions
- `Invoke-PackageUpdateWorkflow.ps1` — optional auto-PR with bumped versions
- `Enrich-ReleaseNotes.ps1` — add "Changed Objects by Type" + "Package Versions"
- `release-notes-template.md` — Handlebars template for XplatGenerateReleaseNotes
- `samples/` — a fully worked "Contoso" example (custom model + two ISVs) and the release notes it produces
- `docs/variable-groups.md` — `LCSEnvironments` & `AutoPackageUpdater-Config` setup

## Prerequisites

- An Azure DevOps project with an **Artifacts NuGet feed** for ISV/dependency packages.
- Repo layout: X++ under `src/xpp/metadata`, build solution under `src/xpp/xppBuild/AzureBuild`.
- For **release notes**: the free Marketplace extensions **Generate Release Notes** (XplatGenerateReleaseNotes) and, for wiki publish, **Wiki Updater Tasks**.

## Status

Living template repository under `microsoft/` on GitHub — public and open to any GitHub account via the linked repo.
