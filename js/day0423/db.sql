SELECT  e.deptno, d.dname, AVG(e.sal) as avg
FROM    emp e, dept d
WHERE   1 = 1
AND     e.deptno = d.deptno
GROUP BY DEPTNO
HAVING deptno != 10;

SELECT  e.deptno, d.dname, AVG(e.sal) as avg
FROM    emp e, dept d
WHERE   1 = 1
AND     e.deptno = d.deptno
GROUP BY DEPTNO
ORDER BY d.deptno;

SELECT ename, deptno
FROM    emp
GROUP BY deptno;

-- 그룹번호로 묶었는데 이름으로 그룹화 안됨.

SELECT deptno, job, round(avg(sal)) as avg
FROM    emp
GROUP BY deptno, job
order by 1, 2;

SELECT  empno   as 사원번호
       ,ename   as 사원명
       ,mgr
       ,IFNULL(mgr, "사장")     as 사수사원번호
       ,(
            SELECT  IFNULL(ename, "사장")
            FROM    emp e2
            WHERE   e2.empno = e1.mgr
        ) as 사수이름
FROM    emp e1;

SELECT  ename, sal
FROM    emp e1
WHERE   sal > (
                SELECT  AVG(SAL)
                FROM    emp e2
                WHERE   deptno = 20
                group by deptno
                )
ORDER BY 2;

SELECT  ename, sal
FROM    emp
WHERE   sal > (SELECT   SUM(comm)
               FROM     emp);

-- 1번
SELECT  ENAME, JOB, HIREDATE
FROM    emp
WHERE   JOB = (SELECT JOB FROM emp WHERE ENAME="CLARK");

-- 2번
SELECT  ENAME, HIREDATE
FROM    emp
WHERE   HIREDATE >= (SELECT HIREDATE FROM emp WHERE ENAME="WARD")
ORDER BY 2;

-- 3번
SELECT  ename, sal
FROM    emp e
WHERE   e.SAL < (select avg(sal) from emp);

-- 4번
SELECT  e.ename, e.deptno, d.dname, d.loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno
AND     d.loc = "DALLAS";

-- 5번
SELECT  empno   as 사원번호
       ,ename   as 사원명
       ,mgr     as 매니저사원번호
       ,(
            SELECT  ename, HIREDATE
            FROM    emp e2
            WHERE   e2.empno = e1.mgr
        ) as 매니저이름
       ,(
            SELECT  HIREDATE
            FROM    emp e3
            WHERE   e3.empno = e1.mgr
        ) as 매니저입사일
FROM    emp e1
WHERE   ename ="ALLEN"
;

-- 문제 6
SELECT ename as 사원명
       ,sal   as 급여
FROM   emp e
WHERE  1 = 1
AND    sal > (
              SELECT (AVG(sal) + 1000)
              FROM   emp
              WHERE  comm IS NOT NULL        
)
ORDER BY 2
;
-- 7. 급여가 두번째로 높은 사원과 같은 부서에서 근무에서 사원의 이름, 급여, 부서번호 출력
-- 8. 이름이 A로 시작하는 사원들의 급여의 합보다 높은 급여를 받는 사원의 사원명, 급여 출력
-- 9. 입사일이 세번째로 늦은 사원과 같은 부서에서 근무하는 사원들의 급여의 합
-- 10. 최대 커미션을 받는 사원의 매니저가 근무하는 부서명, 위치, 부서번호 출력
-- 11. 최대 급여에서 최소 급여를 뺀 금액보다도 더 많은 급여를 받는 사원의 이름, 급여 출력
-- 12. SALES 부서의 평균 급여보다 급여를 더 많이 받는 사원의 이름, 급여 출력