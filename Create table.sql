CREATE TABLE TRAINEE(
   trainee_naId          INT NOT NULL,
   trainee_FName         NVARCHAR(30)NOT NULL,
   trainee_LName         NVARCHAR(30)NOT NULL,
   trainee_Phone         NVARCHAR(8)NOT NULL,
   trainee_age           INT ,
   trainee_gender        CHAR(2),
   trainee_email         NVARCHAR(50)         
);


CREATE TABLE TRAINER(
   trainer_naId          INT NOT NULL,
   trainer_FName         NVARCHAR (30)NOT NULL,
   trainer_LName         NVARCHAR(30)NOT NULL,
   trainer_Phone         NVARCHAR(8)NOT NULL,
   trainer_gender        CHAR(2),
   trainer_email         NVARCHAR(50)         
);


CREATE TABLE PERMIT(
   pe_id           INT NOT NULL,
   pe_exp          DATETIME NOT NULL,
   pe_pic          VARBINARY NOT NULL     
);


CREATE TABLE TEST(
   test_id           INT NOT NULL,
   test_date         DATETIME NOT NULL,
   test_result       NVARCHAR(30)NOT NULL   
);


CREATE TABLE CAR(
   car_id           INT NOT NULL,
   car_name         NVARCHAR(50),
   car_model        INT,
   gear_type        NVARCHAR(50)NOT NULL
);


CREATE TABLE COURSE(
   course_id            INT NOT NULL,
   course_title         NVARCHAR(20)NOT NULL,
   course_descrip       NVARCHAR(100),
   course_price         DECIMAL(8,2) NOT NULL
);


CREATE TABLE "CONTRACT"(
   con_id               INT NOT NULL,
   con_type             NVARCHAR(50) NOT NULL,
   start_datetime       DATETIME NOT NULL,
   end_datetime         DATETIME NOT NULL
);


CREATE TABLE LICENSE(
   license_id               INT NOT NULL,
   license_type             NVARCHAR(20)NOT NULL
);



