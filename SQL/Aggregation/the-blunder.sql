SELECT CEIL(AVG(SALARY) - AVG(CONVERT(REPLACE(SALARY,'0',''), UNSIGNED)))
FROM EMPLOYEES;