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

INSERT INTO ex2_2  (column3) VALUES('홍길동');
       
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
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--인덱스(p.75)

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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--시노님(p.80)

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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--시퀀스(p.83)

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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--90p 문제풀이

-- 예제 1
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

-- 예제 2
CREATE TABLE ORDER_ITEMS(
    ORDER_ID NUMBER(12,0),
    LINE_ITEM_ID NUMBER(3,0),
    PRODUCT_ID NUMBER(3,0),
    UNIT_PRICE NUMBER(8,2) DEFAULT 0,
    QUANTITY NUMBER(8,0) DEFAULT 0,
    CONSTRAINT CHECK_ID PRIMARY KEY(ORDER_ID,LINE_ITEM_ID)
);

-- 예제 3
CREATE TABLE PROMOTIONS(
    PROMO_ID NUMBER(6,0) PRIMARY KEY,
    PROMO_NAME VARCHAR2(20)
);

-- 예제 5
CREATE SEQUENCE ORDERS_SEQ
    INCREMENT BY 1
    START WITH 1000
    MINVALUE 1
    MAXVALUE 9999999
    NOCACHE
    NOCYCLE ;
    
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--SELECT 문(p.92)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000

-- JOB_ID 가 IT_PROG AND 조건 추가
-- AND JOB_ID = 'IT_PROG'

-- JOB_ID 가 IT_PROG OR 조건 추가
OR  JOB_ID = 'IT_PROG'
ORDER BY EMPLOYEE_ID;  -- 사번으로 정렬해서 보기

-- 한 개 이상의 테이블에서 데이터를 조회하기

SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.DEPARTMENT_ID,
    B.DEPARTMENT_NAME AS DEP_NAME

FROM EMPLOYEES A,
    DEPARTMENTS B

WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--INSERT 문

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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--UPDATE문
SELECT *
    FROM ex3_1;
    
UPDATE ex3_1
SET col2 = 50;

SELECT *
     from ex3_1;
     
UPDATE ex3_1
    SET col3 = SYSDATE
    WHERE col3 IS NULL;
    
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--MEGA문
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
 
 
 -- EX3_3 테이블 생성
CREATE TABLE EX3_3(
    employee_id NUMBER,
    bonus_amt NUMBER DEFAULT 0);
 
 -- 조회   
SELECT *
FROM EX3_3;

-- SALES 테이블에서 2000년 10월 ~ 200년 12월까지 매출을 달성한 사원번호 입력

INSERT INTO EX3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
-- 사원번호의 중복을 제거함
GROUP BY e.employee_id;

-- 조회
SELECT *
FROM EX3_3
ORDER BY employee_id;

-- 관리자 사번이 ex3_3 테이블에 있는 사원의 사번과 일치하면 1% 보너스
-- 일치 하지 않으면 급여의 0.1% 보너스 지급 (급여가 8000 미만인 사원만 해당)

-- 사번 , 관리자 사번, 급여, 급여 * 0.01 조회
SELECT employee_id, manager_id, salary,salary * 0.01
FROM employees
WHERE employee_id IN (SELECT employee_id FROM EX3_3);

-- 사원테이블에서 관리자 사번이 146 인 것 중 ex3_3 테이블에 없는 사원의 사번, 관리자 사번, 급여, 급여*0.001 조회
SELECT employee_id , manager_id, salary, salary * 0.001
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM ex3_3)
AND manager_id = 146;

-- 병합하기
MERGE INTO ex3_3 d -- ex3_3 테이블을 d 로 정의
USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b -- 관리자 사번이 146
            ON (d.employee_id = b.employee_id) -- d , b 조건이 같을 때 업데이트
WHEN MATCHED THEN -- 조건이 맞다면
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01 -- 1% 보너스 지급
WHEN NOT MATCHED THEN -- 조건이 틀리다면
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.001) -- 0.1 보너스 지급
    WHERE (b.salary < 8000); -- 급여가 8000 미만

-- 조회
SELECT *
    FROM ex3_3
    ORDER BY employee_id;
    
MERGE INTO ex3_3 d -- ex3_3 테이블을 d 로 정의
USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b -- 관리자 사번이 146
            ON (d.employee_id = b.employee_id) -- d , b 조건이 같을 때 업데이트
WHEN MATCHED THEN -- 조건이 맞다면
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01 -- 1% 보너스 지급
    DELETE WHERE (B.employee_id = 161) -- 조건에 맞는 161 사원 삭제
WHEN NOT MATCHED THEN -- 조건이 틀리다면
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.001) -- 0.1 보너스 지급
    WHERE (b.salary < 8000); -- 급여가 8000 미만

-- 조회
SELECT *
    FROM ex3_3
    ORDER BY employee_id;
    
    
 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 --DELETE문
 DELETE ex3_3;
 
 SELECT *
    FROM EX3_3
ORDER BY employee_id;

SELECT partition_name
    FROM user_tab_partitions
WHERE table_name = 'SALES';
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--COMMIT , ROLLBACK , TRUNCATE

CREATE TABLE ex3_4(
    employee_id NUMBER);

INSERT INTO ex3_4 VALUES(100);

SELECT *
FROM ex3_4;
 
COMMIT;

TRUNCATE TABLE ex3_4;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--의사컬럼
SELECT ROWNUM, employee_id
    FROM employees;
    
SELECT ROWNUM, employee_id
    FROM employees
    WHERE ROWNUM <5;
    
SELECT ROWNUM, employee_id, ROWID
    FROM employees
WHERE ROWNUM <5;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--연산자

SELECT employee_id || '-' || emp_name AS employee_info
    FROM employees
WHERE ROWNUM <5;

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--표현식

SELECT employee_id, salary,
    CASE WHEN salary <= 5000 THEN 'C등급'
         WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
         ELSE 'A등급'
    END AS salary_grade
FROM employees;

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--조건식
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
    
INSERT INTO ex3_5 VALUES ('홍길동');

INSERT INTO ex3_5 VALUES ('홍길용');

INSERT INTO ex3_5 VALUES ('홍길상');

INSERT INTO ex3_5 VALUES ('홍길상동');

SELECT *
    FROM ex3_5
WHERE names LIKE '홍길%';

SELECT *
FROM ex3_5
WHERE names LIKE '홍길_';

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 --3장 문제

-- 예제 1
-- 테이블 생성후 사원테이블에서 관리자 사번이 124, 급여가 2000에서 3000사이에 있는 사원의 사번, 사원명, 급여, 관리자사번 입력하는 INSERT문 작성

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

-- 예제2
-- 관리자사번이 145번인 사원을 찾아 위 테이블에 있는 사원의 사번과 일치하면
-- 보너스 금액에 자신의 급여의 1%를 보너스로 갱신하고
-- ex3_3 테이블에 있는 사원의 사번과 일치하지 않는 사원을 신규입력 (보너스 금액은 급여의 0.5%) 하는 MERGE문 작성

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

-- 예제 3
-- 사원테이블에서 커미션 값이 없는 사원의 사번과 사원명을 추출
SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL;

-- 예제 4
-- 아래 쿼리를 논리 연산자로 변환

/*SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;
를 논리연산자로 변환하기*/


SELECT employee_id, salary
FROM employees
WHERE salary >= 2000 AND salary <= 2500
ORDER BY employee_id;

-- 예제 5

-- 두 쿼리를 ANY,ALL을 사용해서 동일한 결과를 추출하게 변경

-- 1 쿼리
SELECT employee_id, salary
FROM employees
WHERE salary IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000,3000,4000)
ORDER BY employee_id;

-- 2 쿼리
SELECT employee_id, salary
FROM employees
WHERE salary NOT IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary <>ALL (2000,3000,4000)
ORDER BY employee_id;

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--숫자함수

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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--문자함수
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good가bye')
    FROM DUAL;
    
SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never ay goodbye')
    FROM DUAL;
    
SELECT CONCAT('I Have', 'A Dream'), 'I Have' || ' A Dream'
    FROM DUAL;
    
SELECT SUBSTR('ABCDEFG',1,4), SUBSTR('ABCDEFG',-1,4)
    FROM DUAL;
    
SELECT SUBSTRB('ABCDEFG',1,4) , SUBSTRB('가나다라마바사',1,4)
    FROM DUAL;

SELECT LTRIM('ABCDEFGABC','ABC'),
       LTRIM('가나다라','가'),
       RTRIM('ABCDEFGABC','ABC'),
       RTRIM('가나다라','라')
    FROM DUAL;

SELECT LTRIM('가나다라','나'), RTRIM('가나다라','나')
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
    
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너')
    FROM DUAL;
    
SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ',' ','')
    FROM DUAL;
    
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS rep,
       TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS trn
    FROM DUAL;
    
SELECT employee_id,
       TRANSLATE(EMP_NAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','thehillsarealivewiththesou')
       AS TRANS_NAME
    FROM employees;
    
SELECT INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면 내가 만약 즐거울 때면', '만약') AS INSTR1,
       INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5) AS INSTR2,
       INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5, 2)AS INSTR3
    FROM DUAL;
    
SELECT LENGTH('대한민국'),
       LENGTHB('대한민국')
    FROM DUAL;
    
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--날짜함수
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
    
SELECT NEXT_DAY(SYSDATE, '금요일')
    FROM DUAL;

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--변환함수
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
    
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--NULL 관련 함수
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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--기타함수
SELECT GREATEST(1,2,3,2),
       LEAST(1,2,3,2)
    FROM DUAL;
    
SELECT GREATEST('이순신','강감찬','세종대왕'),
       LEAST('이순신','강감찬','세종대왕')
FROM DUAL;

SELECT prod_id,
       DECODE(channel_id, 3, 'Direct',
                          9, 'Direct',
                          5, 'Indirect',
                          4, 'Indirect',
                             'Others') decodes
    FROM sales
WHERE rownum<10;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--4장문제
-- 1
SELECT LPAD(SUBSTR(phone_number,5), 12, '(02)')
FROM employees;

-- 2

SELECT employee_id 사원번호, emp_name 사원명, HIRE_DATE 입사일자, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) 근속년수
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

SELECT SUBSTR(TO_NUMBER(TO_CHAR(SYSDATE, 'yyyymmdd')),1,4)  - cust_year_of_birth 나이
FROM CUSTOMERS;

SELECT DECODE(SUBSTR(SUBSTR(TO_NUMBER(TO_CHAR(SYSDATE, 'yyyymmdd')),1,4)  - cust_year_of_birth,1,1),
                    3,'30대',
                    4,'40대',
                    5,'50대',
                    '기타') 연령
FROM CUSTOMERS;

-- 6 

SELECT 나이,
CASE WHEN 나이 BETWEEN 20 AND 29 THEN '20대'
        WHEN 나이 BETWEEN 30 AND 39 THEN '30대'
        WHEN 나이 BETWEEN 40 AND 49 THEN '40대'
        WHEN 나이 BETWEEN 50 AND 59 THEN '50대'
        WHEN 나이 BETWEEN 60 AND 69 THEN '60대'
        WHEN 나이 BETWEEN 70 AND 79 THEN '70대'
        WHEN 나이 BETWEEN 80 AND 89 THEN '80대'
        WHEN 나이 BETWEEN 90 AND 99 THEN '90대'
END AS 연령대
FROM (SELECT TRUNC(TO_CHAR(SYSDATE,'YYYY') - cust_year_of_birth) AS 나이 FROM CUSTOMERS);

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--기본집계함수
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
    
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--GROUP BY절과 HAVING 절
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
    
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--ROLLUP절과 CUBE 절
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

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--집합연산자
CREATE TABLE exp_goods_asia(
country VARCHAR2(10),
seq NUMBER,
goods VARCHAR2(80)
);

INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7, '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8, '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9, '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10, '철 또는 비합금강');


INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    ORDER BY seq;

SELECT goods
    FROM exp_goods_asia
    WHERE country = '일본'
    ORDER BY seq;
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country = '일본';
    
SELECT goods
     FROM exp_goods_asia
     WHERE country = '한국'
     UNION ALL
     SELECT goods
     FROM exp_goods_asia
     WHERE country = '일본';
     
SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    INTERSECT
    SELECT goods
    FROM exp_goods_asia
    WHERE country = '일본';

SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    MINUS
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='일본';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '일본'
    MINUSㅁ
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='한국';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    UNION
    SELECT seq,goods
    FROM exp_goods_asia
    WHERE country ='일본';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='일본';
    
SELECT seq,goods
    FROM exp_goods_asia
    WHERE country = '한국'
    UNION
    SELECT seq,goods
    FROM exp_goods_asia
    WHERE country ='일본';
    
SELECT seq
    FROM exp_goods_asia
    WHERE country = '한국'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='일본';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    ORDER BY goods
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='일본';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '한국'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='일본'
    ORDER BY goods;
    
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, (gubun,region));

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--5장 문제
-- 1. 사원테이블에서 입사년도별 사원수를 구하는 쿼리

SELECT TO_CHAR(hire_date,'YYYY') 년도, COUNT(*) 인원수
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY');

-- 2  kor_loan_status 테이블에서 2012년도 월별, 지역별 대출 총 잔액을 구하는 쿼리 작성

SELECT period, region, SUM(loan_jan_amt) 전채부채
FROM kor_loan_status
WHERE period LIKE  '2012%'
GROUP BY ROLLUP(period, region);

-- 3 다음의 쿼리는 분할 ROLLUP

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);
-- ROLLUP을 사용하지 않고 집합 연산자로 동일한 결과가 나오도록 쿼리 작성하기


SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, gubun
UNION
SELECT period, null, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, null;

-- 4 다음 쿼리를 실행해서 결과를 확인하고 집합 연산자로 동일한 결과를 추출하도록 쿼리 작성

SELECT period,
CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) ELSE 0 END 주택담보대출액,
CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) ELSE 0 END 기타대출액
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

SELECT period, SUM(loan_jan_amt) 주택담보대출액, 0 기타대출액
FROM kor_loan_status
WHERE period Like '201311' AND gubun = '주택담보대출'
GROUP BY period
UNION
SELECT period, 0, SUM(loan_jan_amt)  기타대출액
FROM kor_loan_status
WHERE period Like '201311' AND gubun = '기타대출'
GROUP BY period;

--5 다음과 같은 형태, 즉 지역과 각 월별 대출 총 잔액을 구하는 쿼리를 작성해보자
SELECT 지역,
    SUM(AMT1) AS "201111",
    SUM(AMT2) AS "201112",
    SUM(AMT3) AS "201210",
    SUM(AMT4) AS "201211",
    SUM(AMT5) AS "201312",
    SUM(AMT6) AS "201310",
    SUM(AMT7) AS "201311"

FROM (SELECT region 지역,
                        CASE WHEN period = '201111' THEN LOAN_JAN_AMT ELSE 0 END AMT1,
                        CASE WHEN period = '201112' THEN LOAN_JAN_AMT ELSE 0 END AMT2,
                        CASE WHEN period = '201210' THEN LOAN_JAN_AMT ELSE 0 END AMT3,
                        CASE WHEN period = '201211' THEN LOAN_JAN_AMT ELSE 0 END AMT4,
                        CASE WHEN period = '201312' THEN LOAN_JAN_AMT ELSE 0 END AMT5,
                        CASE WHEN period = '201310' THEN LOAN_JAN_AMT ELSE 0 END AMT6,
                        CASE WHEN period = '201311' THEN LOAN_JAN_AMT ELSE 0 END AMT7
            FROM KOR_LOAN_STATUS
                        )
GROUP BY 지역
ORDER BY 지역;
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
--시험 06/01

--1번    
select replace(lpad(substr(phone_number, 4, 12),14,'(031)'),'.','-') 
from employees;

--2번
SELECT employee_id 사원번호, emp_name 사원명, HIRE_DATE 입사일자, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) 근속년수
FROM employees
WHERE  ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)>= 22
ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12);

--3번  
select cust_name, TRANSLATE(cust_main_phone_number, '0123456789', 'abcdefghij'), cust_main_phone_number
from customers;

--4번
CREATE TABLE exam3(
name VARCHAR(100),
new_Phone_number VARCHAR(25)
);

--5번
INSERT INTO exam3 ( name, new_phone_number)
SELECT cust_name ,TRANSLATE(cust_main_phone_number,  '0123456789', 'ABCDEFGHIJ')
FROM CUSTOMERS;

--6번
select translate(new_phone_number,'abcdefghij','0123456789') from exam3;

--7번
select cust_name,
case substr(cust_year_of_birth,1,3) when '195' then '1950년대' 
 when '196' then '1960년대' 
 when '197' then '1970년대' 
 when '198' then '1980년대' 
 when '199' then '1990년대'
 else '기타'
end
from customers;

--8번
select to_char(hire_date,'mm'), count(*)
from employees
group by to_char(hire_date,'mm')
order by 1;

--9번
SELECT region 지역별, SUM(loan_jan_amt) 전채부채
FROM kor_loan_status
WHERE period LIKE  '2011%'
GROUP BY ROLLUP(region);

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


