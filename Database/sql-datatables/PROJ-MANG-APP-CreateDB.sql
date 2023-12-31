---------------------------------------------------
-- Create Tables for Project version1
---------------------------------------------------
-- 1-Table EMPLOYEE
CREATE TABLE PROJ_MANG_APP_USER(
    U_ID VARCHAR(28) NOT NULL,
    U_First VARCHAR(20) NOT NULL,
    U_Middle CHAR,
    U_Last VARCHAR(20) NOT NULL,
    B_date DATE,
    U_gender CHAR,
	U_Bio VARCHAR(100),
    U_address VARCHAR(50),
    U_email VARCHAR(50) NOT NULL,
    U_cell_phone VARCHAR(13),
    PRIMARY KEY (U_ID)
);
--2-Table PROJECT
CREATE TABLE PROJ_MANG_APP_PROJ(
    PROJ_ID int NOT NULL AUTO_INCREMENT,
    PROJ_Name VARCHAR(15) NOT NULL,
	Create_date DATE NOT NULL,
	LEAD_ID VARCHAR(28) NOT NULL,
    Description VARCHAR(50),
	DEADLINE_date DATE NOT NULL,
    Priority int(2),
    PRIMARY KEY (PROJ_ID),
	FOREIGN KEY (LEAD_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);

--3-Table TASKS
CREATE TABLE PROJ_MANG_APP_TASKS(
    TASK_ID int NOT NULL AUTO_INCREMENT,
    TASK_Name VARCHAR(15) NOT NULL,
	Create_date DATE NOT NULL,
	STATUS int(1) NOT NULL,
	PROJ_ID int NOT NULL,
	MANAGING_ID VARCHAR(28) NOT NULL,
    Description VARCHAR(50),
	DEADLINE_date DATE,
    Priority int(2),
    PRIMARY KEY (TASK_ID),
	FOREIGN KEY (PROJ_ID) REFERENCES PROJ_MANG_APP_PROJ(PROJ_ID),
	FOREIGN KEY (MANAGING_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);

--4-Table NOTES
CREATE TABLE PROJ_MANG_APP_NOTES(
    NOTE_ID int NOT NULL AUTO_INCREMENT,
    CONTENTS VARCHAR(100) NOT NULL,
	Create_date DATE NOT NULL,
	PROJ_ID int NOT NULL,
	AUTHOR_ID VARCHAR(28) NOT NULL,
    Title VARCHAR(25),
    PRIMARY KEY (NOTE_ID),
	FOREIGN KEY (PROJ_ID) REFERENCES PROJ_MANG_APP_PROJ(PROJ_ID),
	FOREIGN KEY (AUTHOR_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);

--5-Table PROJECT_STAFF
CREATE TABLE PROJ_MANG_APP_PROJECT_STAFF(
    P_S_INDEX int NOT NULL AUTO_INCREMENT,
	U_ID VARCHAR(28) NOT NULL,
	PROJ_ID int NOT NULL,
    PRIMARY KEY (P_S_INDEX),
	FOREIGN KEY (PROJ_ID) REFERENCES PROJ_MANG_APP_PROJ(PROJ_ID),
	FOREIGN KEY (U_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);

--6-Table MANAGED_STAFF
CREATE TABLE PROJ_MANG_APP_MANG_STAFF(
    M_S_INDEX int NOT NULL AUTO_INCREMENT,
	U_ID VARCHAR(28) NOT NULL,
	MANG_ID VARCHAR(28) NOT NULL,
    PRIMARY KEY (M_S_INDEX),
	FOREIGN KEY (MANG_ID) REFERENCES PROJ_MANG_APP_USER(U_ID),
	FOREIGN KEY (U_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);

--7-Table PROJECT_ROLES
CREATE TABLE PROJ_MANG_APP_ROLES(
    R_INDEX int NOT NULL AUTO_INCREMENT,
	U_ID VARCHAR(28) NOT NULL,
	PROJ_ID int NOT NULL,
	ROLE VARCHAR(10) NOT NULL,
    PRIMARY KEY (R_INDEX),
	FOREIGN KEY (PROJ_ID) REFERENCES PROJ_MANG_APP_PROJ(PROJ_ID),
	FOREIGN KEY (U_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);

--8-Table GROUP/CORPORATION
CREATE TABLE PROJ_MANG_APP_GROUP(
    G_INDEX int NOT NULL AUTO_INCREMENT,
	CREATOR_ID VARCHAR(28) NOT NULL,
	MEMB_ID VARCHAR(28) NOT NULL,
	NAME VARCHAR(25) NOT NULL,
    PRIMARY KEY (G_INDEX),
	FOREIGN KEY (MEMB_ID) REFERENCES PROJ_MANG_APP_USER(U_ID),
	FOREIGN KEY (CREATOR_ID) REFERENCES PROJ_MANG_APP_USER(U_ID)
);
