# Adding content

How to add new posts, pages, images, and update the menu and homepage in this Hugo + Blowfish template.

---

## Content structure

All content lives under **`mysite/content/`**:

```
mysite/content/
├── _index.md              # Homepage
├── teaching/
│   ├── _index.md          # Section landing page
│   └── my-post/
│       └── index.md       # Post as a “page bundle”
├── talks/
├── workshops/
├── community/
├── projects/
├── blog/
├── about/
│   └── index.md
└── community-mixer/
    └── index.md
```

- **Section:** A folder with `_index.md` (e.g. `teaching/`, `blog/`). The section lists all posts inside it.
- **Post:** Either a single `mysite/content/blog/my-post.md` or a **page bundle** (folder with `index.md`), e.g. `mysite/content/blog/my-post/index.md`. Bundles are useful when you add images or assets next to the post.
- **Homepage:** `content/_index.md`; its body is the main dashboard.

---

## Adding a new post (article)

### Option A: Single file

Create a file, e.g. `mysite/content/blog/my-new-post.md`:

```markdown
---
title: "My new post"
date: 2026-02-26
draft: false
description: "Short description for SEO and cards."
tags: ["blog", "java", "spring-boot"]
featureimage: "images/spring-boot.svg"
summary: "One line shown in list/card previews."
---

Your content here. Use [internal links](/teaching/) and **markdown**.
```

### Option B: Page bundle (post + its own images)

Create a folder and put the post in `index.md`:

```
mysite/content/blog/my-new-post/
├── index.md
└── featured.png    # optional: image next to this post
```

**`mysite/content/blog/my-new-post/index.md`:**

```markdown
---
title: "My new post"
date: 2026-02-26
draft: false
description: "Short description."
tags: ["blog", "java"]
summary: "Preview line."
---

Body content. If you added featured.png in this folder, Blowfish can use it
as the card/feature image without setting featureimage.
```

For Blowfish, a file in the same folder named like `featured.png`, `feature.jpg`, or `thumbnail.png` is picked automatically as the feature image if you don’t set `featureimage` in frontmatter.

---

## Frontmatter reference

Use this in the **top of every content file** (between `---` and `---`).

| Field | Required | Description |
|-------|----------|-------------|
| `title` | Yes | Page or post title. |
| `date` | Recommended | Publication date (e.g. `2026-02-26`). |
| `draft` | Recommended | `true` = not built in production; `false` = published. |
| `description` | Recommended | Used for SEO and social cards. |
| `tags` | Optional | List, e.g. `["java", "spring-boot", "teaching"]`. |
| `summary` | Optional | Short text for list/card previews; if missing, Hugo uses the start of the body. |
| `featureimage` | Optional | Path for card/hero image. Use `images/filename.svg` (from `assets/`) or a path relative to site root. |
| `layout` | Optional | e.g. `page`, `list`. Section `_index.md` often uses `layout: "list"`. |

**Example (full):**

```yaml
---
title: "Workshop: Spring Boot REST API"
date: 2026-03-01
draft: false
description: "Hands-on workshop outline for building a REST API with Spring Boot."
tags: ["workshop", "spring-boot", "rest"]
featureimage: "images/workshops.svg"
summary: "A 90-minute hands-on Spring Boot REST workshop."
layout: "list"
showCards: true
showSummary: true
cardView: true
---
```

For **section landing pages** (`_index.md`), `layout: "list"`, `showCards: true`, `showSummary: true`, and `cardView: true` make the section show as a grid of cards.

---

## Adding and using images

### 1. Site-wide images (recommended for shared art)

Put images in **both** places so they work in content and as Blowfish feature images:

- **`mysite/static/images/`**  
  Use in markdown with a root-relative path: `/images/yourfile.png`.
- **`mysite/assets/images/`**  
  Use in frontmatter as `featureimage: "images/yourfile.png"` (Blowfish resolves this via Hugo’s `resources.Get` from `assets/`).

**In the body of a post:**

```markdown
![Alt text](/images/yourfile.png)
```

**As card/feature image (frontmatter):**

```yaml
featureimage: "images/yourfile.png"
```

Use the same filename in both folders (e.g. `teaching.svg`, `hero.jpg`) so links and cards stay in sync.

### 2. Image next to one post (page bundle)

For a single post, you can keep an image in that post’s folder:

```
mysite/content/blog/my-post/
├── index.md
└── featured.png
```

Name the file `featured.*`, `cover.*`, or `thumbnail.*` (e.g. `featured.png`). Blowfish will use it for that post’s card/feature image if `featureimage` is not set.

### 3. Supported formats

Use **PNG**, **JPG**, or **SVG** for best compatibility. SVG is good for icons and graphics; PNG/JPG for photos.

---

## Adding a new section (e.g. “Events”)

1. **Create the section folder and landing page**
   - Create folder: `mysite/content/events/`
   - Create `mysite/content/events/_index.md`:

   ```markdown
   ---
   title: "Events"
   date: 2026-02-26
   draft: false
   description: "Upcoming and past events."
   tags: ["events"]
   layout: "list"
   showCards: true
   showSummary: true
   cardView: true
   ---

   Short intro for the section. Then list posts below.
   ```

2. **Add posts**
   - Add posts as `mysite/content/events/event-name/index.md` or `mysite/content/events/event-name.md` with the same frontmatter pattern as above.

3. **Add to the main menu**
   - Edit `mysite/config/_default/menus.en.toml` and add:

   ```toml
   [[main]]
     name = "Events"
     pageRef = "events"
     weight = 65
   ```
   Adjust `weight` so the order (Teaching, Talks, …) is correct (lower = earlier in the menu).

4. **Link from the homepage**
   - Edit `mysite/content/_index.md`: add a link under “Quick links” and, if you want, a new card in the dashboard grid pointing to `/events/`.

---

## Updating the homepage

- **File:** `mysite/content/_index.md`
- **Layout:** The site uses the “page” homepage layout, so the body of `_index.md` is the main content (intro, grid, featured block).

You can:

- Change the intro and bio at the top.
- Edit the **Quick links** list.
- Edit the **Dashboard** grid: each block is an `<a href="/section/">` with title and bullets; duplicate a block and change `href`, title, and list to add a section.
- Change **Featured** articles: the homepage uses the Blowfish `article` shortcode, e.g.:

  ```markdown
  {{< article link="/projects/basketball-community-app/" showSummary=true compactSummary=true >}}
  {{< article link="/teaching/java-full-stack-roadmap/" showSummary=true compactSummary=true >}}
  ```
  Add or replace lines with other post URLs to change the featured cards.

- Update the **Focus areas** list at the bottom.

Use normal markdown and the existing HTML/Tailwind classes (e.g. `not-prose`, `grid`, `rounded-lg`) to keep the same look.

---

## Blowfish shortcodes (optional)

You can use these in any content or the homepage:

| Shortcode | Example | Use |
|-----------|--------|-----|
| **article** | `{{< article link="/blog/my-post/" showSummary=true >}}` | Show a card/link to another post. |
| **alert** | `{{< alert "Note" "Your message" >}}` | Styled alert box. |
| **button** | `{{< button href="/teaching/" >}}Go to Teaching{{< /button >}}` | Styled button link. |

Shortcode docs: [Blowfish theme docs](https://blowfish.page/docs/).

---

## Checklist for new content

- [ ] Create the file (or folder + `index.md`) under the right section in `mysite/content/`.
- [ ] Add frontmatter: `title`, `date`, `draft: false`, `description`, `tags`, and optionally `summary`, `featureimage`.
- [ ] If using images: add to `mysite/static/images/` (and `mysite/assets/images/` if used as `featureimage`), or add `featured.*` in the post folder for a bundle.
- [ ] For a new section: add `_index.md`, then add the section to `menus.en.toml` and link from the homepage if desired.
- [ ] Run `hugo server` in `mysite` to preview; then push to `main` to deploy to GitHub Pages (see [Deployment](deployment.md)).
