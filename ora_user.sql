    CREATE TABLE ex2_1 (
COLUMN1 CHAR(10),
COLUMN2 VARCHAR2(10),
COLUMN3 NVARCHAR2(10),
COLUMN4 NUMBER
);

INSERT INTO ex2_1 (column1, column2) VALUES ('abc', 'abc');

SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
 FROM ex2_1;
 
 CREATE TABLE ex2_2(
    COLUMN1 VARCHAR2(3),
    COLUMN2 VARCHAR2(3 byte),
    COLUMN3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES('abc', 'abc', 'abc');

SELECT column1, LENGTH(column1) AS len1,
       column2, LENGTH(column1) AS len2,
       column3, LENGTH(column1) AS len3
FROM ex2_2;

INSERT INTO ex2_2  (column3) VALUES('ȫ�浿');
       
 SELECT column3, LENGTH(column3) AS len3, LENGTHB(column3) AS bytelen
 FROM ex2_2;

CREATE TABLE ex2_3(
COL_INT INTEGER,
COL_DEC DECIMAL,
COL_NUM NUMBER
);

SELECT column_id, column_name, data_type, data_length
    FROM user_tab_cols
    WHERE table_name = 'EX2_3'
    ORDER BY column_id;

CREATE TABLE EX2_4(
    COL_FLOT1 FLOAT(32),
    COL_FLOT2 FLOAT
);

INSERT INTO ex2_4 (col_flot1, col_flot2) VALUES (1234567891234, 1234567891234);

CREATE TABLE EX2_5(
    COL_DATE DATE,
    COL_TIMESTAMP TIMESTAMP
);

INSERT INTO EX2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT *
FROM EX2_5;


CREATE TABLE EX2_6(
    COL_NULL VARCHAR2(10),
    COL_NOT_NULL VARCHAR2(10) NOT NULL
);

INSERT INTO EX2_6 VALUES ('AA','BB');

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_6';

CREATE TABLE ex2_7 (
    COL_UNIQUE_NULL     VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NNULL    VARCHAR2(10) UNIQUE NOT NULL,
    COL_UNIQUE          VARCHAR2(10),
    CONSTRAINTS unique_nm1 UNIQUE (COL_UNIQUE)
);

SELECT constraint_name, constraint_type, table_name, search_condition
 FROM user_constraints
 WHERE table_name = 'EX2_7';
 
INSERT INTO ex2_7 VALUES('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES('BB', 'BB', 'BB');

INSERT INTO ex2_7 VALUES('', 'CC', 'CC');

INSERT INTO ex2_7 VALUES('DD', 'DD', 'DD');

CREATE TABLE ex2_8(
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';
 
 INSERT INTO ex2_8 VALUES('','AA');
 
 INSERT INTO ex2_8 VALUES('AA','AA');

CREATE TABLE ex2_9(
        num1        NUMBER
        CONSTRAINTS check1 CHECK ( num1 BETWEEN 1 AND 9),
        gender VARCHAR2(10)
        CONSTRAINTS check2 CHECK( gender IN ('MALE', 'FEMALE'))
);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_9';

INSERT INTO ex2_9 VALUES (10, 'MAN');

INSERT INTO ex2_9 VALUES (5, 'FEMALE');

CREATE TABLE ex2_10(
    Col1 VARCHAR2(10) NOT NULL,
    Col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE);

INSERT INTO ex2_10 (col1, col2) VALUES ('AA', 'BB');

SELECT *
    FROM ex2_10;
    
DROP TABLE ex2_10;

CREATE TABLE ex2_10(
    Col1 VARCHAR2(10) NOT NULL,
    Col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE);
    
ALTER TABLE ex2_10 RENAME COLUMN col1 TO col11;

DESC ex2_10;

ALTER TABLE ex2_10 MODIFY Col2 VARCHAR2(30);

DESC ex2_10;

ALTER TABLE ex2_10 ADD Col3 NUMBER;

DESC ex2_10;

ALTER TABLE ex2_10 DROP COLUMN Col3 ;]

DESC ex2_10;

ALTER TABLE ex2_10 ADD CONSTRAINTS pk_ex2_10 PRIMARY KEY (col11);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_10';

ALTER TABLE ex2_10 DROP CONSTRAINTS pk_ex2_10;

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_10';

create table ex2_9_1 as
select *
    from ex2_9;
    
select a.employee_id, a.emp_name, a.department_id,
       b.department_name
from employees a,
     departments b
where a.department_id = b.department_id;

create or replace view emp_dept_v1 as
select a.employee_id, a.emp_name, a.department_id,
       b.department_name
from employees a,
     departments b
where a.department_id = b.department_id;

select *
from emp_dept_V1;c
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--�ε���(p.75)

CREATE UNIQUE INDEX ex2_10_ix01
ON ex2_10 (col11);

SELECT index_name, index_type, table_name, uniqueness
    from    user_indexes
WHERE table_name = 'EX2_10';

SELECT constraint_name, constraint_type, table_name, index_name
    FROM user_constraints
WHERE table_name = 'JOB_HISTORY';

SELECT index_name, index_type, table_name, uniqueness
    FROM user_indexes
WHERE table_name = 'JOB_HISTORY';

CREATE INDEX ex2_10_ix02
ON ex2_10 (col11, col12);

SELECT index_name, index_type, table_name, uniqueness
    FROM user_indexes
WHERE TABLE_NAME = 'EX2_10';


DROP INDEX ex2_10_ix02;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--�ó��(p.80)

CREATE OR REPLACE SYNONYM syn_channel
FOR channels;

SELECT COUNT(*)
    FROM syn_channel;
    
ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK;

SELECT COUNT(*)
FROM ora_user.syn_channel;

GRANT SELECT ON syn_channel TO HR;

SELECT COUNT(*)
FROM ora_user.syn_channel;

CREATE OR REPLACE PUBLIC SYNONYM syn_channe12
FOR channels;

GRANT SELECT ON syn_channel2 TO PUBLIC;

SELECT COUNT(*)
    FROM syn_channel2;

DROP SYNONYM syn_channel;

DROP PUBLIC SYNONYM syn_channel2;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--������(p.83)

CREATE SEQUENCE my_seq1
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

DELETE ex2_8;

INSERT INTO ex2_8 (col1) VALUES ( my_seq1.NEXTVAL);

INSERT INTO ex2_8 (col1) VALUES (my_seq1.NEXTVAL);

SELECT *
    FROM ex2_8;

SELECT my_seq1.CURRVAL
    FROM DUAL;
    
INSERT INTO ex2_8 (col1) VALUES ( my_seq1.NEXTVAL);

SELECT *
    FROM ex2_8;
    
SELECT my_seq1.NEXTVAL
    FROM DUAL;
    
INSERT INTO ex2_8 (col1) VALUES ( my_seq1.NEXTVAL);

SELECT *
    FROM ex2_8;
    
DROP SEQUENCE my_seq1;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--90p ����Ǯ��

-- ���� 1
CREATE TABLE ORDERS(
    ORDER_ID NUMBER(12,0),
    ORDER_DATE DATE ,
    ORDER_MODE VARCHAR2(8 BYTE),
    CUSTOMER_ID NUMBER(6,0),
    ORDER_STATUS NUMBER(2,0),
    ORDER_TOTAL NUMBER(8,2) DEFAULT 0,
    SALES_REP_ID NUMBER(6,0),
    PROMOTION_ID NUMBER(6,0),
    CONSTRAINTS PK_ORDER PRIMARY KEY (ORDER_ID),
    CONSTRAINTS CK_ORDER_MODE CHECK (ORDER_MODE IN ('direct','online'))
);

-- ���� 2
CREATE TABLE ORDER_ITEMS(
    ORDER_ID NUMBER(12,0),
    LINE_ITEM_ID NUMBER(3,0),
    PRODUCT_ID NUMBER(3,0),
    UNIT_PRICE NUMBER(8,2) DEFAULT 0,
    QUANTITY NUMBER(8,0) DEFAULT 0,
    CONSTRAINT CHECK_ID PRIMARY KEY(ORDER_ID,LINE_ITEM_ID)
);

-- ���� 3
CREATE TABLE PROMOTIONS(
    PROMO_ID NUMBER(6,0) PRIMARY KEY,
    PROMO_NAME VARCHAR2(20)
);

-- ���� 5
CREATE SEQUENCE ORDERS_SEQ
    INCREMENT BY 1
    START WITH 1000
    MINVALUE 1
    MAXVALUE 9999999
    NOCACHE
    NOCYCLE ;
    
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--SELECT ��(p.92)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000

-- JOB_ID �� IT_PROG AND ���� �߰�
-- AND JOB_ID = 'IT_PROG'

-- JOB_ID �� IT_PROG OR ���� �߰�
OR  JOB_ID = 'IT_PROG'
ORDER BY EMPLOYEE_ID;  -- ������� �����ؼ� ����

-- �� �� �̻��� ���̺��� �����͸� ��ȸ�ϱ�

SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.DEPARTMENT_ID,
    B.DEPARTMENT_NAME AS DEP_NAME

FROM EMPLOYEES A,
    DEPARTMENTS B

WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--INSERT ��

CREATE TABLE ex3_1(
    col1 VARCHAR2(10),
    col2 NUMBER,
    col3 DATE
);

INSERT INTO ex3_1(col1, col2, col3)
VALUES ('ABC',10,SYSDATE);

INSERT INTO ex3_1(col1, col2, col3)
VALUES (SYSDATE, 'DEF' ,20); 

INSERT INTO ex3_1(col1, col2, col3)
VALUES ('ABC',10,30);

INSERT INTO ex3_1
VALUES ('GHI',10,SYSDATE);

INSERT INTO ex3_1 (col1,col2)
VALUES ('GHI',20);

INSERT INTO ex3_1
VALUES ('GHI',30);

CREATE TABLE ex3_2(
    emp_id NUMBER,
    emp_name VARCHAR2(100));

INSERT INTO ex3_2( emp_id, emp_name)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000

INSERT INTO ex3_1 (col1,col2,col3)
VALUES (10,'10','2014-01-01');

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--UPDATE��
SELECT *
    FROM ex3_1;
    
UPDATE ex3_1
SET col2 = 50;

SELECT *
     from ex3_1;
     
UPDATE ex3_1
    SET col3 = SYSDATE
    WHERE col3 IS NULL;
    
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--MEGA��
CREATE TABLE ex3_3(
    employee_id NUMBER,
    bonus_amt NUMBER DEFAULT 0
);

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id
    FROM employees e, sales s
WHERE e.employee_id = s.employee_id
    AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;

    

SELECT *
    FROM ex3_3
ORDER BY employee_id;



SELECT employee_id, manager_id, salary, salary * 0.01
    FROM employees
WHERE employee_id IN (SELECT employee_id FROM ex3_3);



SELECT employee_id, manager_id, salary, salary *0.001
    FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM ex3_3)
     AND manager_id = 146;

MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
                    FROM employees
                    WHERE manager_id = 146) b
                ON (d.employee_id = b.employee_id)
        WHEN MATCHED THEN
            UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
        WHEN NOT MATCHED THEN
            INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *0.001)
            WHERE (b.salary < 8000);
            

SELECT *
    FROM ex3_3
 ORDER BY EMPLOYEE_ID;
 
 
 MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
                    FROM employees
                    WHERE manager_id = 146) b
                ON (d.employee_id = b.employee_id)
        WHEN MATCHED THEN
            UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
            DELETE WHERE (B.employee_id = 161)
        WHEN NOT MATCHED THEN
            INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *0.001)
            WHERE (b.salary < 8000);
            
            
SELECT *
    FROM ex3_3
 ORDER BY EMPLOYEE_ID;
 
 ---------------------------OR-------------------------------------------------
 
 
 DROP TABLE ex3_3;
 
 
 -- EX3_3 ���̺� ����
CREATE TABLE EX3_3(
    employee_id NUMBER,
    bonus_amt NUMBER DEFAULT 0);
 
 -- ��ȸ   
SELECT *
FROM EX3_3;

-- SALES ���̺��� 2000�� 10�� ~ 200�� 12������ ������ �޼��� �����ȣ �Է�

INSERT INTO EX3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
-- �����ȣ�� �ߺ��� ������
GROUP BY e.employee_id;

-- ��ȸ
SELECT *
FROM EX3_3
ORDER BY employee_id;

-- ������ ����� ex3_3 ���̺� �ִ� ����� ����� ��ġ�ϸ� 1% ���ʽ�
-- ��ġ ���� ������ �޿��� 0.1% ���ʽ� ���� (�޿��� 8000 �̸��� ����� �ش�)

-- ��� , ������ ���, �޿�, �޿� * 0.01 ��ȸ
SELECT employee_id, manager_id, salary,salary * 0.01
FROM employees
WHERE employee_id IN (SELECT employee_id FROM EX3_3);

-- ������̺��� ������ ����� 146 �� �� �� ex3_3 ���̺� ���� ����� ���, ������ ���, �޿�, �޿�*0.001 ��ȸ
SELECT employee_id , manager_id, salary, salary * 0.001
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM ex3_3)
AND manager_id = 146;

-- �����ϱ�
MERGE INTO ex3_3 d -- ex3_3 ���̺��� d �� ����
USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b -- ������ ����� 146
            ON (d.employee_id = b.employee_id) -- d , b ������ ���� �� ������Ʈ
WHEN MATCHED THEN -- ������ �´ٸ�
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01 -- 1% ���ʽ� ����
WHEN NOT MATCHED THEN -- ������ Ʋ���ٸ�
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.001) -- 0.1 ���ʽ� ����
    WHERE (b.salary < 8000); -- �޿��� 8000 �̸�

-- ��ȸ
SELECT *
    FROM ex3_3
    ORDER BY employee_id;
    
MERGE INTO ex3_3 d -- ex3_3 ���̺��� d �� ����
USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b -- ������ ����� 146
            ON (d.employee_id = b.employee_id) -- d , b ������ ���� �� ������Ʈ
WHEN MATCHED THEN -- ������ �´ٸ�
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01 -- 1% ���ʽ� ����
    DELETE WHERE (B.employee_id = 161) -- ���ǿ� �´� 161 ��� ����
WHEN NOT MATCHED THEN -- ������ Ʋ���ٸ�
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.001) -- 0.1 ���ʽ� ����
    WHERE (b.salary < 8000); -- �޿��� 8000 �̸�

-- ��ȸ
SELECT *
    FROM ex3_3
    ORDER BY employee_id;
    
    
 �ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
 --DELETE��
 DELETE ex3_3;
 
 SELECT *
    FROM EX3_3
ORDER BY employee_id;

SELECT partition_name
    FROM user_tab_partitions
WHERE table_name = 'SALES';
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--COMMIT , ROLLBACK , TRUNCATE

CREATE TABLE ex3_4(
    employee_id NUMBER);

INSERT INTO ex3_4 VALUES(100);

SELECT *
FROM ex3_4;
 
COMMIT;

TRUNCATE TABLE ex3_4;
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--�ǻ��÷�
SELECT ROWNUM, employee_id
    FROM employees;
    
SELECT ROWNUM, employee_id
    FROM employees
    WHERE ROWNUM <5;
    
SELECT ROWNUM, employee_id, ROWID
    FROM employees
WHERE ROWNUM <5;
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--������

SELECT employee_id || '-' || emp_name AS employee_info
    FROM employees
WHERE ROWNUM <5;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--ǥ����

SELECT employee_id, salary,
    CASE WHEN salary <= 5000 THEN 'C���'
         WHEN salary > 5000 AND salary <= 15000 THEN 'B���'
         ELSE 'A���'
    END AS salary_grade
FROM employees;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--���ǽ�
SELECT employee_id, salary
    FROM employees
WHERE salary = ANY (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
    FROM employees
WHERE salary =2000
OR salary =3000
oR salary =4000
ORDER BY employee_id;

SELECT employee_id, salary
    FROM employees
WHERE salary = ALL(2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
    FROM employees
WHERE salary = SOME (2000,3000,4000)
ORDER BY employee_id;



SELECT employee_id, salary
    FROM employees
WHERE NOT(salary >= 2500)
ORDER BY employee_id;

SELECT employee_id, salary
    FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;

SELECT employee_id, salary
    FROM employees
WHERE salary IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
    FROM employees
WHERE salary NOT IN (2000,3000,4000)
ORDER BY employee_id;

SELECT department_id, department_name
FROM departments a
WHERE EXISTS ( SELECT *
                    FROM employees b
                    WHERE a.department_id = b.department_id
                    AND b.salary >3000)
ORDER BY a.department_name;

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
ORDER BY emp_name;

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'Al%'
ORDER BY emp_name;

CREATE TABLE ex3_5(
    names VARCHAR2(30));
    
INSERT INTO ex3_5 VALUES ('ȫ�浿');

INSERT INTO ex3_5 VALUES ('ȫ���');

INSERT INTO ex3_5 VALUES ('ȫ���');

INSERT INTO ex3_5 VALUES ('ȫ���');

SELECT *
    FROM ex3_5
WHERE names LIKE 'ȫ��%';

SELECT *
FROM ex3_5
WHERE names LIKE 'ȫ��_';

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
 --3�� ����

-- ���� 1
-- ���̺� ������ ������̺��� ������ ����� 124, �޿��� 2000���� 3000���̿� �ִ� ����� ���, �����, �޿�, �����ڻ�� �Է��ϴ� INSERT�� �ۼ�

CREATE TABLE ex3_6(
    employee_id NUMBER(6,0),
    emp_name VARCHAR(80 BYTE),
    salary NUMBER(8,2),
    manager_id NUMBER(6,0));
    
INSERT INTO ex3_6
SELECT employee_id, emp_name, salary, manager_id
FROM employees
WHERE manager_id  = '124'
AND salary BETWEEN '2000' AND '3000'
ORDER BY employee_id;

SELECT *
FROM ex3_6;

-- ����2
-- �����ڻ���� 145���� ����� ã�� �� ���̺� �ִ� ����� ����� ��ġ�ϸ�
-- ���ʽ� �ݾ׿� �ڽ��� �޿��� 1%�� ���ʽ��� �����ϰ�
-- ex3_3 ���̺� �ִ� ����� ����� ��ġ���� �ʴ� ����� �ű��Է� (���ʽ� �ݾ��� �޿��� 0.5%) �ϴ� MERGE�� �ۼ�

DELETE EX3_3;

INSERT INTO EX3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;

SELECT *
FROM ex3_3;

MERGE INTO ex3_3 d
USING (SELECT employee_id,salary,manager_id
            FROM employees
            WHERE manager_id = 145) b
            ON (d.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
WHEN NOT MATCHED THEN
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.005);
    
SELECT *
FROM EX3_3
ORDER BY employee_id;

-- ���� 3
-- ������̺��� Ŀ�̼� ���� ���� ����� ����� ������� ����
SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL;

-- ���� 4
-- �Ʒ� ������ �� �����ڷ� ��ȯ

/*SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;
�� �������ڷ� ��ȯ�ϱ�*/


SELECT employee_id, salary
FROM employees
WHERE salary >= 2000 AND salary <= 2500
ORDER BY employee_id;

-- ���� 5

-- �� ������ ANY,ALL�� ����ؼ� ������ ����� �����ϰ� ����

-- 1 ����
SELECT employee_id, salary
FROM employees
WHERE salary IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000,3000,4000)
ORDER BY employee_id;

-- 2 ����
SELECT employee_id, salary
FROM employees
WHERE salary NOT IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary <>ALL (2000,3000,4000)
ORDER BY employee_id;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--�����Լ�

SELECT ABS(10), ABS(-10), ABS(-10.123)
    FROM DUAL;

SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)
    FROM DUAL;
    
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)
    FROM DUAL;
    
SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)
    FROM DUAL;
    
SELECT ROUND(10.154,1), ROUND(10.154,2), ROUND(10.154,3)
    FROM DUAL;
    
SELECT ROUND(0,3), ROUND(115.155,-1), ROUND(115.155, -2)
    FROM DUAL;

SELECT TRUNC(115.155), TRUNC(115.155,1), TRUNC(115.155,2), TRUNC(115.155, -2)
    FROM DUAL;
    
SELECT POWER(3,2), POWER(3,3), POWER(3, 3.0001)
    FROM DUAL;
    
SELECT POWER(-3, 3.0001)
    FROM DUAL;
    
SELECT SQRT(2), SQRT(5)
    FROM DUAL;
    
SELECT MOD(19,4), MOD(19.123, 4.2)
    FROM DUAL;
    
SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2)
    FROM DUAL;
    
SELECT EXP(2), LN(2.713), LOG(10,100)
    FROM DUAL;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--�����Լ�
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good��bye')
    FROM DUAL;
    
SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never ay goodbye')
    FROM DUAL;
    
SELECT CONCAT('I Have', 'A Dream'), 'I Have' || ' A Dream'
    FROM DUAL;
    
SELECT SUBSTR('ABCDEFG',1,4), SUBSTR('ABCDEFG',-1,4)
    FROM DUAL;
    
SELECT SUBSTRB('ABCDEFG',1,4) , SUBSTRB('�����ٶ󸶹ٻ�',1,4)
    FROM DUAL;

SELECT LTRIM('ABCDEFGABC','ABC'),
       LTRIM('�����ٶ�','��'),
       RTRIM('ABCDEFGABC','ABC'),
       RTRIM('�����ٶ�','��')
    FROM DUAL;

SELECT LTRIM('�����ٶ�','��'), RTRIM('�����ٶ�','��')
    FROM DUAL;
    
CREATE TABLE ex4_1(
            phone_num VARCHAR2(30));
            
INSERT INTO ex4_1 VALUES ('111-1111');

INSERT INTO ex4_1 VALUES ('111-2222');

INSERT INTO ex4_1 VALUES ('111-3333');

SELECT *
    FROM ex4_1;
    
SELECT LPAD(phone_num, 12, '(02)')
    FROM ex4_1;

SELECT RPAD(phone_num,12,'(02)')
    FROM ex4_1;
    
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '��', '��')
    FROM DUAL;
    
SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ',' ','')
    FROM DUAL;
    
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS rep,
       TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS trn
    FROM DUAL;
    
SELECT employee_id,
       TRANSLATE(EMP_NAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','thehillsarealivewiththesou')
       AS TRANS_NAME
    FROM employees;
    
SELECT INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ���� ���� ���� ��ſ� ����', '����') AS INSTR1,
       INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5) AS INSTR2,
       INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5, 2)AS INSTR3
    FROM DUAL;
    
SELECT LENGTH('���ѹα�'),
       LENGTHB('���ѹα�')
    FROM DUAL;
    
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--��¥�Լ�
SELECT sysdate, systimestamp
    FROM DUAL;
    
SELECT ADD_MONTHS(SYSDATE,1), ADD_MONTHS(SYSDATE, -1)
    FROM DUAL;

SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE,1)) mon1,
       MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon2
    FROM DUAL;
    
SELECT LAST_DAY(SYSDATE)
    FROM DUAL;
    
SELECT SYSDATE, ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month')
    FROM DUAL;
    
SELECT NEXT_DAY(SYSDATE, '�ݿ���')
    FROM DUAL;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--��ȯ�Լ�
SELECT TO_CHAR(123456789,'999,999,999')
    FROM DUAL;
    
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    FROM DUAL;
    
SELECT TO_NUMBER('123456')
    FROM DUAL;
    
SELECT TO_DATE('20140101','YYYY-MM-DD')
    FROM DUAL;
    
SELECT TO_TIMESTAMP('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
    FROM DUAL;
    
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--NULL ���� �Լ�
SELECT NVL(manager_id, employee_id)
    FROM employees
 WHERE manager_id IS null;

SELECT employee_id,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
 FROM employees;
 
SELECT employee_id, salary, commission_pct,
       COALESCE ( salary * commission_pct, salary) AS salary2
    FROM employees;
    
SELECT employee_id, commission_pct
    FROM employees
WHERE commission_pct<0.2;

SELECT COUNT(*)==
    FROM employees
WHERE NVL(commission_pct, 0) <0.2;

SELECT COUNT(*)
    FROM employees
WHERE LNNVL(commission_pct>= 0.2);

SELECT employee_id,
       TO_CHAR(start_date, 'YYYY') start_year,
       TO_CHAR(end_date, 'YYYY') end_year,
       NULLIF(TO_CHAR
       (end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY') ) nullif_year
    FROM job_history;

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--��Ÿ�Լ�
SELECT GREATEST(1,2,3,2),
       LEAST(1,2,3,2)
    FROM DUAL;
    
SELECT GREATEST('�̼���','������','�������'),
       LEAST('�̼���','������','�������')
FROM DUAL;

SELECT prod_id,
       DECODE(channel_id, 3, 'Direct',
                          9, 'Direct',
                          5, 'Indirect',
                          4, 'Indirect',
                             'Others') decodes
    FROM sales
WHERE rownum<10;
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--4�幮��
-- 1
SELECT LPAD(SUBSTR(phone_number,5), 12, '(02)')
FROM employees;

-- 2

SELECT employee_id �����ȣ, emp_name �����, HIRE_DATE �Ի�����, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) �ټӳ��
FROM employees
WHERE  ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)>= 10
ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12);

-- 3

SELECT REPLACE(cust_main_phone_number, '-' , '/')
FROM CUSTOMERS;

-- 4

SELECT TRANSLATE(cust_main_phone_number, '0123456789', 'ABCDEFGHIJ')
FROM CUSTOMERS;

-- 5

SELECT SUBSTR(TO_NUMBER(TO_CHAR(SYSDATE, 'yyyymmdd')),1,4)  - cust_year_of_birth ����
FROM CUSTOMERS;

SELECT DECODE(SUBSTR(SUBSTR(TO_NUMBER(TO_CHAR(SYSDATE, 'yyyymmdd')),1,4)  - cust_year_of_birth,1,1),
                    3,'30��',
                    4,'40��',
                    5,'50��',
                    '��Ÿ') ����
FROM CUSTOMERS;

-- 6 

SELECT ����,
CASE WHEN ���� BETWEEN 20 AND 29 THEN '20��'
        WHEN ���� BETWEEN 30 AND 39 THEN '30��'
        WHEN ���� BETWEEN 40 AND 49 THEN '40��'
        WHEN ���� BETWEEN 50 AND 59 THEN '50��'
        WHEN ���� BETWEEN 60 AND 69 THEN '60��'
        WHEN ���� BETWEEN 70 AND 79 THEN '70��'
        WHEN ���� BETWEEN 80 AND 89 THEN '80��'
        WHEN ���� BETWEEN 90 AND 99 THEN '90��'
END AS ���ɴ�
FROM (SELECT TRUNC(TO_CHAR(SYSDATE,'YYYY') - cust_year_of_birth) AS ���� FROM CUSTOMERS);

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--�⺻�����Լ�
SELECT COUNT(*)
    FROM employees;
    
SELECT COUNT(employee_id)
    FROM employees;
    
SELECT COUNT(department_id)
     FROM employees;
     
SELECT COUNT(DISTINCT department_id)
    FROM employees;
    
SELECT DISTINCT department_id
    FROM employees
ORDER BY 1;

SELECT SUM(salary)
    FROM  employees;
    
SELECT SUM(salary), SUM(DISTINCT salary)
    FROM employees;
    
SELECT AVG(salary), AVG(DISTINCT salary)
    FROM employees;
    
SELECT MIN(salary), MAX(salary)
    FROM employees;
    
SELECT MIN(DISTINCT salary), MAX(DISTINCT salary)
    FROM employees;
    
SELECT VARIANCE(salary), STDDEV(salary)
    FROM employees;
    
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--GROUP BY���� HAVING ��
 SELECT department_id, SUM(salary)
    FROM employees
    GROUP BY department_id
    ORDER BY department_id;
    
SELECT *
FROM kor_loan_status;

SELECT period, region, SUM(loan_jan_amt) totl_jan
    FROM kor_loan_status
    WHERE period LIKE '2013%'
    GROUP BY period, region
    ORDER BY period, region;
    
SELECT period, region, SUM(loan_jan_amt) totl_jan
    FROM kor_loan_status
    WHERE period = '201311'
    GROUP BY region
    ORDER BY region;
    
SELECT period, region, SUM(loan_jan_amt) totl_jan
    FROM kor_loan_status
    WHERE period = '201311'
    GROUP BY period, region
    HAVING SUM(loan_jan_amt)>100000 
    ORDER BY region;        
    
SELECT period, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period = '201310'
GROUP BY period, region
HAVING SUM(loan_jan_amt) < 40000
ORDER BY totl_jan;
    
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--ROLLUP���� CUBE ��
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, gubun
ORDER BY period;

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY ROLLUP(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun );

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY ROLLUP(period), gubun;

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY CUBE(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, CUBE(gubun );

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--���տ�����
CREATE TABLE exp_goods_asia(
country VARCHAR2(10),
seq NUMBER,
goods VARCHAR2(80)
);

INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7, '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8, 'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9, '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10, 'ö �Ǵ� ���ձݰ�');


INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    ORDER BY seq;

SELECT goods
    FROM exp_goods_asia
    WHERE country = '�Ϻ�'
    ORDER BY seq;
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country = '�Ϻ�';
    
SELECT goods
     FROM exp_goods_asia
     WHERE country = '�ѱ�'
     UNION ALL
     SELECT goods
     FROM exp_goods_asia
     WHERE country = '�Ϻ�';
     
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    INTERSECT
    SELECT goods
    FROM exp_goods_asia
    WHERE country = '�Ϻ�';

SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    MINUS
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�Ϻ�'
    MINUS��
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='�ѱ�';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    UNION
    SELECT seq,goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�';
    
SELECT seq,goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    UNION
    SELECT seq,goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�';
    
SELECT seq
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    ORDER BY goods
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '�ѱ�'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='�Ϻ�'
    ORDER BY goods;
    
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, (gubun,region));

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--5�� ����
-- 1. ������̺��� �Ի�⵵�� ������� ���ϴ� ����

SELECT TO_CHAR(hire_date,'YYYY') �⵵, COUNT(*) �ο���
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY');

-- 2  kor_loan_status ���̺��� 2012�⵵ ����, ������ ���� �� �ܾ��� ���ϴ� ���� �ۼ�

SELECT period, region, SUM(loan_jan_amt) ��ä��ä
FROM kor_loan_status
WHERE period LIKE  '2012%'
GROUP BY ROLLUP(period, region);

-- 3 ������ ������ ���� ROLLUP

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);
-- ROLLUP�� ������� �ʰ� ���� �����ڷ� ������ ����� �������� ���� �ۼ��ϱ�


SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, gubun
UNION
SELECT period, null, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, null;

-- 4 ���� ������ �����ؼ� ����� Ȯ���ϰ� ���� �����ڷ� ������ ����� �����ϵ��� ���� �ۼ�

SELECT period,
CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) ELSE 0 END ���ô㺸�����,
CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) ELSE 0 END ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

-- INTERSECT

SELECT period, gubun, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period Like '201311'
GROUP BY period, gubun
INTERSECT
SELECT period, gubun, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period Like '201311'
GROUP BY period, gubun;

-- UNION

SELECT period, SUM(loan_jan_amt) ���ô㺸�����, 0 ��Ÿ�����
FROM kor_loan_status
WHERE period Like '201311' AND gubun = '���ô㺸����'
GROUP BY period
UNION
SELECT period, 0, SUM(loan_jan_amt)  ��Ÿ�����
FROM kor_loan_status
WHERE period Like '201311' AND gubun = '��Ÿ����'
GROUP BY period;

--5 ������ ���� ����, �� ������ �� ���� ���� �� �ܾ��� ���ϴ� ������ �ۼ��غ���
SELECT ����,
    SUM(AMT1) AS "201111",
    SUM(AMT2) AS "201112",
    SUM(AMT3) AS "201210",
    SUM(AMT4) AS "201211",
    SUM(AMT5) AS "201312",
    SUM(AMT6) AS "201310",
    SUM(AMT7) AS "201311"

FROM (SELECT region ����,
                        CASE WHEN period = '201111' THEN LOAN_JAN_AMT ELSE 0 END AMT1,
                        CASE WHEN period = '201112' THEN LOAN_JAN_AMT ELSE 0 END AMT2,
                        CASE WHEN period = '201210' THEN LOAN_JAN_AMT ELSE 0 END AMT3,
                        CASE WHEN period = '201211' THEN LOAN_JAN_AMT ELSE 0 END AMT4,
                        CASE WHEN period = '201312' THEN LOAN_JAN_AMT ELSE 0 END AMT5,
                        CASE WHEN period = '201310' THEN LOAN_JAN_AMT ELSE 0 END AMT6,
                        CASE WHEN period = '201311' THEN LOAN_JAN_AMT ELSE 0 END AMT7
            FROM KOR_LOAN_STATUS
                        )
GROUP BY ����
ORDER BY ����;
�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
--���� 06/01

--1��    
select replace(lpad(substr(phone_number, 4, 12),14,'(031)'),'.','-') 
from employees;

--2��
SELECT employee_id �����ȣ, emp_name �����, HIRE_DATE �Ի�����, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) �ټӳ��
FROM employees
WHERE  ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)>= 22
ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12);

--3��  
select cust_name, TRANSLATE(cust_main_phone_number, '0123456789', 'abcdefghij'), cust_main_phone_number
from customers;

--4��
CREATE TABLE exam3(
name VARCHAR(100),
new_Phone_number VARCHAR(25)
);

--5��
INSERT INTO exam3 ( name, new_phone_number)
SELECT cust_name ,TRANSLATE(cust_main_phone_number,  '0123456789', 'ABCDEFGHIJ')
FROM CUSTOMERS;

--6��
select translate(new_phone_number,'abcdefghij','0123456789') from exam3;

--7��
select cust_name,
case substr(cust_year_of_birth,1,3) when '195' then '1950���' 
 when '196' then '1960���' 
 when '197' then '1970���' 
 when '198' then '1980���' 
 when '199' then '1990���'
 else '��Ÿ'
end
from customers;

--8��
select to_char(hire_date,'mm'), count(*)
from employees
group by to_char(hire_date,'mm')
order by 1;

--9��
SELECT region ������, SUM(loan_jan_amt) ��ä��ä
FROM kor_loan_status
WHERE period LIKE  '2011%'
GROUP BY ROLLUP(region);

�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�


