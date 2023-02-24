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

