INSERT INTO
    employee_t
VALUES
    (
        123,
        'Harris',
        'T',
        'Chomsky',
        '1975-12-10',
        'Edmonton',
        'M',
        80000
    ),
    (
        456,
        'Kristian',
        'C',
        'Bohr',
        '1985-10-05',
        'Ottawa',
        'N',
        58000
    ),
    (
        789,
        'Charlotte',
        'F',
        'Bouchard',
        '1995-08-06',
        'Monteal',
        'F',
        70000
    ),
    (
        111,
        'Said',
        'J',
        'Ahmad',
        '1980-09-07',
        'Toronto',
        'M',
        60000
    ),
    (
        222,
        'Andrew',
        'U',
        'Brahe',
        '1980-04-02',
        'Winnipeg',
        'M',
        50000
    ),
    (
        333,
        'Nadia',
        'O',
        'Mamary',
        '1970-01-08',
        'Saskatoon',
        'F',
        65000
    ),
    (
        987,
        'Yuan',
        'P',
        'Nielsen',
        '1993-02-27',
        'Moncton',
        'N',
        62000
    ),
    (
        654,
        'Neil',
        'A',
        'Dion',
        '1963-02-27',
        'Moncton',
        'M',
        62000
    ),
    (
        321,
        'Karen',
        'C',
        'Ming',
        '1973-11-16',
        'Victoria',
        'F',
        56000
    );

UPDATE employee_T
SET
    Dep_ID = 12
WHERE
    Emp_SIN = 123
    OR Emp_SIN = 321
    OR Emp_SIN = 111;

UPDATE employee_T
SET
    Dep_ID = 11
WHERE
    Emp_SIN = 456
    OR Emp_SIN = 789
    OR Emp_SIN = 987;

UPDATE employee_T
SET
    Dep_ID = 10
WHERE
    Emp_SIN = 222
    OR Emp_SIN = 333;

INSERT INTO
    department_t
VALUES
    (10, 'ConsProd', 333, '2014-10-01'),
    (11, 'InduProd', 654, '2015-05-01'),
    (12, 'Research', 111, '2010-06-15');

INSERT INTO
    location_t
VALUES
    (10, 'Edmonton'),
    (10, 'Ottawa'),
    (11, 'Athabasca'),
    (12, 'Ottawa'),
    (12, 'Montreal');

INSERT INTO
    project_t
VALUES
    (1, 'Mobile Banking', 'Ottawa', 10),
    (2, 'Machine Learning', 'Ottawa', 12),
    (3, 'Computational Biology', 'Athabasca', 11),
    (4, 'Data Analytics', 'Edmonton', 10),
    (5, 'Educational Games', 'Athabasca', 11);