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


--MySQL lingo
INSERT INTO users (username, password) VALUES
    ('Messi', '10WhatIsPassword'),
    ('Carlos', '145507NotaSafePassowrd');

INSERT INTO users (link_adr, link_name, link_click, user_name) VALUES
    ('https://www.marca.com/radio.html#', 'Marca', 10, 'Carlos');

INSERT INTO links (link_adr, link_name, link_click, user_name) VALUES
    ('https://www.marca.com/radio.html#', 'Marca', 10, 'Carlos'),
    ('https://www.marca.com/radio.html#', 'Radio Marca', 2, 'Messi'),
    ('https://www.marca.com/radio.html#', 'Marca Radio', 17, 'Rafinha'),
    ('https://www.astonmartinf1.com/en-GB/', 'AstonF1', 33, 'Fernando'),
    ('https://www.williamsf1.com/', 'Williams', 55, 'Carlos'),
    ('https://www.ferrari.com/en-EN/formula1', 'Ferrari', 21, 'Carlos'),
    ('https://www.ferrari.com/en-EN/formula1', 'LaFerrari', 14, 'Fernando'),
    ('https://www.fcbarcelona.com/en/', 'Barca', 25, 'Rafinha'),
    ('https://www.fcbarcelona.com/en/', 'ElBarcelona', 10, 'Messi'),
    ('https://www.allrecipes.com/recipe/21014/good-old-fashioned-pancakes/', 'FluffyPancake', 7, 'Carlos'),
    ('https://www.bhg.com/decorating/home-accessories/flower-arranging/how-to-make-a-flower-arrangement/', 'ForSebastian', 5, 'Fernando'),
    ('https://www.realtor.com/realestateandhomes-search/South-Miami_FL/type-condo,townhome?cid=sem_149490225_674908965_1236951567465339_77309602935049:G:s&s_kwcid=AL!15120!3!!b!!o!!ClusterA-Tier1%20city%20type-condo,townhome&gclid=15ff80fd72a6100e8723e73ee6270f9d&gclsrc=3p.ds&msclkid=15ff80fd72a6100e8723e73ee6270f9d', 'CasitadelInter', 3,'Messi'),
    ('https://www.mclaren.com/racing/', 'ItsNearAFish', 16, 'Carlos'),
    ('https://www.mclaren.com/racing/', 'Andrea', 2, 'Fernando'),
    ('https://en.wikipedia.org/wiki/Hansi_Flick', 'Bossssss', 11, 'Rafinha'),
    ('https://www.intermiamicf.com/', 'Team', 10, 'Messi'),
    ('https://www.intermiamicf.com/', 'HellComeBack', 3, 'Messi'),
    ('https://pantene.ca/en-ca', 'Sponsor', 15, 'Carlos'),
    ('https://www.realmadrid.com/en-US', 'Pronto', 25, 'Rafinha'),
    ('https://www.realmadrid.com/en-US', 'NextGame', 2, 'Fernando'),
    ('https://www.realmadrid.com/en-US', 'Chill?', 5, 'Carlos');

SELECT link_adr FROM links
GROUP BY link_adr
ORDER BY SUM(link_click) DESC
LIMIT 10;