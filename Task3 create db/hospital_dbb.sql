CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(200)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);
 -- ALTER TABLE Doctor
ADD email VARCHAR(100) UNIQUE;

ALTER TABLE Patient
MODIFY gender VARCHAR(10) NOT NULL;

ALTER TABLE Appointment
ADD CONSTRAINT chk_status
CHECK (status IN ('Scheduled','Completed','Cancelled'));
    
INSERT INTO Patient (first_name, last_name, date_of_birth, gender, phone, email, address)
VALUES
('Aruzhan','Tulegenova','2003-05-10','Female','87001234567','aru@mail.com','Almaty'),
('Dias','Ermekv','2001-08-15','Male','87007654321','dias@mail.com','Atyrau'),
('Aigerim','Kumisova','2002-11-20','Female','87005556677','aigerim@mail.com','Astana'),
('Erkow','Zelenyi','2000-03-12','Male','87004443322','erkow@mail.com','Shimkent'),
('Dana','Style','2004-09-01','Female','87009998877','dana@mail.com','Aktobe');

INSERT INTO Doctor (first_name, last_name, specialization, phone, email)
VALUES
('Serik','Tursynbaev','Cardiolog','87001112233','serik@hospital.com'),
('Aliya','Mergen','Dentist','87002223344','aliya@hospital.com'),
('Mirlan','Beket','Therapist','87003334455','mirlan@hospital.com'),
('Marat','Kumisov','Neurolog','87004445566','marat@hospital.com'),
('Islam','Nazar','Pediatrician','87005556677','islam@hospital.com');

INSERT INTO Appointment (patient_id, doctor_id, appointment_date, status)
VALUES
(1,1,'2026-03-20 10:00:00','Scheduled'),
(2,2,'2026-03-21 11:30:00','Completed'),
(3,3,'2026-03-22 09:00:00','Scheduled'),
(4,4,'2026-03-23 14:00:00','Cancelled'),
(5,5,'2026-03-24 16:00:00','Scheduled');
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;

SELECT 
Patient.first_name AS patient,
Doctor.first_name AS doctor,
Appointment.appointment_date,
Appointment.status
FROM Appointment
JOIN Patient ON Appointment.patient_id = Patient.patient_id
JOIN Doctor ON Appointment.doctor_id = Doctor.doctor_id;