-- Regulatory Compliance & Auditing Database
-- This database is designed to track regulatory compliance, audits, and related actions.

CREATE DATABASE regulatory_compliance_auditing;
USE regulatory_compliance_auditing;

-- Table: Regulations
CREATE TABLE regulations (
    regulation_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    effective_date DATE,
    authority VARCHAR(255)
);

-- Table: Compliance_Audits
CREATE TABLE compliance_audits (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    regulation_id INT,
    audit_date DATE,
    status ENUM('Pending', 'In Progress', 'Completed', 'Non-Compliant'),
    findings TEXT,
    corrective_action TEXT,
    auditor VARCHAR(255),
    FOREIGN KEY (regulation_id) REFERENCES regulations(regulation_id)
);

-- Table: Audit_Logs
CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    audit_id INT,
    action VARCHAR(255),
    action_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user VARCHAR(255),
    FOREIGN KEY (audit_id) REFERENCES compliance_audits(audit_id)
);

-- Table: Compliance_Training
CREATE TABLE compliance_training (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    regulation_id INT,
    training_date DATE,
    status ENUM('Completed', 'Pending'),
    FOREIGN KEY (regulation_id) REFERENCES regulations(regulation_id)
);
