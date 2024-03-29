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

INSERT INTO ex2_2  (column3) VALUES('�垮瘚�');
       
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
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--檣策蝶(p.75)

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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--衛喻椒(p.80)

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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--衛蘚蝶(p.83)

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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--90p 僥薯ヴ檜

-- 蕨薯 1
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

-- 蕨薯 2
CREATE TABLE ORDER_ITEMS(
    ORDER_ID NUMBER(12,0),
    LINE_ITEM_ID NUMBER(3,0),
    PRODUCT_ID NUMBER(3,0),
    UNIT_PRICE NUMBER(8,2) DEFAULT 0,
    QUANTITY NUMBER(8,0) DEFAULT 0,
    CONSTRAINT CHECK_ID PRIMARY KEY(ORDER_ID,LINE_ITEM_ID)
);

-- 蕨薯 3
CREATE TABLE PROMOTIONS(
    PROMO_ID NUMBER(6,0) PRIMARY KEY,
    PROMO_NAME VARCHAR2(20)
);

-- 蕨薯 5
CREATE SEQUENCE ORDERS_SEQ
    INCREMENT BY 1
    START WITH 1000
    MINVALUE 1
    MAXVALUE 9999999
    NOCACHE
    NOCYCLE ;
    
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--SELECT 僥(p.92)
SELECT EMPLOYEE_ID, EMP_NAME
FROM EMPLOYEES
WHERE SALARY > 5000

-- JOB_ID 陛 IT_PROG AND 褻勒 蹺陛
-- AND JOB_ID = 'IT_PROG'

-- JOB_ID 陛 IT_PROG OR 褻勒 蹺陛
OR  JOB_ID = 'IT_PROG'
ORDER BY EMPLOYEE_ID;  -- 餌廓戲煎 薑溺п憮 爾晦

-- и 偃 檜鼻曖 纔檜綰縑憮 等檜攪蒂 褻�裔炱�

SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.DEPARTMENT_ID,
    B.DEPARTMENT_NAME AS DEP_NAME

FROM EMPLOYEES A,
    DEPARTMENTS B

WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--INSERT 僥

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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--UPDATE僥
SELECT *
    FROM ex3_1;
    
UPDATE ex3_1
SET col2 = 50;

SELECT *
     from ex3_1;
     
UPDATE ex3_1
    SET col3 = SYSDATE
    WHERE col3 IS NULL;
    
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--MEGA僥
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
 
 
 -- EX3_3 纔檜綰 儅撩
CREATE TABLE EX3_3(
    employee_id NUMBER,
    bonus_amt NUMBER DEFAULT 0);
 
 -- 褻��   
SELECT *
FROM EX3_3;

-- SALES 纔檜綰縑憮 2000喇 10錯 ~ 200喇 12錯梱雖 衙轎擊 殖撩и 餌錳廓�� 殮溘

INSERT INTO EX3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
-- 餌錳廓��曖 醞犒擊 薯剪л
GROUP BY e.employee_id;

-- 褻��
SELECT *
FROM EX3_3
ORDER BY employee_id;

-- 婦葬濠 餌廓檜 ex3_3 纔檜綰縑 氈朝 餌錳曖 餌廓婁 橾纂ж賊 1% 爾傘蝶
-- 橾纂 ж雖 彊戲賊 晝罹曖 0.1% 爾傘蝶 雖晝 (晝罹陛 8000 嘐虜檣 餌錳虜 п渡)

-- 餌廓 , 婦葬濠 餌廓, 晝罹, 晝罹 * 0.01 褻��
SELECT employee_id, manager_id, salary,salary * 0.01
FROM employees
WHERE employee_id IN (SELECT employee_id FROM EX3_3);

-- 餌錳纔檜綰縑憮 婦葬濠 餌廓檜 146 檣 匙 醞 ex3_3 纔檜綰縑 橈朝 餌錳曖 餌廓, 婦葬濠 餌廓, 晝罹, 晝罹*0.001 褻��
SELECT employee_id , manager_id, salary, salary * 0.001
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM ex3_3)
AND manager_id = 146;

-- 煽мж晦
MERGE INTO ex3_3 d -- ex3_3 纔檜綰擊 d 煎 薑曖
USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b -- 婦葬濠 餌廓檜 146
            ON (d.employee_id = b.employee_id) -- d , b 褻勒檜 偽擊 陽 機等檜お
WHEN MATCHED THEN -- 褻勒檜 蜃棻賊
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01 -- 1% 爾傘蝶 雖晝
WHEN NOT MATCHED THEN -- 褻勒檜 ぎ葬棻賊
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.001) -- 0.1 爾傘蝶 雖晝
    WHERE (b.salary < 8000); -- 晝罹陛 8000 嘐虜

-- 褻��
SELECT *
    FROM ex3_3
    ORDER BY employee_id;
    
MERGE INTO ex3_3 d -- ex3_3 纔檜綰擊 d 煎 薑曖
USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b -- 婦葬濠 餌廓檜 146
            ON (d.employee_id = b.employee_id) -- d , b 褻勒檜 偽擊 陽 機等檜お
WHEN MATCHED THEN -- 褻勒檜 蜃棻賊
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01 -- 1% 爾傘蝶 雖晝
    DELETE WHERE (B.employee_id = 161) -- 褻勒縑 蜃朝 161 餌錳 餉薯
WHEN NOT MATCHED THEN -- 褻勒檜 ぎ葬棻賊
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * 0.001) -- 0.1 爾傘蝶 雖晝
    WHERE (b.salary < 8000); -- 晝罹陛 8000 嘐虜

-- 褻��
SELECT *
    FROM ex3_3
    ORDER BY employee_id;
    
    
 天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
 --DELETE僥
 DELETE ex3_3;
 
 SELECT *
    FROM EX3_3
ORDER BY employee_id;

SELECT partition_name
    FROM user_tab_partitions
WHERE table_name = 'SALES';
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--COMMIT , ROLLBACK , TRUNCATE

CREATE TABLE ex3_4(
    employee_id NUMBER);

INSERT INTO ex3_4 VALUES(100);

SELECT *
FROM ex3_4;
 
COMMIT;

TRUNCATE TABLE ex3_4;
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--曖餌鏽歲
SELECT ROWNUM, employee_id
    FROM employees;
    
SELECT ROWNUM, employee_id
    FROM employees
    WHERE ROWNUM <5;
    
SELECT ROWNUM, employee_id, ROWID
    FROM employees
WHERE ROWNUM <5;
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--翱骯濠

SELECT employee_id || '-' || emp_name AS employee_info
    FROM employees
WHERE ROWNUM <5;

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--ル⑷衝

SELECT employee_id, salary,
    CASE WHEN salary <= 5000 THEN 'C蛔晝'
         WHEN salary > 5000 AND salary <= 15000 THEN 'B蛔晝'
         ELSE 'A蛔晝'
    END AS salary_grade
FROM employees;

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--褻勒衝
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
    
INSERT INTO ex3_5 VALUES ('�垮瘚�');

INSERT INTO ex3_5 VALUES ('�垮瞈�');

INSERT INTO ex3_5 VALUES ('�垮皛�');

INSERT INTO ex3_5 VALUES ('�垮皛騕�');

SELECT *
    FROM ex3_5
WHERE names LIKE '�垮�%';

SELECT *
FROM ex3_5
WHERE names LIKE '�垮潷';

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
 --3濰 僥薯

-- 蕨薯 1
-- 纔檜綰 儅撩�� 餌錳纔檜綰縑憮 婦葬濠 餌廓檜 124, 晝罹陛 2000縑憮 3000餌檜縑 氈朝 餌錳曖 餌廓, 餌錳貲, 晝罹, 婦葬濠餌廓 殮溘ж朝 INSERT僥 濛撩

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

-- 蕨薯2
-- 婦葬濠餌廓檜 145廓檣 餌錳擊 瓊嬴 嬪 纔檜綰縑 氈朝 餌錳曖 餌廓婁 橾纂ж賊
-- 爾傘蝶 旎擋縑 濠褐曖 晝罹曖 1%蒂 爾傘蝶煎 偵褐ж堅
-- ex3_3 纔檜綰縑 氈朝 餌錳曖 餌廓婁 橾纂ж雖 彊朝 餌錳擊 褐敘殮溘 (爾傘蝶 旎擋擎 晝罹曖 0.5%) ж朝 MERGE僥 濛撩

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

-- 蕨薯 3
-- 餌錳纔檜綰縑憮 醴嘐暮 高檜 橈朝 餌錳曖 餌廓婁 餌錳貲擊 蹺轎
SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL;

-- 蕨薯 4
-- 嬴楚 蘭葬蒂 喱葬 翱骯濠煎 滲��

/*SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;
蒂 喱葬翱骯濠煎 滲�納炱�*/


SELECT employee_id, salary
FROM employees
WHERE salary >= 2000 AND salary <= 2500
ORDER BY employee_id;

-- 蕨薯 5

-- 舒 蘭葬蒂 ANY,ALL擊 餌辨п憮 翕橾и 唸婁蒂 蹺轎ж啪 滲唳

-- 1 蘭葬
SELECT employee_id, salary
FROM employees
WHERE salary IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000,3000,4000)
ORDER BY employee_id;

-- 2 蘭葬
SELECT employee_id, salary
FROM employees
WHERE salary NOT IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary <>ALL (2000,3000,4000)
ORDER BY employee_id;

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--璋濠л熱

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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--僥濠л熱
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good陛bye')
    FROM DUAL;
    
SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never ay goodbye')
    FROM DUAL;
    
SELECT CONCAT('I Have', 'A Dream'), 'I Have' || ' A Dream'
    FROM DUAL;
    
SELECT SUBSTR('ABCDEFG',1,4), SUBSTR('ABCDEFG',-1,4)
    FROM DUAL;
    
SELECT SUBSTRB('ABCDEFG',1,4) , SUBSTRB('陛釭棻塭葆夥餌',1,4)
    FROM DUAL;

SELECT LTRIM('ABCDEFGABC','ABC'),
       LTRIM('陛釭棻塭','陛'),
       RTRIM('ABCDEFGABC','ABC'),
       RTRIM('陛釭棻塭','塭')
    FROM DUAL;

SELECT LTRIM('陛釭棻塭','釭'), RTRIM('陛釭棻塭','釭')
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
    
SELECT REPLACE('釭朝 傘蒂 賅腦朝等 傘朝 釭蒂 憲啊朝陛?', '釭', '傘')
    FROM DUAL;
    
SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ',' ','')
    FROM DUAL;
    
SELECT REPLACE('釭朝 傘蒂 賅腦朝等 傘朝 釭蒂 憲啊朝陛?', '釭朝', '傘蒂') AS rep,
       TRANSLATE('釭朝 傘蒂 賅腦朝等 傘朝 釭蒂 憲啊朝陛?', '釭朝', '傘蒂') AS trn
    FROM DUAL;
    
SELECT employee_id,
       TRANSLATE(EMP_NAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','thehillsarealivewiththesou')
       AS TRANS_NAME
    FROM employees;
    
SELECT INSTR('頂陛 虜擒 諼煎選 陽賊, 頂陛 虜擒 惚煎選 陽賊 頂陛 虜擒 闌剪選 陽賊', '虜擒') AS INSTR1,
       INSTR('頂陛 虜擒 諼煎選 陽賊, 頂陛 虜擒 惚煎選 陽賊, 頂陛 虜擒 闌剪選 陽賊', '虜擒', 5) AS INSTR2,
       INSTR('頂陛 虜擒 諼煎選 陽賊, 頂陛 虜擒 惚煎選 陽賊, 頂陛 虜擒 闌剪選 陽賊', '虜擒', 5, 2)AS INSTR3
    FROM DUAL;
    
SELECT LENGTH('渠и團措'),
       LENGTHB('渠и團措')
    FROM DUAL;
    
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--陳瞼л熱
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
    
SELECT NEXT_DAY(SYSDATE, '旎蹂橾')
    FROM DUAL;

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--滲�納埮�
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
    
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--NULL 婦溼 л熱
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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--晦顫л熱
SELECT GREATEST(1,2,3,2),
       LEAST(1,2,3,2)
    FROM DUAL;
    
SELECT GREATEST('檜牖褐','鬼馬雙','撮謙渠諾'),
       LEAST('檜牖褐','鬼馬雙','撮謙渠諾')
FROM DUAL;

SELECT prod_id,
       DECODE(channel_id, 3, 'Direct',
                          9, 'Direct',
                          5, 'Indirect',
                          4, 'Indirect',
                             'Others') decodes
    FROM sales
WHERE rownum<10;
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--4濰僥薯
-- 1
SELECT LPAD(SUBSTR(phone_number,5), 12, '(02)')
FROM employees;

-- 2

SELECT employee_id 餌錳廓��, emp_name 餌錳貲, HIRE_DATE 殮餌橾濠, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) 斬樓喇熱
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

SELECT SUBSTR(TO_NUMBER(TO_CHAR(SYSDATE, 'yyyymmdd')),1,4)  - cust_year_of_birth 釭檜
FROM CUSTOMERS;

SELECT DECODE(SUBSTR(SUBSTR(TO_NUMBER(TO_CHAR(SYSDATE, 'yyyymmdd')),1,4)  - cust_year_of_birth,1,1),
                    3,'30渠',
                    4,'40渠',
                    5,'50渠',
                    '晦顫') 翱滄
FROM CUSTOMERS;

-- 6 

SELECT 釭檜,
CASE WHEN 釭檜 BETWEEN 20 AND 29 THEN '20渠'
        WHEN 釭檜 BETWEEN 30 AND 39 THEN '30渠'
        WHEN 釭檜 BETWEEN 40 AND 49 THEN '40渠'
        WHEN 釭檜 BETWEEN 50 AND 59 THEN '50渠'
        WHEN 釭檜 BETWEEN 60 AND 69 THEN '60渠'
        WHEN 釭檜 BETWEEN 70 AND 79 THEN '70渠'
        WHEN 釭檜 BETWEEN 80 AND 89 THEN '80渠'
        WHEN 釭檜 BETWEEN 90 AND 99 THEN '90渠'
END AS 翱滄渠
FROM (SELECT TRUNC(TO_CHAR(SYSDATE,'YYYY') - cust_year_of_birth) AS 釭檜 FROM CUSTOMERS);

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--晦獄餵啗л熱
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
    
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--GROUP BY瞰婁 HAVING 瞰
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
    
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--ROLLUP瞰婁 CUBE 瞰
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

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--餵м翱骯濠
CREATE TABLE exp_goods_asia(
country VARCHAR2(10),
seq NUMBER,
goods VARCHAR2(80)
);

INSERT INTO exp_goods_asia VALUES ('и措', 1, '錳嶸薯諼 戮嶸盟');
INSERT INTO exp_goods_asia VALUES ('и措', 2, '濠翕離');
INSERT INTO exp_goods_asia VALUES ('и措', 3, '瞪濠餵瞳�虞�');
INSERT INTO exp_goods_asia VALUES ('и措', 4, '摹夢');
INSERT INTO exp_goods_asia VALUES ('и措', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('и措', 6, '濠翕離睡ヶ');
INSERT INTO exp_goods_asia VALUES ('и措', 7, '�瑒蹀���');
INSERT INTO exp_goods_asia VALUES ('и措', 8, '�紗霰瘓乘鶻�');
INSERT INTO exp_goods_asia VALUES ('и措', 9, '鼠摹歎褐晦 蛤蝶Ы溯檜 睡樓ヶ');
INSERT INTO exp_goods_asia VALUES ('и措', 10, '繹 傳朝 綠м旎鬼');


INSERT INTO exp_goods_asia VALUES ('橾獄', 1, '濠翕離');
INSERT INTO exp_goods_asia VALUES ('橾獄', 2, '濠翕離睡ヶ');
INSERT INTO exp_goods_asia VALUES ('橾獄', 3, '瞪濠餵瞳�虞�');
INSERT INTO exp_goods_asia VALUES ('橾獄', 4, '摹夢');
INSERT INTO exp_goods_asia VALUES ('橾獄', 5, '奩紫羹錚檜ぷ');
INSERT INTO exp_goods_asia VALUES ('橾獄', 6, '�食兜�');
INSERT INTO exp_goods_asia VALUES ('橾獄', 7, '錳嶸薯諼 戮嶸盟');
INSERT INTO exp_goods_asia VALUES ('橾獄', 8, '勒撲晦啗');
INSERT INTO exp_goods_asia VALUES ('橾獄', 9, '棻檜螃萄, お楠雖蝶攪');
INSERT INTO exp_goods_asia VALUES ('橾獄', 10, '晦啗盟');

SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    ORDER BY seq;

SELECT goods
    FROM exp_goods_asia
    WHERE country = '橾獄'
    ORDER BY seq;
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country = '橾獄';
    
SELECT goods
     FROM exp_goods_asia
     WHERE country = 'и措'
     UNION ALL
     SELECT goods
     FROM exp_goods_asia
     WHERE country = '橾獄';
     
SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    INTERSECT
    SELECT goods
    FROM exp_goods_asia
    WHERE country = '橾獄';

SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    MINUS
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='橾獄';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = '橾獄'
    MINUS仃
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='и措';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    UNION
    SELECT seq,goods
    FROM exp_goods_asia
    WHERE country ='橾獄';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='橾獄';
    
SELECT seq,goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    UNION
    SELECT seq,goods
    FROM exp_goods_asia
    WHERE country ='橾獄';
    
SELECT seq
    FROM exp_goods_asia
    WHERE country = 'и措'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='橾獄';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    ORDER BY goods
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='橾獄';
    
SELECT goods
    FROM exp_goods_asia
    WHERE country = 'и措'
    UNION
    SELECT goods
    FROM exp_goods_asia
    WHERE country ='橾獄'
    ORDER BY goods;
    
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, (gubun,region));

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--5濰 僥薯
-- 1. 餌錳纔檜綰縑憮 殮餌喇紫滌 餌錳熱蒂 掘ж朝 蘭葬

SELECT TO_CHAR(hire_date,'YYYY') 喇紫, COUNT(*) 檣錳熱
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY');

-- 2  kor_loan_status 纔檜綰縑憮 2012喇紫 錯滌, 雖羲滌 渠轎 識 濤擋擊 掘ж朝 蘭葬 濛撩

SELECT period, region, SUM(loan_jan_amt) 瞪瓣睡瓣
FROM kor_loan_status
WHERE period LIKE  '2012%'
GROUP BY ROLLUP(period, region);

-- 3 棻擠曖 蘭葬朝 碟й ROLLUP

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);
-- ROLLUP擊 餌辨ж雖 彊堅 餵м 翱骯濠煎 翕橾и 唸婁陛 釭螃紫煙 蘭葬 濛撩ж晦


SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, gubun
UNION
SELECT period, null, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, null;

-- 4 棻擠 蘭葬蒂 褒чп憮 唸婁蒂 �挫恉炾� 餵м 翱骯濠煎 翕橾и 唸婁蒂 蹺轎ж紫煙 蘭葬 濛撩

SELECT period,
CASE WHEN gubun = '輿鷗氬爾渠轎' THEN SUM(loan_jan_amt) ELSE 0 END 輿鷗氬爾渠轎擋,
CASE WHEN gubun = '晦顫渠轎' THEN SUM(loan_jan_amt) ELSE 0 END 晦顫渠轎擋
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

SELECT period, SUM(loan_jan_amt) 輿鷗氬爾渠轎擋, 0 晦顫渠轎擋
FROM kor_loan_status
WHERE period Like '201311' AND gubun = '輿鷗氬爾渠轎'
GROUP BY period
UNION
SELECT period, 0, SUM(loan_jan_amt)  晦顫渠轎擋
FROM kor_loan_status
WHERE period Like '201311' AND gubun = '晦顫渠轎'
GROUP BY period;

--5 棻擠婁 偽擎 ⑽鷓, 闊 雖羲婁 陝 錯滌 渠轎 識 濤擋擊 掘ж朝 蘭葬蒂 濛撩п爾濠
SELECT 雖羲,
    SUM(AMT1) AS "201111",
    SUM(AMT2) AS "201112",
    SUM(AMT3) AS "201210",
    SUM(AMT4) AS "201211",
    SUM(AMT5) AS "201312",
    SUM(AMT6) AS "201310",
    SUM(AMT7) AS "201311"

FROM (SELECT region 雖羲,
                        CASE WHEN period = '201111' THEN LOAN_JAN_AMT ELSE 0 END AMT1,
                        CASE WHEN period = '201112' THEN LOAN_JAN_AMT ELSE 0 END AMT2,
                        CASE WHEN period = '201210' THEN LOAN_JAN_AMT ELSE 0 END AMT3,
                        CASE WHEN period = '201211' THEN LOAN_JAN_AMT ELSE 0 END AMT4,
                        CASE WHEN period = '201312' THEN LOAN_JAN_AMT ELSE 0 END AMT5,
                        CASE WHEN period = '201310' THEN LOAN_JAN_AMT ELSE 0 END AMT6,
                        CASE WHEN period = '201311' THEN LOAN_JAN_AMT ELSE 0 END AMT7
            FROM KOR_LOAN_STATUS
                        )
GROUP BY 雖羲
ORDER BY 雖羲;
天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天
--衛я 06/01

--1廓    
select replace(lpad(substr(phone_number, 4, 12),14,'(031)'),'.','-') 
from employees;

--2廓
SELECT employee_id 餌錳廓��, emp_name 餌錳貲, HIRE_DATE 殮餌橾濠, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) 斬樓喇熱
FROM employees
WHERE  ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)>= 22
ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12);

--3廓  
select cust_name, TRANSLATE(cust_main_phone_number, '0123456789', 'abcdefghij'), cust_main_phone_number
from customers;

--4廓
CREATE TABLE exam3(
name VARCHAR(100),
new_Phone_number VARCHAR(25)
);

--5廓
INSERT INTO exam3 ( name, new_phone_number)
SELECT cust_name ,TRANSLATE(cust_main_phone_number,  '0123456789', 'ABCDEFGHIJ')
FROM CUSTOMERS;

--6廓
select translate(new_phone_number,'abcdefghij','0123456789') from exam3;

--7廓
select cust_name,
case substr(cust_year_of_birth,1,3) when '195' then '1950喇渠' 
 when '196' then '1960喇渠' 
 when '197' then '1970喇渠' 
 when '198' then '1980喇渠' 
 when '199' then '1990喇渠'
 else '晦顫'
end
from customers;

--8廓
select to_char(hire_date,'mm'), count(*)
from employees
group by to_char(hire_date,'mm')
order by 1;

--9廓
SELECT region 雖羲滌, SUM(loan_jan_amt) 瞪瓣睡瓣
FROM kor_loan_status
WHERE period LIKE  '2011%'
GROUP BY ROLLUP(region);

天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天天


