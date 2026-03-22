# Rojgaar Setu — Relational Schema Documentation

Relationship design for the Rojgaar Setu labour management platform.

---

## Entities

### Worker
Stores all information about a registered worker on the platform.

| Attribute | Type | Key |
|---|---|---|
| workerID | INT | Primary Key |
| fullName | VARCHAR(100) | |
| dailyRate | DECIMAL(8,2) | |
| skillLevel | ENUM | |
| workType | VARCHAR(100) | |
| shiftType | ENUM | |
| location | VARCHAR(200) | |
| advanceTaken | DECIMAL(8,2) | |
| emergencyContact | VARCHAR | |

---

### Contractor
Stores all information about a registered contractor or employer.

| Attribute | Type | Key |
|---|---|---|
| contractorID | INT | Primary Key |
| companyName | VARCHAR(100) | |
| taxID | VARCHAR(50) | |
| serviceType | ENUM | |
| workersRequired | INT | |
| wageOffered | DECIMAL(8,2) | |
| workDescription | TEXT | |

---

### Application
Junction entity that records a worker applying to a contractor's job. Resolves the M:N relationship between Worker and Contractor.

| Attribute | Type | Key |
|---|---|---|
| applicationID | INT | Primary Key |
| workerID | INT | Foreign Key → Worker |
| contractorID | INT | Foreign Key → Contractor |
| appliedDate | DATE | |
| status | ENUM(Pending / Accepted / Rejected) | |

---

### Shift
Records individual shift assignments linked to a worker.

| Attribute | Type | Key |
|---|---|---|
| shiftID | INT | Primary Key |
| workerID | INT | Foreign Key → Worker |
| shiftDate | DATE | |
| shiftType | ENUM(Day / Night / OT) | |
| location | VARCHAR(200) | |

---

### Wage
Records wage payments made by a contractor to a worker.

| Attribute | Type | Key |
|---|---|---|
| wageID | INT | Primary Key |
| workerID | INT | Foreign Key → Worker |
| contractorID | INT | Foreign Key → Contractor |
| amount | DECIMAL(10,2) | |
| paymentDate | DATE | |
| paymentType | ENUM(Advance / Full) | |

---

## Relationships

### Worker — applies → Application ← receives — Contractor

Worker and Contractor share a Many-to-Many relationship through the Application table. A single worker can apply to multiple contractors and a single contractor can receive applications from multiple workers.

- **Cardinality:** M:N resolved into two 1:N relationships via Application
- **Worker participation:** Partial — a worker can exist without having applied anywhere
- **Contractor participation:** Partial — a contractor can exist without having received any applications
- **Application participation:** Total — every application record must reference both a worker and a contractor

---

### Worker — has → Shift

A worker can be assigned to multiple shifts across different dates and sites.

- **Cardinality:** 1:N — one Worker, many Shifts
- **Worker participation:** Partial — a worker may not have any shifts assigned yet
- **Shift participation:** Total — every shift must belong to a worker

---

### Worker — earns → Wage

A worker can receive multiple wage payments over time from different contractors.

- **Cardinality:** 1:N — one Worker, many Wages
- **Worker participation:** Partial — a worker may not have received any payment yet
- **Wage participation:** Total — every wage record must be linked to a worker

---

### Contractor — pays → Wage

A contractor can make multiple wage payments to different workers.

- **Cardinality:** 1:N — one Contractor, many Wages
- **Contractor participation:** Partial — a contractor may not have made any payments yet
- **Wage participation:** Total — every wage record must be linked to a contractor

---

## Summary

| Relationship | Cardinality | Worker/Contractor Side | Other Entity Side |
|---|---|---|---|
| Worker applies to Contractor | M:N | Partial | Partial |
| Worker has Shifts | 1:N | Partial | Total |
| Worker earns Wages | 1:N | Partial | Total |
| Contractor pays Wages | 1:N | Partial | Total |
| Contractor receives Applications | 1:N | Partial | Total |



## Relational Schema

<img width="748" height="508" alt="image" src="https://github.com/user-attachments/assets/8ba24741-0c61-4142-9e91-d0e7920ecc59" />
