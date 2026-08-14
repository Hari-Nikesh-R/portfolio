---
name: create-community-content
description: Assists in creating or formatting new community content posts in the portfolio's community section in the standard format.
---

# Create Community Content Skill

This skill assists in formatting and creating community event posts for the portfolio website.

## Formatting Requirements

Every community event post must follow this exact markdown structure:

### 1. Hugo Frontmatter (YAML)
```yaml
---
title: "<Title of the Event>"
date: YYYY-MM-DD
draft: false
featureimage: "images/<slug>/<feature_image_name>.png"
description: "<Brief description of the event>"
tags: ["community", <other relevant tags>]
aliases: ["/talks/<slug>/"]
communityRoles: [<roles: "speaker" | "organizer" | "attendee">]
---
```

### 2. Event Summary Section
```markdown
# Event Summary

<Event summary content>
```

### 3. My Contribution / Learnings Section
```markdown
# My Contribution / Learnings

<My Contribution or Learnings content>
```

## Step-by-Step Instructions

1. **Extract/Request Info**:
   - If not already provided by the user, extract or ask for:
     - **Title**
     - **Event Summary**
     - **My Contribution / Learnings**
     - **Date** (YYYY-MM-DD; must not be in the future relative to UTC)
     - **Roles** (Allowed roles: `speaker`, `organizer`, `attendee` only)
2. **Generate Slug**:
   - Create a URL-friendly slug based on the title (e.g. `guest-speaker-sece-2026`).
3. **Determine Filepath**:
   - The post must be created at `portfolio/mysite/content/community/<slug>/index.md`.
4. **Draft Content**:
   - Construct the frontmatter and the content sections using the exact markdown format above.
5. **Create/Write the File**:
   - Write the content to the target file.
   - If images are used or needed, remind the user to place them under `portfolio/mysite/content/community/<slug>/images/`.
