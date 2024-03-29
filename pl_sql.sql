--6/7일 PL/SQL 수업
--익명 블럭 
-- := 할당 연산자
--SET SERVEROUTPUT ON  --실행 
--SET TIMING ON   --실행 시간 보기
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num  :=  100;
--  출력기능 함수
    DBMS_OUTPUT.put_line(vi_num);
end;
/

--우선순위 연산자 ** 사용 
DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a= ' || TO_CHAR(a));
END;
/    
    
-- PL주석 
/*이러한주석 부분도 사용가능*/

--DML문 사용 
--SELECT 문에 INTO를 사용하여 할당된 변수를 삽입.
--employees.emp_name%TYPE; 사용시 변수타입을 선언하지 않아도됨,
-- 데이터 테이블.컬럼명%TYPE;
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

--라벨 가독성 향상을 위해 사용 

--길이 차이를 확인

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
 
 DBMS_OUTPUT.PUT_LINE('SQL VARCHAR2 길이:' || ' - ' || LENGTHB(vs_sql_varchar2));
 DBMS_OUTPUT.PUT_LINE('PL/SQL VARCHAR2 길이' || ' -  ' || LENGTHB(vs_plsql_varchar2));
 END;
/ 
-- ex1 구구단3 단 풀력
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

--6/8일 PL/SQL제어문,함수
--IF문
DECLARE
vn_num1 NUMBER := 1;
vn_num2 NUMBER :=2;
BEGIN
IF vn_num1 >=  vn_num2 THEN
dbms_output.put_line(vn_num1 || '이 큰수');
ELSE
dbms_output.put_line(vn_num2 || '이 큰수');
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
    DBMS_OUTPUT.PUT_LINE('낮음');
ELSIF 
    vn_salary BETWEEN 3001 AND 6000 THEN
    DBMS_OUTPUT.PUT_LINE('중간');
ELSIF 
    vn_salary BETWEEN 6001 AND 10000 THEN
    DBMS_OUTPUT.PUT_LINE('높음');
ELSE
    DBMS_OUTPUT.PUT_LINE('최상위');
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
-- CASE 문
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
    DBMS_OUTPUT.PUT_LINE('닞음');
            WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('중간');
            WHEN vn_salary BETWEEN 6001 AND 9000 THEN
            DBMS_OUTPUT.PUT_LINE('높음');
            ELSE
            DBMS_OUTPUT.PUT_LINE('최상위');
    END CASE;
END;
/
--loop문
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
-- WHILE 문
DECLARE
 vn_base_num NUMBER := 4;
 vn_cnt NUMBER :=1;
 BEGIN
 WHILE vn_cnt <= 9
 LOOP
 DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' ||vn_cnt || '=' || vn_base_num * vn_cnt);
 EXIT WHEN vn_cnt = 5; --cnt값이 5가 되면 멈춤
 vn_cnt := vn_cnt +1;    --cnt 값1씩 증가

 END LOOP;
 END;
 /
 
-- FOR 문
-- IN REVERSE  거꾸로
DECLARE
vn_num NUMBER := 5;
BEGIN 
FOR i in 1..9
LOOP
 DBMS_OUTPUT.PUT_LINE(vn_num || '*' || i || '=' || vn_num * i);
 END LOOP;
 END;
/
--CONTINUE 문

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
--GOTO문
--제한적으로 사용. 순서를 방해
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
--NULL문
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


--6/9일 PL/SQL 
--함수 생성
--나머지 값 구하기
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

--숫자로 입력받받은 후 국가명 반환
CREATE OR REPLACE FUNCTION p_country_name(p_country_id NUMBER)   --함수이름 지정 (변수 입력 값)
RETURN VARCHAR2            --함수 반환 타입
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

SELECT p_country_name(52777) 나라1 , p_country_name(28765) 나라2
FROM DUAL;

CREATE OR REPLACE FUNCTION p_country_name(p_country_id NUMBER)   --함수이름 지정 (변수 입력 값)
RETURN VARCHAR2            --함수 반환 타입
IS
    vs_conutry_name COUNTRIES.COUNTRY_NAME%TYPE; 
    vs_cnt NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO vs_cnt
    FROM countries
    WHERE country_id = p_country_id;
    
    IF vs_cnt = 0 THEN vs_conutry_name := '해당국가 없음';
    ELSE
    SELECT country_name
    INTO vs_conutry_name
    FROM countries
    WHERE country_id = p_country_id;
END IF;

RETURN vs_conutry_name ;
END;
/
SELECT p_country_name(52777) 나라1,  p_country_name(527745) 나라2
FROM DUAL;


--사용 유저 확인
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


--프로시져
CREATE OR REPLACE PROCEDURE new_job_proc

  ( p_job_id IN jobs.job_id%TYPE,
p_job_title IN jobs.job_title%TYPE,
--디폴트 값 설정 := (디폴트값 입력)
p_min_sal IN jobs.min_salary%TYPE := 10,
p_max_sal IN jobs.max_salary%TYPE := 100) 
IS 
BEGIN 
INSERT INTO JOBS( job_id, job_title, min_salary,max_salary, create_date, update_date)
            VALUES(p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
            commit;
END;
/
-- 업데이트 갱신이 가능하도록 프로시저 수정
CREATE OR REPLACE PROCEDURE new_job_proc

  ( p_job_id IN jobs.job_id%TYPE,
p_job_title IN jobs.job_title%TYPE,
--디폴트 값 설정 := (디폴트값 입력)
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

--프로시져 호출 1
EXEC  new_job_proc('SM_JOB1', 'Sample JOB1',3000,5000);

DELETE JOBS
WHERE job_id = 'SM_JOB1';
--프로시져 호출 2
EXECUTE new_job_proc(p_job_id => 'SM_JOB1', p_job_title=>'Sample JOB1' , p_min_sal => 2000, p_max_sal =>8000);

SELECT *
FROM jobs
WHERE job_id = 'SM_JOB1';

EXEC  new_job_proc('SM_JOB1', 'Sample JOB1');

--OUT,IN,OUT 매개변수

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
-- 익명블록 사용시 프로시저를 실행 하면 EXEC,EXECUTE 사용 하지 않는다,
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
--프로시저 실행
DECLARE
v_var1 VARCHAR2(10) :='A';
v_var2 VARCHAR2(10) :='B';
v_var3 VARCHAR2 (10) :='C';
BEGIN test_proc(v_var1, v_var2, v_var3);
DBMS_OUTPUT.PUT_LINE(v_var2);
DBMS_OUTPUT.PUT_LINE(v_var3);
END;
/

CREATE OR REPLACE PROCEDURE new_job_proc
( p_job_id  IN jobs.job_id%TYPE,
p_job_title IN jobs.job_title%TYPE,
p_min_sal IN jobs.min_salary%TYPE := 10,
p_max_sal IN jobs.max_salary%TYPE :=100
)
IS
vn_cnt NUMBER := 0;
vn_cur_date jobs.update_date%TYPE := SYSDATE;


--6/10일 PL/SQL
BEGIN
IF p_min_sal < 1000 THEN
    DBMS_OUTPUT.PUT_LINE('최소급여값은 1000 입니다.');
    RETURN;
END IF;
SELECT COUNT (*)
INTO vn_cnt
FROM jobs
WHERE job_id = p_job_id;
END;
/
EXEC new_job_proc('SM_JOB1', 'Sample JOB1',999,6000)


DECLARE 
vn_emp_name VARCHAR2(80);
BEGIN
vn_emp_name := 'hong';
UPDATE employees
SET  emp_name = vn_emp_name
WHERE employee_id =100;

SELECT emp_name
INTO vn_emp_name
FROM employees
WHERE employee_id= 100;
DBMS_OUTPUT.PUT_LINE(vn_emp_name);
END;
/
--문제풀이 1번
-- 리버스 함수 최종값에서 시작해 1씩 감소하여 초기값을 이룬다. 최종값 1 초기값 9이므로
--루프를 수행 하지 않는다.

DECLARE
vn_base_num NUMBER :=3;
BEGIN
FOR i IN   1..9
LOOP
DBMS_OUTPUt.PUt_line(vn_base_num  || '* ' || i || '='|| vn_base_num *i);
END LOOP;
END;
/
--  문제 풀이 2번
CREATE OR REPLACE FUNCTION my_initcap(p_initcap VARCHAR2)
RETURN VARCHAR2
IS
vn_pos NUMBER := 1; --각 단어 시작 위치
vs_temp VARCHAR2(100) :=p_initcap;
vs_return VARCHAR2(100); --반환할 대문자로 변환된 문자열 함수
vn_len NUMBER;
BEGIN
    WHILE vn_pos <> 0 --공백 문자를 발견하지 못할 때 까지 루프를돈다
    LOOP
    --공백문자의 위치를 가져온다
    vn_pos := INSTR(vs_temp, ' ');
    IF vn_pos = 0 THEN
       vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) || SUBSTR(vs_temp, 2, vn_len -1);
    ELSE 
        vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) || SUBSTR(vs_temp, 2, vn_pos -2) || ' ';
    END IF;
    
    vn_len := LENGTH(vs_temp);
    vs_temp := SUBSTR(vs_temp, vn_pos+1, vn_len - vn_pos);
  
  END LOOP;  
  RETURN vs_return;
  END;
  
/
SELECT my_initcap('happy birthday to you') my_initcap
FROM DUAL; 
/
--문제 풀이 3번
CREATE OR REPLACE FUNCTION my_last_day(ps_input_day VARCHAR2)
RETURN VARCHAR2
IS 
vs_input_date VARCHAR2(10) := ps_input_day ;
vs_return_date VARCHAR(50);
vs_temp_year   VARCHAR2(4);
vs_temp_month VARCHAR2(2);

BEGIN
--입력일자에서 '-'를 제거
    vs_input_date := replace(vs_input_date,'-','')

--입력일자에서 '-'을 제거한 문자열 길이가 8이 아닌경우, 오류 메세지 출력
    IF LENGTH(vs_input_date) <> 8 THEN
        vs_return_date := '입력일자 오류';
    ELSE
        -- 년도를 가져옴
        vs_temp_year := SUBSTR(vs_input_date, 1, 4);
        -- 월을 가져옴
        vs_temp_month := SUBSTR(vs_input_date, 5 , 2);
        
        --월이 12월이면
        IF vs_temp_month = '12' THEN
            vs_temp_year := TO_CHAR(TO_NUMBER(vs_temp_year) + 1);
            vs_temp_month := '01';
        ELSE
            vs_temp_month := TRIM(TO_CHAR(TO_NUMBER(vs_temp_month) + 1, '00'));
            END IF;
    
            --해당 월에 따라서 날짜가 다름
            --년도 + 다음월1일 - 1일 해당월 마지막 일자가 나옴
            vs_return_date := TO_CHAR(TO_DATE(vs_temp_year || vs_temp_month || '01','YYYY-MM-DD') - 1, 'YYYYMMDD')
    END IF;

RETURN vs_return_date ;
COMMIT;
end;
/
SELECT my_last_day('20110101') "라스트 데이" 
FROM DUAL;
/
--문제풀이 4번

--문제풀이 5번

--문제풀이 6번
/*부서 테이블의 복사본 테이블을 다음과 같이 만들어 보자.
CREATE TABLE CH09_departments AS
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, PARENT_ID
    FROM DEPARTMENTS;

위 테이블을 대상으로 다음과 같은 처리를 하는 프로시저를 my_dept_manage_proc라는 이름으로 만들어보자
1 매개변수:부서번호, 부서명, 상위부서번호, 동작flag
2. 동작 flag 매개변수 값은'upsert'  - 데이터가 있으면 UPDATE, 아니면 INSERT
                        'delete' - 해당 부서 삭제
3.삭제시 , 만약 해당 부서에 속한 사원이 존재하는지 사원 테이블을 체크해 존재하면 경고 메세지와 함께
delete를 하지 않는다.
*/
CREATE TABLE ch_09_departments AS
SELECT department_id, department_name,parent_id
FROM departments;

select *
FROM  ch_09_departments;
/
CREATE OR REPLACE PROCEDURE my_dept_manage_proc
(p_dep_id IN  departments.department_id%TYPE,
p_dep_name IN  departments.department_name%TYPE,
p_parent_id IN  departments.parent_id%TYPE,
p_flag IN  VARCHAR2)
IS
BEGIN
IF UPPER(p_flag) ='upsert' then
    MERGE INTO ch_09_departments a
    USING(SELECT p_dep_id AS department_id from dual)bb
    ON  (a.department_id = b.dep_id)
    WHEN MATCHED THEN
    UPDATE SET a.departtment_name = p_dep_name,
                    a.parent_id = p_parnet_id
    WHEN NOT MATCHED THEN
    INSERT (a.department_id, a.departtment_name,a.parent_id)
    VALUES( b.dep_id, p_dep_name,p_parnet_id);
ELSIF UPPER(p_flag) = 'delete;' then

end;
/
EXEC my_dept_manage_proc(2800, 'IT', '기획부',90)