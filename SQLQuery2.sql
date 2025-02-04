SET NOCOUNT ON;

DECLARE @i INT = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO patients (name, age, gender, city, country, contact_number, admission_date)
    VALUES (
        CONCAT('Patient_', @i), 
        ROUND(RAND() * (80 - 10) + 10, 0),  -- عمر عشوائي بين 10 و 80 سنة
        CASE WHEN RAND() > 0.5 THEN 'Male' ELSE 'Female' END, 
        CASE WHEN RAND() > 0.5 THEN 'Cairo' ELSE 'Alexandria' END,  
        'Egypt',
        CONCAT('010', ROUND(RAND() * 99999999, 0)),  -- رقم هاتف عشوائي
        DATEADD(DAY, -ROUND(RAND() * 365, 0), GETDATE())  -- تاريخ عشوائي في آخر سنة
    );
    SET @i = @i + 1;
END;



SET NOCOUNT ON;

DECLARE @j INT = 1;
WHILE @j <= 50
BEGIN
    INSERT INTO doctors (name, specialty, contact_number, experience_years)
    VALUES (
        CONCAT('Dr. ', CASE WHEN RAND() > 0.5 THEN 'Mohamed' ELSE 'Amina' END, '_', @j),
        CASE ROUND(RAND() * 4, 0) 
            WHEN 0 THEN 'Cardiology'
            WHEN 1 THEN 'Neurology'
            WHEN 2 THEN 'Orthopedics'
            WHEN 3 THEN 'Dermatology'
            ELSE 'General Medicine'
        END,
        CONCAT('012', ROUND(RAND() * 99999999, 0)),  -- رقم هاتف عشوائي
        ROUND(RAND() * (30 - 5) + 5, 0)  -- خبرة عشوائية بين 5 و 30 سنة
    );
    SET @j = @j + 1;
END;



SET NOCOUNT ON;

DECLARE @k INT = 1;
WHILE @k <= 5000
BEGIN
    INSERT INTO appointments (patient_id, doctor_id, appointment_date, status)
    VALUES (
        ROUND(RAND() * 999 + 1, 0),  -- مريض عشوائي من الـ 1000
        ROUND(RAND() * 49 + 1, 0),   -- طبيب عشوائي من الـ 50
        DATEADD(DAY, ROUND(RAND() * 365, 0), '2024-01-01'),  -- تاريخ خلال 2024
        CASE ROUND(RAND() * 2, 0)
            WHEN 0 THEN 'Scheduled'
            WHEN 1 THEN 'Completed'
            ELSE 'Canceled'
        END
    );
    SET @k = @k + 1;
END;



SET NOCOUNT ON;

DECLARE @l INT = 1;
WHILE @l <= 2000
BEGIN
    INSERT INTO treatments (patient_id, doctor_id, diagnosis, prescribed_medicine, treatment_date, cost)
    VALUES (
        ROUND(RAND() * 999 + 1, 0),  -- مريض عشوائي
        ROUND(RAND() * 49 + 1, 0),   -- طبيب عشوائي
        CASE ROUND(RAND() * 4, 0)
            WHEN 0 THEN 'Hypertension'
            WHEN 1 THEN 'Diabetes'
            WHEN 2 THEN 'Fracture'
            WHEN 3 THEN 'Migraine'
            ELSE 'Flu'
        END,
        CASE ROUND(RAND() * 4, 0)
            WHEN 0 THEN 'Paracetamol'
            WHEN 1 THEN 'Ibuprofen'
            WHEN 2 THEN 'Lisinopril'
            WHEN 3 THEN 'Metformin'
            ELSE 'Aspirin'
        END,
        DATEADD(DAY, -ROUND(RAND() * 365, 0), GETDATE()),  -- تاريخ خلال آخر سنة
        ROUND(RAND() * (5000 - 100) + 100, 2)  -- تكلفة بين 100 و 5000 جنيه
    );
    SET @l = @l + 1;
END;
