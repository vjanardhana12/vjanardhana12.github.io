# vjanardhana12.github.io

Personal site of **Vinod Kumar K J** — a hub for tools, kits, guides, videos, blog posts and snippets.

**Live:** https://vjanardhana12.github.io

Built with [Hugo](https://gohugo.io/) + the [Blowfish](https://blowfish.page/) theme.
Deployed automatically by GitHub Actions on every push to `main`.

---

## How to add stuff

### 1. Add a new asset (tool / video / guide / snippet)

Open [`data/assets.yaml`](data/assets.yaml) and append a block:

```yaml
  - title: "My new PowerShell helper"
    type: tool                # tool | guide | video | snippet
    description: >
      One-paragraph summary of what it is and why someone would use it.
    tags: [PowerShell, D365FO]
    visibility: public        # public | ms-internal | private
    url: "https://github.com/vjanardhana12/my-helper"
    repo: "vjanardhana12/my-helper"
    date: 2026-05-01
    featured: false           # set true to show on homepage
```

Commit + push. Site rebuilds in ~1 minute.

### 2. Write a blog post

```bash
hugo new content blog/my-post-title.md
```

Edit the new file under `content/blog/`. Set `draft: false` when ready to publish.

### 3. Add a video

Either:
- Add it as an `asset` of type `video` (appears on /videos/), OR
- Create a new file `content/videos/walkthrough-name.md` with the YouTube URL embedded — it appears as a full page.

### 4. Add a guide / how-to

```bash
hugo new content guides/setup-something.md
```

Edit, commit, push.

---

## Local preview

```powershell
cd D:\GitHub-Personal\vjanardhana12.github.io
hugo server -D
# open http://localhost:1313
```

The `-D` flag includes drafts. Live-reloads on save.

---

## First-time setup checklist

After scaffolding, do these once:

- [ ] Add profile photo at `assets/img/avatar.jpg` (square, ≥400x400)
- [ ] Update social links in `config/_default/languages.en.toml` → `[params.author]`
  - LinkedIn URL
  - YouTube channel URL (if you have one)
- [ ] Sign up for free [GoatCounter](https://www.goatcounter.com/) analytics → paste site code into `config/_default/params.toml` → `[params.analytics.goatcounter]`
- [ ] Edit `content/about/_index.md` with the bio you want
- [ ] Push to `https://github.com/vjanardhana12/vjanardhana12.github.io`
- [ ] In GitHub repo Settings → Pages → set Source = "GitHub Actions"

---

## Folder map

```
.
├── config/_default/        # Site config (TOML, split by concern)
├── content/                # All site content
│   ├── _index.md           # Homepage
│   ├── about/              # About page
│   ├── blog/               # Blog posts (one .md per post)
│   ├── guides/             # Guides (one .md per guide)
│   ├── projects/           # Tools & Kits — auto-listed via asset gallery
│   ├── snippets/           # Snippets — auto-listed via asset gallery
│   └── videos/             # Videos — auto-listed via asset gallery
├── data/
│   └── assets.yaml         # ⭐ Single source of truth for asset cards
├── layouts/shortcodes/
│   └── asset-gallery.html  # Renders cards from assets.yaml
├── assets/img/             # Profile photo, theme images
├── static/                 # Files served as-is (PDFs, downloads)
├── themes/blowfish/        # Vendored theme (do not edit directly)
└── .github/workflows/      # GitHub Actions: build + deploy
```

---

## Visibility convention

| `visibility` value | Card badge | Use when |
|---|---|---|
| `public` | 🌐 Public | Anyone on the internet can access the linked asset |
| `ms-internal` | 🔒 Microsoft | Asset lives under `mcaps-microsoft` GitHub org or other MS-internal location |
| `private` | 🔐 On request | Customer IP, private gist, or otherwise not publicly available |

The site shows the card for all three, but only `public` items have a clickable link by default.

---

© 2026 Vinod Kumar K J. Site source code is MIT-licensed; content is © Vinod Kumar K J unless stated otherwise.
