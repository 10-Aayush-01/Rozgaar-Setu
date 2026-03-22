# Rojgaar Setu — UI Design

India's labour management platform connecting skilled workers and contractors — fast, fair, and transparent.

[View Figma Prototype](https://www.figma.com/design/29KoFktcy6zNCTqfqQLx1J/Rojgaar-Setu?node-id=0-1&t=yM75Ej2dveiCRxbh-1)

---

## Overview

This repository contains the complete UI/UX design for Rojgaar Setu, built in Figma. The design covers four core screens with interactive prototypes, a custom component library, and a consistent dark amber design system.

---

## Screens

### Landing Page
Entry point for the platform. Users select their role — Contractor or Worker — before accessing the dashboard. Includes a sign-in card with role toggle, platform stats (2,400+ workers, 380+ contractors, 4.2Cr wages processed), and navigation to Register.

### Register Page
Multi-field registration form with a Worker / Contractor toggle. Worker form captures name, ID, daily rate, skill level, work type, shift details, location, advance taken, and emergency contact. Contractor form captures company name, GST ID, service type, workers required, wage offered, and work description. Includes custom dropdown and date picker components.

### Dashboard — Contractor View
Logged-in view for contractors browsing available workers. Features a sticky sidebar, topbar with search and role badge, four stat cards, skill-based filter chips, and a grid of worker profile cards showing avatar, skill tags, daily rate, shift info, and a View Profile button.

### Dashboard — Worker View
Logged-in view for workers browsing available job postings. Displays contractor cards with company avatar, service type tag, wage offered per day, workers needed count, and an Apply Now button.

---

## Component Library

| Component | Description |
|---|---|
| Role Toggle | Worker / Contractor switcher with active amber highlight and glow |
| Skill Level Dropdown | Open/close dropdown with Skilled, Semi-skilled, Unskilled options |
| Shift Type Dropdown | Day / Night / Overtime selector |
| Date Picker | Full calendar grid with selected day, today highlight, and Confirm button |
| Worker Card | Avatar with initials, name, role, skill tags, rate, shift info, button |
| Contractor Card | Company avatar, service tag, daily rate, workers needed, Apply Now |
| Stat Card | Metric value, label, sub-text |
| Filter Chips | Pill-style skill filters — All, Electrician, Plumber, HVAC, Civil, Carpentry |
| Primary Button | Amber fill, dark text, orange glow on hover |
| Secondary Button | Transparent with amber border, subtle glow on hover |
| Nav Item | Sidebar navigation with active and hover states |

---

## Prototype Interactions

| Trigger | Action |
|---|---|
| Role toggle (Worker to Contractor) | Navigates between two register frame states |
| Skill Level field click | Opens dropdown overlay |
| Shift Type field click | Opens dropdown overlay |
| Shift Date field click | Opens calendar picker |
| Log In button hover | Amber glow intensifies |
| Nav links hover | Text transitions to white |
| Enter Dashboard button | Navigates to Dashboard frame |
| Create New Account button | Navigates to Register frame |
| Browse nav item | Navigates to Browse view |
| Logout button | Navigates back to Landing Page |

---

## Design System

### Color Palette

| Name | Hex | Usage |
|---|---|---|
| Soil | `#1a1008` | Page background |
| Amber | `#e88c2f` | Primary buttons, active states |
| Amber Light | `#f5b84a` | Logo, headings, stat numbers |
| Clay | `#c4622d` | Logo accent, secondary highlights |
| Cream | `#faf3e8` | Body text, card text |
| Muted | `#8a7560` | Labels, placeholders, inactive nav |

### Typography

| Font | Role | Weights Used |
|---|---|---|
| Syne | Headings, buttons, logo, numbers | 800, 700, 600 |
| DM Sans | Body text, labels, inputs, nav | 300, 400, 500 |

### Spacing and Shape

- Card corner radius: 14 to 20px
- Button corner radius: 10 to 12px
- Input field height: 44px
- Card border: 1px solid amber at 18% opacity
- Card background: white at 4% opacity with 12px backdrop blur

---

## Database Design

ER diagram and relational schema are available in the `/docs` folder.

**Entities** — Worker, Contractor, Application, Shift, Wage

**Relationships**

- Worker applies to Contractor through Application — Many to Many
- Worker has many Shifts — One to Many
- Contractor pays Worker through Wage — One to Many

---

## Tools

| Tool | Purpose |
|---|---|
| Figma | Design, components, prototyping |
| Scripter | Automated frame generation via Figma plugin API |
| ProtoPie | Extended interactions and logic-based prototyping |
| draw.io | ER diagram and database schema visualization |
