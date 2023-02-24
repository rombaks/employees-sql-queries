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

