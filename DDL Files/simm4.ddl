DROP VIEW sim_manager;
DROP VIEW sim_employee;

CREATE VIEW sim_employee AS
  SELECT *
  FROM sim_person
  WHERE type = 'Employee';
  
create or replace TRIGGER employee_trigger
     INSTEAD OF insert ON sim_employee
     FOR EACH ROW
BEGIN
     insert into sim_person(
        PERSON_ID,
        type,
        name,
        ssnum,
        gender,
        birth_date,
        address,
        city,
        state,
        zip,
        title,
        hire_date,
        salary,
        status,
        rating,
        sim_dept_dept_id
        )
     VALUES (
        :new.PERSON_ID,
        'Employee',
        :new.name,
        :new.ssnum,
        :new.gender,
        :new.birth_date,
        :new.address, 
        :new.city,
        :new.state,
        :new.zip,
        :new.title,
        :new.hire_date,
        :new.salary,
        :new.status,
        :new.rating,
        :new.sim_dept_dept_id) ;
END;
/

CREATE VIEW sim_manager AS
  SELECT *
  FROM sim_person
  WHERE type = 'Manager';
  
create or replace TRIGGER manager_trigger
     INSTEAD OF insert ON sim_manager
     FOR EACH ROW
BEGIN
     insert into sim_person(
        PERSON_ID,
        type,
        name,
        ssnum,
        gender,
        birth_date,
        address,
        city,
        state,
        zip,
        title,
        hire_date,
        salary,
        status,
        sim_dept_dept_id1
        )
     VALUES (
        :new.PERSON_ID,
        'Manager',
        :new.name,
        :new.ssnum,
        :new.gender,
        :new.birth_date,
        :new.address, 
        :new.city,
        :new.state,
        :new.zip,
        :new.title,
        :new.hire_date,
        :new.salary,
        :new.status,
        :new.sim_dept_dept_id1) ;
END;