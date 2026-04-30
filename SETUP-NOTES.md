# Personal Site — Setup Notes

> Reference notes for `vjanardhana12.github.io` — the personal hub for tools, kits, guides, videos, blog posts and snippets.
>
> Save this anywhere (OneNote, OneDrive, Notion, etc.). Everything you need to maintain the site after this session is here.

---

## 1. Identity & accounts

| Item | Value |
|---|---|
| Personal GitHub handle | `vjanardhana12` |
| Personal Gmail | `vinodkumar.kj@gmail.com` |
| Site URL (when live) | https://vjanardhana12.github.io |
| Repo (to be created) | https://github.com/vjanardhana12/vjanardhana12.github.io |
| GoatCounter dashboard | https://vjanardhana12.goatcounter.com/ |
| GoatCounter account name | `vjanardhana12` |
| GoatCounter tracking endpoint | `https://vjanardhana12.goatcounter.com/count` |

## 2. Local folder

```
D:\GitHub\GitHub-Personal\vjanardhana12.github.io
```

If laptop changes / leave MS:
```powershell
git clone https://github.com/vjanardhana12/vjanardhana12.github.io.git
```

## 3. Tech stack (all free, $0 forever)

| Component | Tool | Version / notes |
|---|---|---|
| Static site generator | Hugo (Extended) | 0.160.1 |
| Theme | Blowfish | vendored under `themes/blowfish/` |
| Hosting | GitHub Pages | free for public repos |
| Build/deploy | GitHub Actions | free tier (~2000 min/mo, you'll use ~5) |
| Video hosting | YouTube (your channel) | embed in cards/posts |
| Analytics | GoatCounter | free for personal/non-commercial |
| Comments (optional) | giscus (uses GitHub Discussions) | enable later if wanted |

## 4. Site identity

| Item | Value |
|---|---|
| Site name | Vinod Kumar K J |
| Tagline | *Notes, tools and tutorials on D365 F&O, AI, and whatever's next* |
| Default appearance | Dark (auto-switches with OS) |
| Theme color scheme | `blowfish` |

## 5. Naming convention — D365 F&O

| Where | Form |
|---|---|
| First mention in any post | "Dynamics 365 Finance & Operations" |
| Body of posts/guides | "D365 F&O" |
| Tags / URLs / slugs | `D365FO` (no spaces / no `&` — URL-safe) |
| Card descriptions | "D365 F&O" |

## 6. Content structure (5 buckets, expandable)

| Section | Type code | Icon | Folder |
|---|---|---|---|
| Tools & Kits | `tool` | 🛠️ | `content/projects/` |
| Guides & Docs | `guide` | 📚 | `content/guides/` |
| Videos | `video` | 📺 | `content/videos/` |
| Blog / Notes | (Markdown posts) | 📝 | `content/blog/` |
| Snippets / IP | `snippet` | 🧠 | `content/snippets/` |

Adding a new bucket later (e.g. Talks, Courses, Certifications) = one folder + one menu line + (optionally) a new `type` value.

## 7. Visibility badges

| Value | Badge | Use when |
|---|---|---|
| `public` | 🌐 Public | Anyone on the internet can access the linked asset |
| `ms-internal` | 🔒 Microsoft | Asset lives under `mcaps-microsoft` org or other MS-internal location |
| `private` | 🔐 On request | Customer IP / private gist / not publicly published |

The site shows the card for all three, but only `public` items have a clickable link by default.

## 8. Key files

| File | Purpose |
|---|---|
| `config/_default/hugo.toml` | Site basics (URL, title, language) |
| `config/_default/languages.en.toml` | Author info, social links, navigation menus |
| `config/_default/params.toml` | Theme settings (colors, layout, analytics) |
| `data/assets.yaml` | ⭐ **Single source of truth** — every asset card lives here |
| `content/_index.md` | Homepage |
| `content/about/_index.md` | About page |
| `content/blog/*.md` | One file per blog post |
| `layouts/shortcodes/asset-gallery.html` | Renders asset cards from YAML |
| `.github/workflows/deploy.yml` | Auto-build + deploy on git push to main |
| `README.md` | "How to add stuff" instructions |

## 9. Daily workflow

### Local preview

```powershell
cd D:\GitHub\GitHub-Personal\vjanardhana12.github.io
hugo server -D
# open http://localhost:1313
```

`-D` includes drafts. Live-reloads on save.

### Add a new asset (tool / video / guide / snippet)

Edit `data/assets.yaml`, append:

```yaml
  - title: "My new thing"
    type: tool                # tool | guide | video | snippet
    description: >
      One paragraph description.
    tags: [D365FO, PowerShell]
    visibility: public        # public | ms-internal | private
    url: "https://github.com/vjanardhana12/my-thing"
    repo: "vjanardhana12/my-thing"
    date: 2026-05-01
    featured: false           # true = show on homepage
```

Then:

```powershell
git add data/assets.yaml
git commit -m "Add: My new thing"
git push
```

Site rebuilds + deploys in ~1 min.

### Add a new blog post

```powershell
hugo new content blog/my-post-title.md
# edit the file under content/blog/
# set draft: false when ready
git add content/blog/my-post-title.md
git commit -m "Post: My post title"
git push
```

## 10. First-time setup checklist (one-time, after site goes live)

- [ ] Drop profile photo at `assets/img/avatar.jpg` (square, ≥400×400)
- [ ] Update LinkedIn URL in `config/_default/languages.en.toml`
- [ ] Update YouTube channel URL (when channel exists)
- [ ] Sign up for free [GoatCounter](https://www.goatcounter.com/)
  - Site code → paste into `config/_default/params.toml` under `[params.analytics.goatcounter]`
- [ ] Edit bio in `content/about/_index.md`
- [ ] In GitHub repo: **Settings → Pages → Source = "GitHub Actions"**
- [ ] Verify https://vjanardhana12.github.io/ loads

## 11. To go live (next session, after auth)

```powershell
# 1. Add personal GitHub account to gh CLI
gh auth login
# Pick: GitHub.com → HTTPS → Login with web browser
# In the browser: sign into vjanardhana12 first (sign out of work account in that tab if needed)
gh auth switch -u vjanardhana12

# 2. Verify
gh auth status
# Should list both accounts; "Active account: true" next to vjanardhana12

# 3. Create repo + push + enable Pages
cd D:\GitHub\GitHub-Personal\vjanardhana12.github.io
gh repo create vjanardhana12/vjanardhana12.github.io --public --source=. --remote=origin --push
gh api repos/vjanardhana12/vjanardhana12.github.io/pages -X POST -f build_type=workflow
```

Site goes live at **https://vjanardhana12.github.io/** in ~2 minutes after the GH Action finishes.

## 12. Reference links

| Resource | URL |
|---|---|
| Hugo docs | https://gohugo.io/documentation/ |
| Blowfish theme docs | https://blowfish.page/ |
| Blowfish samples | https://blowfish.page/samples/ |
| GitHub Pages docs | https://docs.github.com/en/pages |
| GitHub Actions docs | https://docs.github.com/en/actions |
| GoatCounter (analytics) | https://www.goatcounter.com/ |
| Your GoatCounter dashboard | https://vjanardhana12.goatcounter.com/ |
| giscus (comments via GH Discussions) | https://giscus.app/ |
| Local preview (when `hugo server` running) | http://localhost:1313/ |
| YouTube Studio (when ready) | https://studio.youtube.com/ |
| GitHub CLI docs | https://cli.github.com/manual/ |

## 13. Git identity for this repo (already configured)

```
user.name  = Vinod Kumar K J
user.email = vinodkumar.kj@gmail.com
```

*(Per-repo only — does not affect MS work or Carlsberg repos.)*

To verify anytime:
```powershell
cd D:\GitHub\GitHub-Personal\vjanardhana12.github.io
git config --get user.name
git config --get user.email
```

## 14. Key principle: where to publish what

Before pushing anything new, ask: **"Is this generic / personally-owned, or tied to MS work?"**

| Asset | Where |
|---|---|
| Generic PowerShell, your own ideas, weekend projects | `vjanardhana12` (personal) |
| Tutorial videos, blog posts | `vjanardhana12` |
| Customer-specific kit (e.g., Carlsberg) | Customer ADO |
| MS-paid work / MS-owned IP | `mcaps-microsoft` org |

**Rule of thumb:** if you want to keep access after leaving MS, publish to personal from day one.

## 15. Storage budget

| Item | Size |
|---|---|
| Current site | ~10 MB |
| 10 years of regular use | < 1 GB |

⚠️ **Don't** keep the folder inside OneDrive — git + cloud sync = sync conflicts.

## 16. Privacy tip — hide your real email in commits

GitHub provides every account a "noreply" email like `12345678+vjanardhana12@users.noreply.github.com`.

Find yours at: https://github.com/settings/emails

To use it for commits in this repo:
```powershell
cd D:\GitHub\GitHub-Personal\vjanardhana12.github.io
git config user.email "12345678+vjanardhana12@users.noreply.github.com"
```

(Replace `12345678` with your actual GitHub user ID from the settings page.)

Result: your real Gmail stays private; commits still show your name + GitHub avatar.

## 17. What's already done in this session

- ✅ Hugo Extended 0.160.1 installed
- ✅ Site scaffolded at `D:\GitHub\GitHub-Personal\vjanardhana12.github.io\`
- ✅ Blowfish theme vendored (trimmed, ~7.5 MB)
- ✅ 5 sections wired (Tools / Guides / Videos / Blog / Snippets) + About
- ✅ Asset gallery shortcode reading from `data/assets.yaml`
- ✅ MCP Onboarding Kit pre-loaded as first asset (🔒 Microsoft)
- ✅ Hello blog post + About page seeded
- ✅ Social links, dark mode, search wired
- ✅ GitHub Actions workflow created (`.github/workflows/deploy.yml`)
- ✅ README with "how to add stuff" instructions
- ✅ `.gitignore` set up
- ✅ Git initialised on `main` with personal email
- ✅ Initial commit made (505 files)
- ✅ Builds cleanly: 22 pages, no warnings
- ✅ Local preview running at http://localhost:1313/

## 18. What's pending (next session)

1. Add personal GitHub account (`vjanardhana12`) to the `gh` CLI — see section 11
2. Create the GitHub repo and push
3. Enable GitHub Pages (Source = GitHub Actions)
4. Optional polish:
   - Add profile photo
   - Set real LinkedIn / YouTube URLs
   - Sign up for GoatCounter & paste code
   - Write the first proper blog post (D365 F&O MCP Onboarding Kit walkthrough)
   - Buy a custom domain (optional, ~$10/yr — skip unless you really want one)

---

*Last updated: 2026-04-24*
