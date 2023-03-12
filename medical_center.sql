

-- https://app.quickdatabasediagrams.com/#/
-- Just uncomment below and paste

-- medical_center
-- -
-- center_id PK int
-- name string
-- address string

-- doctor
-- -
-- doctor_id PK int
-- center_id int FK >- medical_center.center_id
-- patient_id int FK >- patient.patient_id
-- firstname string 
-- lastname string
-- speciality string

-- patient
-- -
-- patient_id PK int
-- doctor_id int FK >- doctor.doctor_id
-- center_id int fk >- medical_center
-- firstname string
-- lastname string

-- disease
-- -
-- diesase_id PK int
-- patient_id int FK >- patient.patient_id
-- name string
-- treatment string

-- visit
-- -
-- doctor_id int fk >- doctor.doctor_id
-- patient_id int fk >- patient.patient_id
-- disease_id int fk >- disease.diesase_id


CREATE TABLE "medical_center" (
    "center_id" int   NOT NULL,
    "name" string   NOT NULL,
    "address" string   NOT NULL,
    CONSTRAINT "pk_medical_center" PRIMARY KEY (
        "center_id"
     )
);

CREATE TABLE "doctor" (
    "doctor_id" int   NOT NULL,
    "center_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "firstname" string   NOT NULL,
    "lastname" string   NOT NULL,
    "speciality" string   NOT NULL,
    CONSTRAINT "pk_doctor" PRIMARY KEY (
        "doctor_id"
     )
);

CREATE TABLE "patient" (
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "center_id" int   NOT NULL,
    "firstname" string   NOT NULL,
    "lastname" string   NOT NULL,
    CONSTRAINT "pk_patient" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "disease" (
    "diesase_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "name" string   NOT NULL,
    "treatment" string   NOT NULL,
    CONSTRAINT "pk_disease" PRIMARY KEY (
        "diesase_id"
     )
);

CREATE TABLE "visit" (
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "disease_id" int   NOT NULL
);

ALTER TABLE "doctor" ADD CONSTRAINT "fk_doctor_center_id" FOREIGN KEY("center_id")
REFERENCES "medical_center" ("center_id");

ALTER TABLE "doctor" ADD CONSTRAINT "fk_doctor_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("patient_id");

ALTER TABLE "patient" ADD CONSTRAINT "fk_patient_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "doctor" ("doctor_id");

ALTER TABLE "patient" ADD CONSTRAINT "fk_patient_center_id" FOREIGN KEY("center_id")
REFERENCES "medical_center" ("");

ALTER TABLE "disease" ADD CONSTRAINT "fk_disease_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("patient_id");

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "doctor" ("doctor_id");

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("patient_id");

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_disease_id" FOREIGN KEY("disease_id")
REFERENCES "disease" ("diesase_id");

