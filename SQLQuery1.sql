-- إنشاء قاعدة البيانات
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- جدول المرضى
CREATE TABLE patients (
    patient_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    country VARCHAR(50),
    contact_number VARCHAR(20),
    admission_date DATE
);

-- جدول الأطباء
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    specialty VARCHAR(50),
    contact_number VARCHAR(20),
    experience_years INT
);

-- جدول المواعيد
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20), -- (Scheduled, Completed, Canceled)
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- جدول العلاجات
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(255),
    prescribed_medicine VARCHAR(255),
    treatment_date DATE,
    cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);


/* -------------------------- DATA ANALYSIS-------------------*/



