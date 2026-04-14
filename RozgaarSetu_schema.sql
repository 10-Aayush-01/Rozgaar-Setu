-- Workers Table

CREATE TABLE workers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    worker_id VARCHAR(50) UNIQUE NOT NULL,
    daily_rate INT NOT NULL CHECK (daily_rate > 0),
    shift_date DATE NOT NULL,
    shift_type VARCHAR(20),
    location VARCHAR(150) NOT NULL,
    skill_level VARCHAR(30),
    advance_taken INT DEFAULT 0 CHECK (advance_taken >= 0),
    emergency_contact VARCHAR(10) NOT NULL,
    work_type VARCHAR(100),
    image TEXT
);

-- Contractors Table

CREATE TABLE contractors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    tax_id VARCHAR(50) UNIQUE NOT NULL,
    service_type VARCHAR(50),
    workers_required INT NOT NULL CHECK (workers_required > 0),
    wage_offered INT NOT NULL CHECK (wage_offered > 0),
    work_description TEXT NOT NULL,
    image TEXT
);

-- Work Assignments Table (Junction Table)

CREATE TABLE work_assignments (
    id SERIAL PRIMARY KEY,
    worker_id INT NOT NULL,
    contractor_id INT NOT NULL,
    assigned_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(30) DEFAULT 'assigned',

    CONSTRAINT fk_worker
        FOREIGN KEY (worker_id)
        REFERENCES workers(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_contractor
        FOREIGN KEY (contractor_id)
        REFERENCES contractors(id)
        ON DELETE CASCADE,

    CONSTRAINT unique_assignment UNIQUE (worker_id, contractor_id) -- Prevent duplicate assignments
);


-- Indexes (for performance)

CREATE INDEX idx_worker ON work_assignments(worker_id);
CREATE INDEX idx_contractor ON work_assignments(contractor_id);




