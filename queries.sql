/*
Показать работников у которых нет почты или 
почта не в корпоративном домене (домен dualbootpartners.com)
 */
SELECT
    *
FROM
    Employees
WHERE
    email IS NULL
    OR email NOT LIKE '%dualbootpartners.com';

/*
Получить список работников нанятых в последние 30 дней
 */
SELECT
    *
FROM
    Employees
WHERE
    hire_date >= CURRENT_DATE - interval '30 day';

/*
Найти максимальную и минимальную зарплату по каждому департаменту
Вариант c ID департамента
 */
SELECT
    department_id,
    MIN(salary) min_salary,
    MAX(salary) max_salary
FROM
    Employees
GROUP BY
    department_id;

/*
Найти максимальную и минимальную зарплату по каждому департаменту
Вариант c именем департамента
 */
SELECT
    d."name" AS department,
    MIN(salary) min_salary,
    MAX(salary) max_salary
FROM
    Employees e
    RIGHT JOIN Departments d ON e.department_id = d.department_id
GROUP BY
    d."name";

/*
Посчитать количество работников в каждом регионе
 */
SELECT
    r."name" AS region,
    COUNT(*)
FROM
    Employees e
    LEFT JOIN Departments d ON e.department_id = d.department_id
    LEFT JOIN Locations l ON d.location_id = l.location_id
    LEFT JOIN Regions r ON l.region_id = r.region_id
GROUP BY
    r."name";

