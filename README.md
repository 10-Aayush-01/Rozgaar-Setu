# 🏗️ Rozgaar Setu — Labour Management Platform

<div align="center">

![RozgaarSetu](https://img.shields.io/badge/RozgaarSetu-v1.0-e88c2f?style=for-the-badge&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-Express-339933?style=for-the-badge&logo=node.js&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![HTML CSS JS](https://img.shields.io/badge/Frontend-HTML%20CSS%20JS-f7df1e?style=for-the-badge&logo=javascript&logoColor=black)

**A full-stack labour management platform that connects skilled workers with contractors — fast, fair, and transparent.**

</div>

---

## 🚀 Overview

Rozgaar Setu is a job-matching platform built to bridge the gap between contractors and workers. Contractors can post job requirements and browse available workers, while workers can discover opportunities, apply, and secure work efficiently. The platform promotes transparency through clear job details and streamlined communication.

Built with a vanilla HTML/CSS/JavaScript frontend, a Node.js + Express REST API backend, and a PostgreSQL database.

---

## 🎥 Project Presentation
👉 [View Presentation](https://canva.link/m46sva538dhxqoa)

---

## 📄 Project Report
👉 [View Full Report](PASTE_YOUR_REPORT_LINK_HERE)


---

## ✨ Features

### 🔐 Authentication
- Role-based registration — **Worker** or **Contractor**
- Login with username and password
- Session management per role

### 👷 Worker
- Register with personal and work details — name, skill level, work type, shift info, daily rate
- Browse contractor job postings
- Apply to jobs with one click
- View shift assignments and advance taken

### 🏢 Contractor
- Register with company details — name, GST ID, service type, wage offered
- Post job requirements with workers needed and work description
- Browse available worker profiles with skill tags and daily rates
- View and manage applications

### 📊 Dashboard
- Role-specific dashboard — Contractor view and Worker view
- Stat cards — workers registered, contractors, wages processed
- Skill-based filter chips — All, Electrician, Plumber, HVAC, Civil, Carpentry
- Worker profile cards — avatar, skill tags, daily rate, shift info
- Contractor cards — service type, wage offered, workers needed
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
| Frontend | HTML, CSS, JavaScript |
| Backend | Node.js + Express.js |
| Database | PostgreSQL |
| Auth | Session / JWT |

---

## 📁 Project Structure

```
rozgaar-setu/
├── backend/
│   ├── routes/
│   │   ├── auth.js
│   │   ├── workers.js
│   │   └── contractors.js
│   ├── db.js
│   └── index.js
├── frontend/
│   ├── index.html        ← Landing / Login page
│   ├── register.html     ← Registration page
│   └── dashboard.html    ← Dashboard (Worker + Contractor views)
└── README.md
```

---

## ⚙️ Getting Started

### Prerequisites
- Node.js v18+
- PostgreSQL
- npm

---

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/rozgaar-setu.git
cd rozgaar-setu
```

---

### 2. Configure Backend Environment

Create `backend/.env`:

```env
DB_USER=postgres
DB_HOST=localhost
DB_NAME=rozgaar_setu
DB_PASSWORD=your_postgres_password
DB_PORT=5432
JWT_SECRET=rozgaarsetu_secret_2024
```

---

### 3. Install Dependencies and Run Backend

```bash
cd backend
npm install
node index.js
```

Expected output:
```
Server running on http://localhost:5000
✅ Connected to PostgreSQL database!
```

---

### 4. Open the Frontend

Open `frontend/index.html` directly in your browser, or serve it via any static file server:

```bash
cd frontend
npx serve .
```

Then open `http://localhost:3000` in your browser.

---

## 🔑 Role-Based Access

### 🏢 Contractor
| Feature | Access |
|---------|--------|
| Dashboard | Browse workers, stat cards, skill filters |
| Worker cards | View name, skill, daily rate, shift info |
| Job Posting | Post requirements with wage and worker count |
| Applications | View incoming worker applications |

### 👷 Worker
| Feature | Access |
|---------|--------|
| Dashboard | Browse contractor job postings |
| Contractor cards | View company, service type, wage offered |
| Applications | Apply to job postings |
| Profile | View shift assignments and advance details |

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

## 🔒 Security

- Passwords hashed before storage
- JWT tokens for session management
- Role-based route protection on the backend
- SQL queries use parameterized statements to prevent injection

---

## 🚀 Future Enhancements

- Real-time chat between workers and contractors
- In-app notifications for application status
- PDF wage slips for workers
- Admin panel for platform management
- Mobile-responsive improvements

---



---

## 📄 License

This project is built for educational purposes.

---

<div align="center">
Made with ☕ and late nights &nbsp;·&nbsp; Rozgaar Setu v1.0
</div>
