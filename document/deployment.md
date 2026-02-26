# Deployment

How to run the site locally and deploy it to GitHub Pages.

---

## Local development

1. **Prerequisites**
   - [Hugo (Extended)](https://gohugo.io/installation/) installed.

2. **Run the site**
   ```bash
   cd mysite
   hugo server
   ```
   Open **http://localhost:1313/** in your browser. Changes to content and config reload automatically.

3. **Build only (no server)**
   ```bash
   cd mysite
   hugo --minify
   ```
   Output is in `mysite/public/`.

---

## Deploy to GitHub Pages

The site is deployed with **GitHub Actions** on every push to `main`.

### One-time setup

1. **Create a GitHub repository**
   - Create a new repo (e.g. `portfolio`) and push this project to it.

2. **Enable GitHub Pages**
   - Repo → **Settings** → **Pages**
   - Under **Build and deployment**, set **Source** to **GitHub Actions**.

3. **Branch**
   - The workflow runs on the **`main`** branch. If your default branch is `master`, either:
     - Rename the default branch to `main` in **Settings** → **General**, or  
     - Edit `.github/workflows/hugo-pages.yml` and change `branches: ["main"]` to `branches: ["master"]`.

### How deployment works

- **Workflow file:** `.github/workflows/hugo-pages.yml`
- **On push to `main`:** The workflow checks out the repo, installs Hugo Extended, builds the site from `mysite/` with the correct `baseURL`, and deploys the `mysite/public` folder to GitHub Pages.
- **Manual run:** **Actions** → **Deploy Hugo to GitHub Pages** → **Run workflow**.

### Your site URL

| Repo type | Example repo | Site URL |
|----------|--------------|----------|
| **Project site** | `portfolio` | `https://<username>.github.io/portfolio/` |
| **User/org site** | `<username>.github.io` | `https://<username>.github.io/` |

The workflow sets `baseURL` automatically from the repo name and owner.

### Custom domain (optional)

1. In the repo: **Settings** → **Pages** → **Custom domain**, enter your domain and follow GitHub’s DNS instructions.
2. Set the same base URL in the site:
   - Either in `mysite/hugo.toml`:  
     `baseURL = "https://yourdomain.com/"`
   - Or add a step in the workflow to pass `baseURL` (e.g. from a repo variable or secret) into the `hugo --baseURL` command.

---

## Environment and config

- **Local:** `baseURL` in `mysite/hugo.toml` is `http://localhost:1313/` for `hugo server`.
- **Production:** The GitHub Actions workflow overrides `baseURL` when running `hugo --baseURL ...`, so the built site uses the correct GitHub Pages (or custom) URL.
- **Theme:** Blowfish is used as a local theme under `mysite/themes/blowfish`. Theme options are in `mysite/config/_default/params.toml`.

---

## Troubleshooting

| Issue | What to do |
|-------|------------|
| **404 or “There isn’t a GitHub Pages site here”** | Confirm **Settings** → **Pages** → Source is **GitHub Actions**. Wait a few minutes after the first deploy. Check **Actions** for a successful run. |
| **Wrong base URL (broken links or assets)** | For a **project** repo, the URL must end with a trailing slash, e.g. `https://user.github.io/portfolio/`. The workflow sets this automatically; if you changed the repo name, re-run the workflow. |
| **Workflow fails on “Set base URL”** | The script uses `github.event.repository.name`. If you only use `workflow_dispatch`, the repo name is still available. Share the exact error if it persists. |
| **Hugo or theme build error** | Check the **Actions** log for the failing step. Ensure the theme is present under `mysite/themes/blowfish` (or adjust the workflow if you use Hugo modules for the theme). |
| **Drafts appear on the live site** | In production, Hugo is run with default options; drafts are excluded when `buildDrafts` is false in config. Ensure frontmatter has `draft: false` for published content. |

---

## Files involved in deployment

| Path | Purpose |
|------|---------|
| `.github/workflows/hugo-pages.yml` | Builds Hugo and deploys to GitHub Pages. |
| `mysite/hugo.toml` | Site title, theme, local `baseURL`. |
| `mysite/config/_default/` | Hugo and theme config (params, menus, languages). |
| `.gitignore` | Ignores `mysite/public/` so the built site is not committed. |
