---
name: create-honor-content
description: Assists in creating or formatting new honor and award posts in the portfolio's honors section in the standard format.
---

# Create Honor Content Skill

This skill assists in formatting and creating honors, awards, and recognition posts for the portfolio website.

## Honors Section Overview

Posts in the honors section showcase awards, recognitions, notable alumni achievements, speaker honors, and academic/community accolades.

- **Content Path:** `portfolio/mysite/content/honors/<slug>/index.md`
- **Image Assets Path:** `portfolio/mysite/assets/images/<image_folder>/<image_name>`
- **Image References in Markdown & Frontmatter:** `images/<image_folder>/<image_name>`

---

## Formatting Requirements

Every honor post must follow this exact markdown structure:

### 1. Hugo Frontmatter (YAML)
```yaml
---
title: "<Honor / Award Title, e.g., Alumni Service Award @ Sri Eshwar College of Engineering 2026>"
date: YYYY-MM-DD
draft: false
featureimage: "images/<image_folder>/<feature_image_name>.png"
description: "<Brief description of the honor, award, or recognition received>"
tags: ["honor", "award", <other relevant tags, e.g., "alumni", "recognition", "mentor", "speaker">]
aliases: ["/talks/<slug>/", "/community/<slug>/"]  # Optional: include if replacing or cross-linking legacy routes
---
```

### 2. Main Content Format

Honors posts typically follow one of two variations depending on whether they represent an award/credential or an honor ceremony/event:

#### Option A: Award / Credential Post (Standard Recognition)
```markdown
![<Banner / Feature Description>](images/<image_folder>/<feature_image_name>.png)

## <Honor / Award Subheading>
**Issued by:** <Issuing Organization / Institution> · <Month Year>  
**Associated with:** <Associated Organization / Event / College>

<Narrative explaining the award, why it was given, what it represents, and personal reflections.>

---

![<Award Moment / Trophy / Certificate>](images/<image_folder>/<image_name_2>.png)

---

## Relevant Links

- **LinkedIn:** [Post Link](<LinkedIn URL>)
```

#### Option B: Event / Ceremony Honors Post (Detailed Narrative)
```markdown
![<Event Preview>](images/<image_folder>/<feature_image_name>.png)

# Event Summary

<Description and background of the event, ceremony, or occasion where the honor was received.>

![<Ceremony / Presentation Moment>](images/<image_folder>/<image_name_2>.png)

<Additional context, interactions with students, faculty, or community.>

---

# My Contribution / Learnings

<Reflections on the honor, mentorship efforts, lessons learned, and words of gratitude.>

![<Additional Photo>](images/<image_folder>/<image_name_3>.png)

> **<Inspiring takeaway or personal quote, e.g., Your journey becomes more meaningful when you use what you have learned to help someone else move forward.>**

<Closing acknowledgments and thanks.>

---

## Relevant Links

- **LinkedIn:** [Post Link](<LinkedIn URL>)
```

---

## Step-by-Step Instructions

1. **Extract/Request Info**:
   - If not already provided by the user, extract or ask for:
     - **Title** (e.g., `Alumni Service Award @ Sri Eshwar College of Engineering 2026`)
     - **Date** (YYYY-MM-DD; must not be in the future relative to UTC, e.g. current or event date)
     - **Description** (1-2 sentence summary for meta/preview)
     - **Issuer / Organization** (e.g., `Sri Eshwar College of Engineering`, `Bangalore Java User Group`)
     - **Event / Story Content** (Summary, contributions, learnings, key quotes)
     - **Images** (Folder name and image file names)
     - **Relevant Links** (e.g., LinkedIn post URL)
     - **Tags** (Always include `"honor"` and `"award"`, plus specific tags like `"alumni"`, `"mentorship"`, `"recognition"`)

2. **Generate Slug**:
   - Create a URL-friendly lowercase kebab-case slug based on the title (e.g., `alumni-service-award-sece-2026`, `best-alumni-2023-cce`).

3. **Determine Filepath**:
   - The markdown post must be saved at:
     `portfolio/mysite/content/honors/<slug>/index.md`

4. **Asset Placement Verification**:
   - Images are loaded from Hugo assets: `portfolio/mysite/assets/images/<image_folder>/`
   - Paths in markdown and frontmatter must be referenced as `images/<image_folder>/<image_name>`.

5. **Draft and Write Content**:
   - Construct the frontmatter and markdown body adhering to the template above.
   - Write the file to `portfolio/mysite/content/honors/<slug>/index.md`.
   - Remind the user to place any referenced images into `portfolio/mysite/assets/images/<image_folder>/`.
