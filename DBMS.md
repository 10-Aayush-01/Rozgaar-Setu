# Rojgaar Setu — Relational Schema Documentation

Relationship design for the Rojgaar Setu labour management platform.

---

## Entities

### Worker
Stores all information about a registered worker on the platform.

| Attribute | Type | Key |
|---|---|---|
| id | INT | Primary Key |
| name | VARCHAR(100) | |
| username | VARCHAR(50) | Unique |
| password | VARCHAR(255) | |
| worker_id | VARCHAR(50) | Unique |
| daily_rate | INT | |
| shift_date | DATE | |
| shift_type | VARCHAR(20) | |
| location | VARCHAR(150) | |
| skill_level | VARCHAR(30) | |
| advance_taken | INT | |
| emergency_contact | VARCHAR(10) | |
| work_type | VARCHAR(100) | |
| image | VARCHAR | |

---

### Contractor
Stores all information about a registered contractor or employer.

| Attribute | Type | Key |
|---|---|---|
| id | INT | Primary Key |
| name | VARCHAR(100) | |
| username | VARCHAR(50) | Unique |
| password | VARCHAR(255) | |
| tax_id | VARCHAR(50) | Unique |
| service_type | VARCHAR(50) | |
| workers_required | INT | |
| wage_offered | INT | |
| work_description | TEXT | |
| image | VARCHAR | |

---

### WorkAssignment
Junction entity that records assignment of a worker to a contractor. Resolves the M:N relationship between Worker and Contractor.

| Attribute | Type | Key |
|---|---|---|
| id | INT | Primary Key |
| worker_id | INT | Foreign Key → Worker |
| contractor_id | INT | Foreign Key → Contractor |
| assigned_date | DATE | |
| status | VARCHAR | |

---

## Relationships

### Worker — assigned to → WorkAssignment ← assigns — Contractor

Worker and Contractor share a Many-to-Many relationship through the WorkAssignment table. A single worker can work for multiple contractors and a single contractor can assign multiple workers.

- **Cardinality:** M:N resolved into two 1:N relationships via WorkAssignment  
- **Worker participation:** Partial — a worker can exist without being assigned  
- **Contractor participation:** Partial — a contractor can exist without assigning workers  
- **WorkAssignment participation:** Total — every assignment must reference both a worker and a contractor  

---

## Summary

| Relationship | Cardinality | Worker/Contractor Side | Other Entity Side |
|---|---|---|---|
| Worker assigned to Contractor | M:N | Partial | Partial |
| Worker → WorkAssignment | 1:N | Partial | Total |
| Contractor → WorkAssignment | 1:N | Partial | Total |

---

## Relational Schema

<img width="771" height="428" alt="image" src="https://github.com/user-attachments/assets/73adc4f8-7e78-43d0-8c91-6325fa318abc" />

