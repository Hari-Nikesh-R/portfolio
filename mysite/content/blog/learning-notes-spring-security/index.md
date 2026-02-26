---
title: "Learning Notes: Spring Security (The Minimum Useful Setup)"
date: 2026-02-26
draft: false
description: "A practical baseline for Spring Security: auth, protected routes, and a clean mental model."
tags: ["blog", "spring-security", "spring-boot", "java"]
summary: "A minimum useful mental model for Spring Security."
---

## My baseline mental model

- **Authentication**: who are you?
- **Authorization**: what can you do?
- **Filter chain**: where requests are checked

## Minimum useful setup (for most apps)

- one public route (health/info)
- protected API routes
- role checks for admin-only actions
- consistent error responses for 401/403

## Notes I reuse when teaching

- keep rules readable (few matchers, clear intent)
- test 401 vs 403 explicitly
- don’t mix “session + JWT” in one sprint unless required

Related:

- If you’re teaching full stack, plug this into the (Teaching section removed).
