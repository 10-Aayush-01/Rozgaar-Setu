# 🏗️ Rozgaar Setu — Labour Management Platform

<div align="center">

![RozgaarSetu](https://img.shields.io/badge/RozgaarSetu-v2.0-e88c2f?style=for-the-badge&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-Express-339933?style=for-the-badge&logo=node.js&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-OTP%20Auth-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![HTML CSS JS](https://img.shields.io/badge/Frontend-HTML%20CSS%20JS-f7df1e?style=for-the-badge&logo=javascript&logoColor=black)

**A full-stack labour management platform that connects skilled workers with contractors — fast, fair, and transparent.**

</div>

---

## 🚀 Overview

Rozgaar Setu is a job-matching platform built to bridge the gap between contractors and workers. Contractors can browse available workers and send job offers, while workers can discover opportunities and send proposals. The platform features a bidirectional proposal system, Firebase phone OTP authentication, and a transparent status-tracked workflow for every match.

Built with a vanilla HTML/CSS/JavaScript frontend served directly by a Node.js + Express backend, backed by a PostgreSQL database and Firebase Admin for phone authentication.

---

## 🎥 Project Presentation
👉 [View Presentation](https://canva.link/m46sva538dhxqoa)

---

## 📄 Project Report
👉 [View Full Report](https://docs.google.com/document/d/1JYHVgHee-0itGTLfDw1Bjf53rw4SV43p/edit?usp=sharing&ouid=104001482188941035844&rtpof=true&sd=true)

---

## ✨ Features

### 🔐 Authentication
- **Dual login** — username + password OR phone number + OTP
- **Firebase Phone OTP** (production) with a built-in **TEST_MODE** for local development
- Role-based registration — **Worker** or **Contractor**
- JWT tokens for session management (24h expiry)
- Phone number uniqueness enforced at registration

### 👷 Worker
- Register with personal and work details — name, skill level, work type, shift info, daily rate, location, emergency contact, phone
- Browse contractor job postings on the dashboard
- Send proposals to contractors
- Accept or reject incoming contractor offers
- View proposal history with status tracking

### 🏢 Contractor
- Register with company details — name, GST/Tax ID, service type, wage offered, work date, work description, phone
- Browse available worker profiles with skill tags and daily rates
- Send job offers to workers
- Accept or reject incoming worker proposals
- View all active and historical proposals

### 📋 Bidirectional Proposal System
- Either party (worker or contractor) can initiate a proposal
- Smart status lifecycle: `draft_by_worker` → `contractor_accepted` / `contractor_rejected`; `draft_by_contractor` → `worker_accepted` / `worker_rejected`
- Date-match validation — worker's shift date and contractor's work date must align
- Duplicate proposal prevention — only one active proposal per worker-contractor pair
- Cleared rejected proposals can be re-initiated
- Snapshot of profile data stored at proposal time

### 📊 Dashboard
- Role-specific views — Contractor view and Worker view
- Stat cards — workers registered, contractors, wages processed
- Skill-based filter chips — All, Electrician, Plumber, HVAC, Civil, Carpentry
- Worker profile cards — avatar, skill tags, daily rate, shift info
- Contractor cards — service type, wage offered, work date
- Sticky sidebar navigation with active states
- Topbar with search bar and role badge

### 🎨 UI / UX
- Dark amber design system — Soil background, Amber accents, Cream text
- Syne and DM Sans typography
- Smooth tab switching on registration (Worker / Contractor toggle)
- Toast notifications
- Responsive layout with sticky sidebar

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML, CSS, JavaScript (served as static files) |
| Backend | Node.js + Express.js v5 |
| Database | PostgreSQL |
| Auth | Firebase Admin SDK (Phone OTP) + JWT |
| Password Hashing | bcryptjs |

---

## 📁 Project Structure

```
rozgaar-setu/
├── public/
│   ├── index.html          ← Landing / Login page
│   ├── register.html       ← Registration page
│   └── dashboard.html      ← Dashboard (Worker + Contractor views)
├── routes/
│   ├── auth.js             ← Registration, login, OTP endpoints
│   ├── workers.js          ← Worker CRUD routes
│   ├── contractors.js      ← Contractor CRUD routes
│   └── assignments.js      ← Proposal lifecycle routes
├── middleware/
│   └── auth.js             ← JWT authentication middleware
├── db.js                   ← PostgreSQL pool config
├── index.js                ← Express app entry point
├── migrate.js              ← DB migration script
├── RozgaarSetu_schema.sql  ← Full database schema
├── serviceAccountKey.json  ← Firebase Admin credentials (do not commit)
├── .env                    ← Environment variables
└── .gitignore
```

---

## ⚙️ Getting Started

### Prerequisites
- Node.js v18+
- PostgreSQL
- npm
- Firebase project (for production OTP) — or use TEST_MODE for local dev

---

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/rozgaar-setu.git
cd rozgaar-setu
```

---

### 2. Configure Environment

Create a `.env` file in the project root:

```env
DB_USER=postgres
DB_HOST=localhost
DB_NAME=rozgaar_setu
DB_PASSWORD=your_postgres_password
DB_PORT=5432
JWT_SECRET=rozgaarsetu_secret_2024

# Set to true to bypass Firebase OTP (for local development)
TEST_MODE=true
```

> **Note:** In production, set `TEST_MODE=false` and add your `serviceAccountKey.json` from the Firebase console.

---

### 3. Set Up the Database

Create the database, then run the schema:

```bash
psql -U postgres -c "CREATE DATABASE rozgaar_setu;"
psql -U postgres -d rozgaar_setu -f RozgaarSetu_schema.sql
```

If you are migrating from a previous version of the schema, run:

```bash
node migrate.js
```

---

### 4. Install Dependencies and Start

```bash
npm install
node index.js
```

Expected output:
```
🚀 Server running on http://localhost:5000
✅ Connected to PostgreSQL database!
✅ Firebase Admin initialized.
```

The Express server serves both the API and the frontend from the same port. Open `http://localhost:5000` in your browser.

---

### 5. Test Mode OTP Inbox (Development only)

When `TEST_MODE=true`, OTPs are generated in memory instead of sent via SMS. View them at:

```
http://localhost:5000/api/auth/test-otp/inbox
```

The inbox auto-refreshes every 5 seconds and displays the phone number, OTP, and timestamp.

---

## 🔑 API Reference

### Auth — `/api/auth`

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | `/config` | Returns current TEST_MODE status | — |
| POST | `/test-otp/send` | Generate test OTP (TEST_MODE only) | — |
| GET | `/test-otp/inbox` | View generated OTPs (TEST_MODE only) | — |
| POST | `/test-otp/verify` | Verify test OTP, returns token | — |
| POST | `/register/worker` | Register a new worker | OTP Token |
| POST | `/register/contractor` | Register a new contractor | OTP Token |
| POST | `/login` | Login via username+password or phone+OTP | — |

### Workers — `/api/workers`

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | `/` | List all workers | JWT |
| GET | `/:id` | Get a single worker profile | JWT |
| PUT | `/:id` | Update own worker profile | JWT (own only) |

### Contractors — `/api/contractors`

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | `/` | List all contractors | JWT |
| GET | `/:id` | Get a single contractor profile | JWT |
| PUT | `/:id` | Update own contractor profile | JWT (own only) |

### Assignments — `/api/assignments`

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| POST | `/` | Create a proposal or offer | JWT |
| GET | `/mine` | Get all proposals for the logged-in user | JWT |
| PATCH | `/:id/accept` | Accept an incoming proposal | JWT (receiver only) |
| PATCH | `/:id/reject` | Reject an incoming proposal | JWT (receiver only) |
| DELETE | `/:id` | Clear a rejected proposal | JWT (involved party) |

---

## 🔄 Proposal Lifecycle

```
Worker initiates:
  draft_by_worker  →  contractor_accepted  ✅
                   →  contractor_rejected  ❌  →  (clearable)

Contractor initiates:
  draft_by_contractor  →  worker_accepted  ✅
                       →  worker_rejected  ❌  →  (clearable)
```

**Validation rules enforced on proposal creation:**
- Worker's `shift_date` must match contractor's `work_date`
- Neither date can be in the past
- Only one active proposal allowed per worker-contractor pair

---

## 🗄️ Database Schema

### Workers
| Column | Type | Notes |
|--------|------|-------|
| id | SERIAL | Primary Key |
| name | VARCHAR(100) | |
| username | VARCHAR(50) | Unique |
| password | VARCHAR(255) | Hashed |
| worker_id | VARCHAR(50) | Unique |
| phone | VARCHAR | Unique — used for OTP login |
| daily_rate | INT | > 0 |
| shift_date | DATE | |
| shift_type | VARCHAR(20) | |
| location | VARCHAR(150) | |
| skill_level | VARCHAR(30) | |
| advance_taken | INT | Default 0 |
| emergency_contact | VARCHAR(10) | |
| work_type | VARCHAR(100) | |
| image | TEXT | |

### Contractors
| Column | Type | Notes |
|--------|------|-------|
| id | SERIAL | Primary Key |
| name | VARCHAR(100) | |
| username | VARCHAR(50) | Unique |
| password | VARCHAR(255) | Hashed |
| tax_id | VARCHAR(50) | Unique |
| phone | VARCHAR | Unique — used for OTP login |
| service_type | VARCHAR(50) | |
| wage_offered | INT | > 0 |
| work_date | DATE | |
| work_description | TEXT | |
| image | TEXT | |

### Work Assignments
| Column | Type | Notes |
|--------|------|-------|
| id | SERIAL | Primary Key |
| worker_id | INT | FK → workers |
| contractor_id | INT | FK → contractors |
| assigned_date | DATE | Default today |
| status | VARCHAR(30) | See proposal lifecycle |
| action_by | VARCHAR | Last actor role |
| snapshot | JSONB | Profile data at proposal time |

---

## 🔒 Security

- Passwords hashed with bcryptjs (salt rounds: 10)
- Phone OTP verified via Firebase Admin SDK (production)
- JWT tokens expire after 24 hours
- Role-based route protection on all protected endpoints
- Users can only edit their own profiles
- SQL queries use parameterized statements to prevent injection
- `serviceAccountKey.json` excluded from version control via `.gitignore`

---

## 🎨 Design System

### Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Soil | `#1a1008` | Page background |
| Amber | `#e88c2f` | Primary buttons, active states |
| Amber Light | `#f5b84a` | Logo, headings, stat numbers |
| Clay | `#c4622d` | Logo accent, secondary highlights |
| Cream | `#faf3e8` | Body text, card text |
| Muted | `#8a7560` | Labels, placeholders, inactive nav |

### Typography

| Font | Role |
|------|------|
| Syne | Headings, buttons, logo, numbers |
| DM Sans | Body text, labels, inputs, nav |

---

## 🚀 Future Enhancements

- Real-time chat between workers and contractors
- In-app notifications for proposal status updates
- PDF wage slips for workers
- Admin panel for platform management
- Enhanced mobile-responsive layout
- Push notifications via Firebase Cloud Messaging

---

## 📄 License

This project is built for educational purposes.

---

<div align="center">
Made with ☕ and late nights &nbsp;·&nbsp; Rozgaar Setu v2.0
</div>
