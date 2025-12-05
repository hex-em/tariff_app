# Tariff App v0 – Scope & Sprint 1 Plan

**Product Name:** Tariff App (aka “Tariff Savings Automation” Platform)  
**Version:** v0 (MVP)  
**Document Type:** Scope & Sprint Plan  
**Owner:** Hector Miramontes  
**Date:** 2025‑12‑04  

**Sprint:** Sprint 1 – “Ship First Live Tariff App”  
**Timeframe:** 1–2 weeks  
**Status:** Draft  

**Product Goal (v0):**  
Deliver a minimal web app that lets a single user create, list/search, and calculate duty for basic tariff rules, deployed and usable from a browser.

**Success Criteria (Definition of Done):**  
- Rails app deployed with a public URL  
- `TariffRule` CRUD working end‑to‑end  
- Search by HS code working  
- Duty calculation working for a sample rule  

---

## Purpose

This document defines the smallest possible version of the tariff app that must exist for you to say: “I shipped a working web app.” It is a scope guardrail: if it’s not written here, it’s not part of v0.

---

## One-paragraph v0 spec

A simple web app where a single logged-in user (you) can create and store basic tariff rules (HS code, description, rate) and then look up a rule by HS code to see the matching rate and a simple duty estimate (rate × declared value). It runs on Rails, has one main page for listing/searching rules and one form for adding/editing them, and is deployed to a small cloud host so you can open it in a browser on your laptop or phone.

---

## Core data model

**Model: `TariffRule`**

- `hs_code` – string  
- `description` – text or string  
- `rate` – decimal (e.g. 0.05 for 5%)  

**Validation (v0):**

- `hs_code`: required, unique  
- `rate`: required, non-negative  

---

## User actions (v0 only)

### 1. Create a tariff rule

- Navigate to “New Tariff Rule” form.  
- Enter HS code, description, and rate.  
- Submit and see the new rule appear in the list.

### 2. List and search rules

- Visit the main page and see a table of all tariff rules.  
- Type an HS code (or prefix) into a search box.  
- See the list filter to matching rules.

### 3. Calculate duty for a rule

- On a rule’s detail page (or inline), enter a declared value.  
- Click “Calculate.”  
- See `duty = value × rate` displayed (e.g. “Rate: 5%, Value: 1000, Duty: 50”).

---

## Technical constraints for v0

- One Rails app.  
- One main model: `TariffRule`.  
- Standard Rails MVC (no extra patterns yet).  
- Access control can be minimal:
  - Even a single hard-coded HTTP basic auth, or just “no auth” for v0 is acceptable.  
- Seed 5–10 sample rules in `db/seeds.rb` so the app looks alive immediately after setup.  
- Deploy once to a simple host (Render/Fly/Railway/etc.) with a public URL you can open in a browser.

---

## Out of scope for v0

These must not delay shipping v0:

- Fancy UI design, styling, or mobile optimization.  
- Multiple user accounts, roles, or permissions.  
- File uploads, imports/exports, or large datasets.  
- Complex tariff logic (country-specific rules, exceptions, etc.).  
- APIs, webhooks, or external integrations.  

You can list these in a separate “v1+ ideas” document, but they do not belong here.

---

## Suggested build checklist

Treat this like a to-do list to stay on task:

1. Generate Rails app and `TariffRule` model.  
2. Add validations and basic CRUD controller/views.  
3. Implement list view + simple search by HS code.  
4. Add duty calculation form and output.  
5. Add seeds with 5–10 example rules.  
6. Deploy to a host and verify from a browser.

---

## Sprint 1 Plan & Backlog

### Sprint Goal (Agile-style)

“Have a deployed Rails app where I can create, list, search, and calculate duty for basic tariff rules from a browser.”

Everything in the sprint answers: “Does this help hit that goal?”

### User stories (backlog items)

1. **Create tariff rules**  
   “As the app owner, I want to create tariff rules (HS code, description, rate) so I can store tariff data in the system.”

2. **View and search rules**  
   “As the app owner, I want to see a list of tariff rules and filter them by HS code so I can quickly find a specific rule.”

3. **Calculate duty**  
   “As the app owner, I want to enter a declared value for a rule and see the duty amount so I can estimate costs.”

4. **Seed example data**  
   “As the app owner, I want some sample tariff rules preloaded so the app looks alive right after setup.”

5. **Deploy app**  
   “As the app owner, I want the app deployed to a simple cloud host so I can access it via a URL from any browser.”

**Optional (stretch):**

6. **Basic access control**  
   “As the app owner, I want simple protection (even basic auth) so random people can’t edit my rules.”

### Tasks per story

**Story 1 – Create tariff rules**

- Generate Rails app and `TariffRule` model.  
- Add `hs_code`, `description`, `rate` columns.  
- Add validations (presence, uniqueness, non‑negative rate).  
- Create form (new/create + edit/update).  
- Add basic error messages.

**Story 2 – View and search rules**

- Create index view showing table of all rules.  
- Add simple search form (by HS code or prefix).  
- Filter results in the controller.

**Story 3 – Calculate duty**

- Add a field on show page to enter declared value.  
- Compute `duty = value × rate` in controller or helper.  
- Display result nicely.

**Story 4 – Seed example data**

- Add 5–10 sample `TariffRule` records in `db/seeds.rb`.  
- Run `rails db:seed` and verify.

**Story 5 – Deploy app**

- Pick a host (e.g., Render/Fly/Railway).  
- Push code to GitHub.  
- Connect repo to host and deploy.  
- Verify main flows work in the live environment.

---

## Sprint cadence for one person

- **Sprint length:** 1 or 2 weeks.  
- **Daily mini-standup (in notes):**  
  - Yesterday: …  
  - Today: …  
  - Blockers: …  
- **End-of-sprint demo:**  
  - Open the live URL and click through the stories you completed.  
- **Retrospective (10 minutes):**  
  - What went well?  
  - What was hard?  
  - What will you change for Sprint 2?
