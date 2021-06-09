--6/7�� PL/SQL ����
--�͸� �� 
-- := �Ҵ� ������
--SET SERVEROUTPUT ON  --���� 
--SET TIMING ON   --���� �ð� ����
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num  :=  100;
--  ��±�� �Լ�
    DBMS_OUTPUT.put_line(vi_num);
end;
/

--�켱���� ������ ** ��� 
DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a= ' || TO_CHAR(a));
END;
/    
    
-- PL�ּ� 
/*�̷����ּ� �κе� ��밡��*/

--DML�� ��� 
--SELECT ���� INTO�� ����Ͽ� �Ҵ�� ������ ����.
--employees.emp_name%TYPE; ���� ����Ÿ���� �������� �ʾƵ���,
-- ������ ���̺�.�÷���%TYPE;
DECLARE
    vs_emp_name  employees.emp_name%TYPE;--VARCHAR2(80);  
    vs_dep_name   departments.department_name%TYPE;--VARCHAR2(80);
BEGIN
    SELECT a.emp_name , b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a , departments b
    WHERE a.department_id = b.department_id
    AND a.employee_id  = 100;
DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' - ' || vs_dep_name);
END;
/

--�� ������ ����� ���� ��� 

--���� ���̸� Ȯ��

CREATE TABLE ch08_varchar(
VAR1  VARCHAR2(4000));
INSERT INTO ch08_varchar VALUES ('tQbADHDjqtRCvosYCLwzbyKKrQCdJubDPTHnzqvjRwGxhQJtrVbXsLNlgeeMCemGMYpvfoHUHDxIPTDjleABGoowxlzCVipeVwsMFRNzZYgHfQUSIeOITaCKJpxAWwydApVUlQiKDgJlFIOGPOKoJsoemqNbOLdZOBcQhDcMLXuYjRQZDIpgpmImgiwzcLkSilCmLrSbmFNsKEEpzCHDylMvkYPKPNeuJxLvJiApNCYzrMcflECbxwNTKSxaEwVvCYnTnFfMFgDqxobWcSmMJrNTQIVOeWlPaMTfRHsrlFSukppmljmOojPSgJiSbQcgtWWOwUNNYFGtgCGBsIcTGAiHWBxtYVXecoJgJCAJptIVmVTZSKliRLoPYTIUpksBuQaqFHLhCkosWChoMjbqgLtBIRBynsKjKiLrdeHVvZanNVElDjLWwlCDhbpsAVQMTzjzhoKIJBdthynMBMVjeNmsKAjdAYhPZKmuKOuMloQdkqPjoKbfjDEeATciMrXiMQorMhYmBlMODBbyLLIkbmtZdPcWGSuxFEUwXnWpvnunEgcLelSneRIpgRNTzTkHqgLbpxoHzCYgSWlIAvKljCnmWiPWGGwlUFOudRSdoqUxntyhNYEiVXtMObywEltTImawnElpmeiWwlTjGTFceqyjhNqiDLxwduubykWzDmFSJNvVvDZibrCpAReqQjlQZcxuVqjKGKvoDuEcQPQeDzmdMYSOTIQdPDNfDffCOUWflHSQhvVTiYumBQIoyznWNITGZkefknJpGEutUnhBgLPQTWTBeTYccqlLrxvRjfJpdpfVDqqfKCngemIEDDHNdvBxCqKDTrrJAumXMKgpWLIHctQuACeNaKnffpYXiioLxZDrxpuZPPUGpRsCtoQuBfogkKuusVATkMyajKTPSyTQbfhZepRjNdrhkymqKvsAcThYbMSMnkKcLWFPAMeGys
BVKkQtFMPvRBoDszlSZcMYzwxkKQwJnuVnDxShYiHFlzgDWqhZoqe')

commit;
DROP TABLE ch08_varchar;

DECLARE
     vs_sql_varchar2  VARCHAR2(4000);
     vs_plsql_varchar2 VARCHAR2(32767);
BEGIN
 SELECT VAR1
 INTO vs_sql_varchar2
 FROM ch08_varchar;
 vs_plsql_varchar2  := vs_plsql_varchar2 || ' - ' || vs_sql_varchar2 || ' - ' || vs_sql_varchar2;
 
 DBMS_OUTPUT.PUT_LINE('SQL VARCHAR2 ����:' || ' - ' || LENGTHB(vs_sql_varchar2));
 DBMS_OUTPUT.PUT_LINE('PL/SQL VARCHAR2 ����' || ' -  ' || LENGTHB(vs_plsql_varchar2));
 END;
/ 
-- ex1 ������3 �� Ǯ��
DECLARE
    v1_num NUMBER;
BEGIN
 v1_num := 3;
DBMS_OUTPUT.put_line(v1_num|| 'X' ||1||'='|| v1_num);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||2||'='|| v1_num*2);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||3||'='|| v1_num*3);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||4||'='|| v1_num*4);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||5||'='|| v1_num*5);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||6||'='|| v1_num*6);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||7||'='|| v1_num*7);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||8||'='|| v1_num*8);
DBMS_OUTPUT.put_line(v1_num|| 'X' ||9||'='|| v1_num*9);
END;
/

DECLARE
    v_emp_name  employees.emp_name%TYPE;
    v_emp_email  employees.email%TYPE;
BEGIN
    SELECT a.emp_name , a.email
    INTO v_emp_name, v_emp_email
    FROM employees a 
    WHERE  a.employee_id  = 201;
DBMS_OUTPUT.PUT_LINE(v_emp_name || chr(10) ||chr(13)||v_emp_email);
END;
/


DECLARE 
  EMPNO_MAX EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
   SELECT MAX(EMPLOYEE_id)
INTO EMPNO_MAX
FROM EMPLOYEES;

    INSERT INTO employees (employee_id, emp_name,email, hire_date, department_id)  
                            VALUES(EMPNO_MAX +1 , 'Harrison', 'HARRLS', SYSDATE, 50)
    commit;
END;

--6/8�� PL/SQL���,�Լ�
--IF��
DECLARE
vn_num1 NUMBER := 1;
vn_num2 NUMBER :=2;
BEGIN
IF vn_num1 >=  vn_num2 THEN
dbms_output.put_line(vn_num1 || '�� ū��');
ELSE
dbms_output.put_line(vn_num2 || '�� ū��');
END IF;
END;
/

DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE (10,120), -1);
    SELECT salary
    INTO vn_salary
    FROM employees
    WHERE department_id =vn_department_id
    AND ROWNUM =1;
    DBMS_OUTPUT.PUT_LINE(vn_salary);
IF 
    vn_salary BETWEEN 1 AND 3000 THEN 
    DBMS_OUTPUT.PUT_LINE('����');
ELSIF 
    vn_salary BETWEEN 3001 AND 6000 THEN
    DBMS_OUTPUT.PUT_LINE('�߰�');
ELSIF 
    vn_salary BETWEEN 6001 AND 10000 THEN
    DBMS_OUTPUT.PUT_LINE('����');
ELSE
    DBMS_OUTPUT.PUT_LINE('�ֻ���');
END IF;
END;
/

DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
    vn_commission NUMBER :=0;
BEGIN 
    vn_department_id := ROUND(DBMS_RANDOM.VALUE (10,120), -1);
    SELECT salary, commission_pct
    INTO vn_salary, vn_commission
    FROM employees
    WHERE department_id =vn_department_id
    AND ROWNUM =1;
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
IF vn_commission > 0 THEN
    IF vn_commission > 0.15 THEN
         dbms_output.put_line(vn_salary * vn_commission);
        END IF;
    ELSE
    dbms_output.put_line(vn_salary);
    END IF;
END;
/
-- CASE ��
DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE (10,120), -1);
    SELECT salary
    INTO  vn_salary
    FROM employees
    WHERE department_id =vn_department_id
    AND ROWNUM =1;
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
    CASE WHEN vn_salary BETWEEN 1 AND 3000 THEN
    DBMS_OUTPUT.PUT_LINE('����');
            WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('�߰�');
            WHEN vn_salary BETWEEN 6001 AND 9000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
            ELSE
            DBMS_OUTPUT.PUT_LINE('�ֻ���');
    END CASE;
END;
/
--loop��
DECLARE
 vn_base_num NUMBER := 3;
 vn_cnt NUMBER :=1;
 BEGIN
 LOOP
 DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' ||vn_cnt || '=' || vn_base_num * vn_cnt);
 vn_cnt := vn_cnt +1;
 EXIT WHEN vn_cnt > 9;
 END LOOP;
 END;
 /
-- WHILE ��
DECLARE
 vn_base_num NUMBER := 4;
 vn_cnt NUMBER :=1;
 BEGIN
 WHILE vn_cnt <= 9
 LOOP
 DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' ||vn_cnt || '=' || vn_base_num * vn_cnt);
 EXIT WHEN vn_cnt = 5; --cnt���� 5�� �Ǹ� ����
 vn_cnt := vn_cnt +1;    --cnt ��1�� ����

 END LOOP;
 END;
 /
 
-- FOR ��
-- IN REVERSE  �Ųٷ�
DECLARE
vn_num NUMBER := 5;
BEGIN 
FOR i in 1..9
LOOP
 DBMS_OUTPUT.PUT_LINE(vn_num || '*' || i || '=' || vn_num * i);
 END LOOP;
 END;
/
--CONTINUE ��

DECLARE
vn_num NUMBER := 3;
BEGIN
FOR i in 1..9
LOOP 
CONTINUE WHEN i =3;
 DBMS_OUTPUT.PUT_LINE(vn_num || '*' || i || '=' || vn_num * i);
 END loop;
 end;
/
--GOTO��
--���������� ���. ������ ����
DECLARE
 vn_base_num  NUMBER := 3;
BEGIN 
<<third>>
For i in 1..9
LOOP
DBMS_OUTPUT.PUT_LINE(vn_base_num || '*'|| i || '=' ||vn_base_num *i);
    IF i = 3 THEN
        GOTO fourth;
    END IF;
 end loop;
 <<fourth>>
    vn_base_num := 4;
 FOR i in 1..9
    LOOP
    DBMS_OUTPUT.PUT_LINE(vn_base_num || '*'|| i || '=' ||vn_base_num *i);
    end loop;
 end;
/
--NULL��
DECLARE
 vn_var VARCHAR2(10)  := 'C';
 BEGin
IF vn_var = 'A' THEN
DBMS_OUTPUT.PUT_LINE('A');
ELSIF vn_var = 'B' THEN
DBMS_OUTPUT.PUT_LINE('b');
ELSE NULL;
END IF;
/
CASE WHEN vn_var ='a' THEN
DBMS_OUTPUT.PUT_LINE('A');
WHEN vn_var = 'b' Then
DBMS_OUTPUT.PUT_LINE('b');
ELSE NUll;
END case;


--6/9�� PL/SQL 
--�Լ� ����
--������ �� ���ϱ�
CREATE OR REPLACE FUNCTION my_mod(num1  NUMBER , num2  NUMBER)
RETURN NUMBER
IS
vn_remainder  NUMBER := 0;
vn_quotient  NUMBER := 0;
BEGIN
vn_quotient := FLOOR(num1 / num2);
vn_remainder := num1 - (num2*vn_quotient );
RETURN vn_remainder ;
END;

/
SELECT my_mod(14, 5) reminder
FROM DUAL;

--���ڷ� �Է¹޹��� �� ������ ��ȯ
CREATE OR REPLACE FUNCTION p_country_name(p_country_id NUMBER)   --�Լ��̸� ���� (���� �Է� ��)
RETURN VARCHAR2            --�Լ� ��ȯ Ÿ��
IS
    vs_conutry_name COUNTRIES.COUNTRY_NAME%TYPE;   
BEGIN
    SELECT country_name
    INTO vs_conutry_name
    FROM countries
    WHERE country_id = p_country_id;

RETURN vs_conutry_name ;
END;
/

SELECT p_country_name(52777) ����1 , p_country_name(28765) ����2
FROM DUAL;

CREATE OR REPLACE FUNCTION p_country_name(p_country_id NUMBER)   --�Լ��̸� ���� (���� �Է� ��)
RETURN VARCHAR2            --�Լ� ��ȯ Ÿ��
IS
    vs_conutry_name COUNTRIES.COUNTRY_NAME%TYPE; 
    vs_cnt NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO vs_cnt
    FROM countries
    WHERE country_id = p_country_id;
    
    IF vs_cnt = 0 THEN vs_conutry_name := '�ش籹�� ����';
    ELSE
    SELECT country_name
    INTO vs_conutry_name
    FROM countries
    WHERE country_id = p_country_id;
END IF;

RETURN vs_conutry_name ;
END;
/
SELECT p_country_name(52777) ����1,  p_country_name(527745) ����2
FROM DUAL;


--��� ���� Ȯ��
CREATE OR REPLACE FUNCTION fn_get_user
RETURN VARCHAR2
IS
vs_user_name VARCHAR2(80);
BEGIN
SELECT USER
INTO vs_user_name
FROM DUAL;

RETURN vs_user_name;
ENd;
/
SELECT fn_get_user
FROM DUAL;


--���ν���
CREATE OR REPLACE PROCEDURE new_job_proc

  ( p_job_id IN jobs.job_id%TYPE,
p_job_title IN jobs.job_title%TYPE,
--����Ʈ �� ���� := (����Ʈ�� �Է�)
p_min_sal IN jobs.min_salary%TYPE := 10,
p_max_sal IN jobs.max_salary%TYPE := 100) 
IS 
BEGIN 
INSERT INTO JOBS( job_id, job_title, min_salary,max_salary, create_date, update_date)
            VALUES(p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
            commit;
END;
/
-- ������Ʈ ������ �����ϵ��� ���ν��� ����
CREATE OR REPLACE PROCEDURE new_job_proc

  ( p_job_id IN jobs.job_id%TYPE,
p_job_title IN jobs.job_title%TYPE,
--����Ʈ �� ���� := (����Ʈ�� �Է�)
p_min_sal IN jobs.min_salary%TYPE ,
p_max_sal IN jobs.max_salary%TYPE ) 

IS 
vn_cnt NUMBER :=0;
BEGIN 
SELECT COUNT(*)
INTO vn_cnt
FROM JOBS
WHERE job_id = p_job_id ;
IF vn_cnt = 0 THEN
    INSERT INTO JOBS( job_id, job_title, min_salary,max_salary, create_date, update_date)
            VALUES(p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
ELSE
    UPDATE JOBS
        SET job_title = p_job_title,
                min_salary = p_min_sal,
                max_salary = p_max_sal,
                update_date = SYSDATE
        WHERE job_id =p_job_id;
        END IF;
        commit;
END;
/

--���ν��� ȣ�� 1
EXEC  new_job_proc('SM_JOB1', 'Sample JOB1',3000,5000);

DELETE JOBS
WHERE job_id = 'SM_JOB1';
--���ν��� ȣ�� 2
EXECUTE new_job_proc(p_job_id => 'SM_JOB1', p_job_title=>'Sample JOB1' , p_min_sal => 2000, p_max_sal =>8000);

SELECT *
FROM jobs
WHERE job_id = 'SM_JOB1';

EXEC  new_job_proc('SM_JOB1', 'Sample JOB1');

--OUT,IN,OUT �Ű�����

CREATE OR REPLACE PROCEDURE new_job_proc
 ( p_job_id IN jobs.job_id%TYPE,
p_job_title IN jobs.job_title%TYPE,
p_min_sal IN jobs.min_salary%TYPE := 10,
p_max_sal IN jobs.max_salary%TYPE := 100,
p_upd_date OUT  jobs.update_date%TYPE) 
IS 
vn_cnt NUMBER :=0;
vn_cur_date jobs.update_date%TYPE := SYSDATE;
BEGIN
    SELECT COUNT(*)
    INTO vn_cnt
    FROM JOBS
    WHERE job_id = p_job_id;
    
    IF vn_cnt =0 THEN
      INSERT INTO JOBS( job_id, job_title, min_salary,max_salary, create_date, update_date)
            VALUES(p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
    ELSE
    UPDATE JOBS
        SET job_title = p_job_title,
                min_salary = p_min_sal,
                max_salary = p_max_sal,
                update_date = SYSDATE
        WHERE job_id =p_job_id;
        END IF;
    p_upd_date := vn_cur_date;
        commit;
END;
/
DECLARE
vn_cur_date jobs.update_date%TYPE;
BEGIN
-- �͸��� ���� ���ν����� ���� �ϸ� EXEC,EXECUTE ��� ���� �ʴ´�,
new_job_proc ('SM_JOB1', 'Sample JOB1',3000,5000,vn_cur_date);
DBMS_OUTPUT.PUT_LINE(vn_cur_date);
END;
/

CREATE OR REPLACE PROCEDURE test_proc(
p_var1   VARCHAR2,
p_var2  OUT VARCHAR2,
p_var3  IN OUT VARCHAR2)
IS

BEGIN
DBMS_OUTPUT.PUT_LINE(p_var1);
DBMS_OUTPUT.PUT_LINE(p_var2);
DBMS_OUTPUT.PUT_LINE(p_var3);

p_var2 := 'B2';
p_var3 := 'C3';
END;
/
--���ν��� ����
DECLARE
v_var1 VARCHAR2(10) :='A';
v_var2 VARCHAR2(10) :='B';
v_var3 VARCHAR2 (10) :='C';
BEGIN test_proc(v_var1, v_var2, v_var3);
DBMS_OUTPUT.PUT_LINE(v_var2);
DBMS_OUTPUT.PUT_LINE(v_var3);
END;
/