--Vypíšte Meno a Priezvisko zamestnancov (podľa employee_id vzostupne)
SELECT first_name "First Name", last_name "Last Name" 
FROM employees 
ORDER BY employee_id ASC 

--Vypíšte unikátne čísla oddelení z tabuľky employees (podľa department_id vzostupne)
SELECT DISTINCT department_id 
FROM employees 
ORDER BY department_id ASC   

--Vypíšte celkovú sumu potrebnú na platy
SELECT SUM(salary) AS vyplaty 
FROM employees

--Vypíšte minimálny a maximálny plat
SELECT MAX(salary) AS maximalny, MIN(salary) as minimalny 
FROM employees  

--Vypíšte primerný plat a počet platov na vyplatenie
SELECT AVG(salary) as priemer, COUNT(*) as pocet 
FROM employees   

--Vypíšte mená zamestnancov veľkými písmenami (podľa employee_id vzostupne)
SELECT UPPER(first_name) as meno 
FROM employees 
ORDER BY employee_id ASC   

--Vypíšte akronym zamestnanca (prvé 2 znaky z mena) (podľa employee_id vzostupne)
SELECT SUBSTRING(first_name,1,2) as akronym 
FROM employees 
ORDER BY employee_id ASC   

--Napíšte select na vypočítanie výsledku 171*214+625
SELECT 171*214+625 vysledok  

--Vypíšte meno a priezvisko zamestnanca v jednom stĺpci z tabuľky employees (podľa employee_id vzostupne)
SELECT CONCAT(first_name,' ', last_name) 'Employee Name' 
FROM employees 
ORDER BY employee_id ASC   

--Vypíšte meno a priezvisko zamestnanca a ich dĺžku dokopy (podľa employee_id vzostupne)
SELECT first_name,last_name, LENGTH(first_name)+LENGTH(last_name) 'Length of Names' 
FROM employees 
ORDER BY employee_id ASC

--Vypíšte meno, priezvisko a plat zamestnanca, ktorý plat nemá medzi 10 000 a 15 000 (podľa employee_id vzostupne)
SELECT first_name, last_name, salary 
FROM employees
 WHERE salary 
 NOT BETWEEN 10000 AND 15000 
 ORDER BY employee_id ASC 

--Vypíšte meno, priezvisko a id oddelenia zamestnanca, ktorý je v id oddeleni 30 alebo 100 (podľa employee_id vzostupne)
SELECT first_name, last_name, department_id 
FROM employees 
WHERE department_id 
IN (30, 100)
ORDER BY employee_id ASC 

--Vypíšte meno, priezvisko, id oddelenia a plat zamestnanca, ktorý plat nemá medzi 10 000 a 15 000 a je z oddelenia id 30 alebo 100 (podľa employee_id vzostupne)
SELECT first_name, last_name, salary, department_id 
FROM employees 
WHERE salary 
NOT BETWEEN 10000 AND 15000 AND department_id IN (30, 100) 
ORDER BY employee_id ASC   

--Vypíšte meno, priezvisko, dátum nástupu zamestnanca, ktorý nastupil v roku 1987 (podľa employee_id vzostupne)
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE YEAR(hire_date) 
LIKE '1987%' 
ORDER BY employee_id ASC   

--Vypíšte priezvisko zamestnanca, ktorý ma priezvisko dlhé presne 6 znakov (podľa employee_id vzostupne)
SELECT last_name 
FROM employees 
WHERE last_name 
LIKE '______' 
ORDER BY employee_id ASC   

--Vypíšte priezvisko zamestnanca, ktorý má v priezvisku na 3. mieste písmeno e (podľa employee_id vzostupne)
SELECT last_name 
FROM employees 
WHERE last_name 
LIKE '__e%' 
ORDER BY employee_id ASC  

--Vypíšte rozdiel medzi maximálnym a minimálnym platom
SELECT MAX(salary) - MIN(salary) DIFFERENCE 
FROM employees

--Vypíšte id manažera a plat jeho zamestnanca s najnižším platom (poznámka: keď manager_id=0 tak zamestnanec nemá manažéra) (podľa platu zostupne a pri rovnakých platoch podľa manager_id vzostupne)
SELECT manager_id, MIN(salary) as plat
FROM employees 
WHERE manager_id IS
NOT NULL GROUP BY manager_id 
ORDER BY MIN(salary) DESC, manager_id ASC   

--Vypíšte id oddelenia a súčet platov za dané oddelenie (podľa súčtu vzostupne)
SELECT department_id, SUM(salary) sucet 
FROM employees 
GROUP BY department_id 
ORDER BY sucet ASC   

--Vypíšte profesie a ich priemerny plat, okrem profesie programátor (podľa job_id vzostupne)
SELECT job_id, AVG(salary) priemer 
FROM employees 
WHERE job_id <> 'IT_PROG' 
GROUP BY job_id 
ORDER BY job_id ASC

--Vypíšte id oddelenia, priemerný plat a počet zamestnancov v oddelení, ale len pre oddelenia s viac ako 10 zamestnancami (podľa department_id vzostupne)
SELECT department_id, AVG(salary), COUNT(*) 
FROM employees 
GROUP BY department_id 
HAVING COUNT(*) > 10 
ORDER BY department_id ASC  

--Vypíšte informácie o zamestnancoch pracujúcich v meste London (podľa employee_id vzostupne)
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d ON (e.department_id = d.department_id) 
JOIN locations l ON (d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London' 
ORDER BY e.employee_id ASC   

--Vypíšte id a priezvisko zamestnanca a id a priezvisko jeho manažéra (podľa id zamestnanca vzostupne)
SELECT e.employee_id 'Emp_Id', e.last_name 'Employee', m.employee_id 'Mgr_Id', m.last_name 'Manager' 
FROM employees e 
JOIN employees m ON (e.manager_id = m.employee_id) 
ORDER BY e.employee_id ASC   

--Vypíšte meno, priezvisko a datum prijatia zamestnancov prijatých po zamestnancovi s priezviskom Jones (podľa id zamestnanca vzostupne)
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees davies ON (davies.last_name = 'Jones') WHERE davies.hire_date < e.hire_date ORDER BY e.employee_id ASC   

--Vypíšte názov oddelenia, počet zamestnancov v ňom (podľa názvu vzostupne)
SELECT department_name AS 'Department Name', COUNT(*) AS 'No of Employees' 
FROM departments INNER 
JOIN employees ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY department_name    

--Vypíšte meno, priezvisko, dátum prijatia, plat a počet dní od prijatia do zamestnania manažérov, ktorý sú v práci viac ako 500 dni (podľa id zamestnanca vzostupne)
SELECT first_name, last_name, hire_date, salary, (DATEDIFF(now(), hire_date)) Experience 
FROM departments d 
JOIN employees e ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))>500 
ORDER BY e.employee_id ASC   

--Vypíšte názov pozície, meno a rozdie medzi jeho platom a minimálnym platom pre jeho pozíciu (podľa employee_id vzostupne)
SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary' 
FROM employees 
JOIN jobs 
ORDER BY employee_id ASC   

--Vypíšte meno, priezvisko, id oddelenia a názov oddelenia v ktorom pracuje (podľa employee_id vzostupne)
SELECT first_name, last_name, department_id, department_name 
FROM employees 
JOIN departments USING (department_id) 
ORDER BY employee_id ASC   

--Vypíšte meno, priezvisko a plat zamestnancov s vyšším platom ako zamestnanec s priezviskom Bull (podľa employee_id vzostupne)
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT salary FROM employees WHERE last_name = 'Bull') 
ORDER BY employee_id ASC   

--Vypíš meno a priezvisko manažéra oddelenia, ktoré sa nachádza v Kanade
SELECT first_name, last_name 
FROM employees, departments, locations 
WHERE employees.department_id = departments.department_id 
AND departments.location_id = locations.location_id 
AND locations.country_id = "CA" LIMIT 1

--Zobraz priezviska zamestnancov 
SELECT last_name 
FROM employees

--Vypis maximalny plat.
SELECT MAX(salary) as 'max(salary)'  
FROM employees;

--Vypíšte meno, priezvisko, id oddelenia a názov oddelenia v ktorom pracuje (podľa employee_id vzostupne). 
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id

--Vypíšte meno, priezvisko a datum prijatia zamestnancov prijatých po zamestnancovi s priezviskom Jones (podľa id zamestnanca vzostupne) 
SELECT first_name, last_name, e.hire_date 
FROM employees e 
WHERE e.hire_date > (SELECT hire_date FROM employees WHERE last_name = "Jones")

--Vypis vsetky jobs id a ich nazvy
SELECT job_id, job_title 
FROM jobs;

--Z TABULKY DEPARTMENTSZ VYPIS PRE KAZDE NOT NULL ID MANAZERA 1. JEHO ID 2. JEHO FIRST NAME 3. JEHO LAST NAME 4. NAZOV NA KEROM ODDELENI ROBI NEPOUZIVAJ CONCAT BO NEFUNGUJE!!!!!! 
SELECT d.manager_id, e.first_name, e.last_name, d.department_name 
FROM employees e 
INNER JOIN departments d ON e.employee_id = d.manager_id 
WHERE d.manager_id IS NOT NULL

--Vypíš všetkých zamestnancov ktorých krstné meno začína na písmeno J
SELECT first_name, last_name 
FROM employees 
WHERE first_name LIKE 'J%'

--Vypis krstne meno zamestnanca, priezvisko zamestnanca, nazov oddelenia. Pre vsetkych zamestnancov ktorych oddelenie ma lokaciu s postal_code = 98199 
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN locations l ON l.location_id = d.location_id
WHERE l.postal_code = 98199

--Vypis zamestancov ktorim zacina meno na A 
SELECT first_name, last_name
FROM employees 
WHERE first_name LIKE 'A%';

--Vypiste pre vsetky oddelenia pocet a priemerny plat zamestnancov. Format vystupu: department_id, department_name,pocet_zamestnancov_na_oddeleni,priemerny plat(zaokruhlit na cele) 
SELECT d.department_id, d.department_name, 
    COUNT(e.employee_id) as "pocet_zamestnancov_na_oddeleni", 
	ROUND(AVG(e.salary)) as "priemerny_plat"
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id

--Vypíšte informácie o zamestnancoch pracujúcich v meste London (podľa employee_id vzostupne) 
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d on d.department_id = e.department_id
WHERE e.department_id = 40
ORDER BY employee_id ASC

--Pre kazdy job vypis jeho: id, nazov, rozdiel medzi maximom a minimom v plate
SELECT job_id, job_title, (max_salary-min_salary) AS "rozdiel_v_plate"
FROM jobs

--Pre vsetkych zamestnancov ktory maju plat vyssi ako priemerny plat vypis: meno, priezvisko, plat 
WITH x(salary) AS (select round(avg(salary)) FROM employees)
SELECT e.first_name, e.last_name, ROUND(e.salary) AS plat
FROM employees e, x
WHERE e.salary > x.salary

--Pre vsetkych zamestnancov ktory maju plat vyssi ako priemerny plat vypis: meno, priezvisko, plat 
WITH x(salary) as (SELECT round(avg(salary)) FROM employees)
SELECT e.first_name, e.last_name, round(e.salary) as plat
FROM employees e, x
WHERE e.salary > x.salary

--Zobrazte všetky informácie z tabuľky employees.
SELECT * 
FROM employees

--Pre kazdeho zamestanca ktory ma v telefonnom cisle na tretom mieste cislo 5 vypis: meno, priezvisko, telefonne cislo
SELECT first_name, last_name, phone_number
FROM employees
WHERE phone_number LIKE '__5%'

--Vypíšte mená zamestnancov ktorých plat je medzi 12000 a 16000. 
SELECT first_name, last_name 
FROM employees
WHERE salary BETWEEN 12000 AND 16000

--Vypíš všetky priezviská zamestnancov ktoré majú ako druhý znak písmeno "o". 
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_o%'

--Troska zakernejsia uloha pre nadanych SQLstubakov  Pre kazdeho manazera ktoreho plat je vacsi ako priemerny plat manazerov vypis: first_name, last_name, plat PS: ak je tam niekde chyba tak nejsom SQLstubak :sadge: PS2: vzhladom na to ze priemerny plat manazerov je skoro 12000 malo by to byt ok
SELECT e.first_name, e.last_name, ROUND(e.salary) as plat 
FROM employees e
JOIN employees m ON e.employee_id = m.manager_id 
HAVING plat > (SELECT ROUND(AVG(emp.salary)) as plat_manazera 
FROM employees emp JOIN employees man 
ON emp.employee_id = man.manager_id

--Vypíš všetky ID zamestnancov ktorí majú súčet mena a priezviska väčší ako 10. 
SELECT employee_id 
FROM employees 
WHERE (length(employees.first_name) + length(employees.last_name)) > 10

--Vypíšte meno zamestnanca veľkými písmenami ktorého ID je väčšie ako 150.
SELECT upper(e.first_name)
FROM employees e
WHERE e.employee_id > 150

--Vypíš meno a priezvisko zamestnanca ktorého job_id je "SA_REP".
SELECT first_name, last_name 
FROM employees
WHERE job_id = SA_REP

--Vypíšte meno a priezvisko zamestnanca v jednom stĺpci
SELECT concat(first_name,' ',last_name) as 'meno a priezvisko' 
FROM employees

--pre kazdy job_title napiste aj region_name s podmienkou ze sa tam realne nachadza robotnik 
SELECT DISTINCT j.job_title, r.region_name
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
WHERE e.department_id != 0

--Vypíšte stĺpce country_name a region_name. 
SELECT r.region_name, c.country_name 
FROM regions r
INNER JOIN countries c ON c.region_id = r.region_id

--Vypíš meno a priezvisko zamestnanca ak sa v jeho mene nachádza "a".
SELECT first_name, last_name 
FROM employees
WHERE first_name LIKE '%a%'

--Napíšte meno a priezvisko zamestnanca ktorého meno začína na "a" a končí na "r". 
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'a%r'

--Vypíšte slovo "FEI" z "FEI STU".
SELECT SUBSTRING('FEI STU',1,3) AS 'fei'

--Zadanie rovnake ako predosla (asi 20.) uloha pre nadanych sqlSTUBAkov s opravou a hlbokym ospravedlnenim sa (pridany distinct)
SELECT first_name, last_name, round(salary,0) AS plat 
FROM employees
WHERE salary >= 12000

--Vypis vsetky informacie o vsetkych zamestnancoch zoradenych podla id: job_id job_title min_salary max_salary employee_id first_name last_name email phone_number hire_date salary commission_pct manager_id department_id department_name location_id street_address postal_code city state_province country_id country_name region_id region_name
SELECT j.*, e.*, d.*, l.*, c.*, r.* 
FROM jobs j
INNER JOIN employees e ON e.job_id = j.job_id
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN locations l ON l.location_id = d.location_id
INNER JOIN countries c ON c.country_id = l.country_id
INNER JOIN regions r ON r.region_id = c.region_id
ORDER BY e.employee_id ASC

--Zobrazte názvy oddelení a mestá, v ktorých sú umiestnené. 
SELECT d.department_name, c.city 
FROM departments d
INNER JOIN locations c ON c.location_id = d.location_id

--Zobrazte oddelenia a ich počty zamestnancov, usporiadajte zostupne pomocou počtu.
SELECT d.department_name, count(e.employee_id) AS 'employees_amount' 
FROM departments d
INNER JOIN employees e ON e.department_id = d.department_id 
GROUP BY d.department_name
ORDER BY count(e.employee_id) DESC

--Vypíš názov mesta v ktorom pracuje zamestnanec, ktorého telefónne číslo končí na 1, zoradené podľa id zamestnanca 
SELECT city 
FROM locations l 
INNER JOIN departments d ON d.location_id = l.location_id
INNER JOIN employees e ON e.department_id = d.department_id
WHERE e.phone_number LIKE '%1'
ORDER BY e.employee_id ASC

--Vypíš počet zamestnancov, ktorí majú párne id a pracujú na oddelení Shipping
SELECT count(e.employee_id) AS 'pocet' 
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
WHERE e.department_id = 50 AND e.employee_id % 2 = 0

--Napíš rozdiel priemerov maximálneho a minimálneho možného platu z prác President a Programmer
SELECT round(((j1.max_salary + j1.min_salary) / 2) - ((j2.max_salary + j2.min_salary) / 2), 4) AS vysledok
FROM jobs j1, jobs j2
WHERE j1.job_title = 'President' AND j2.job_title = 'Programmer'