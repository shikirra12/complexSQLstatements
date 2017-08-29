SCHEMA
CREATE TABLE todo ( id SERIAL PRIMARY KEY NOT NULL, title VARCHAR(255) NOT NULL, details TEXT NULL, priority INTEGER NOT NULL DEFAULT 1, created_at TIMESTAMP NOT NULL, completed_at TIMESTAMP NULL);

INSERT TODOS
INSERT INTO todo (title, priority, created_at) VALUES ( 'vaccum', 3, '2007-04-30 13:10'), ('clean car', 2, '2007-04-30 17:40'), ('wash dishes', 1, '2017-08-25 07:10'), ('wash dog', 5, '2017-08-14 13:10'), ('eat', 1, '2017-04-30 18:20'), ('sleep', 3, '2017-08-28 13:10'), ('shower', 4, '2007-04-30 13:10'), ('recycle', 3, '2007-04-30 02:10'), ('jump', 1, '2017-07-25 13:10'), ('hop', 5, '2007-04-30 13:10');
INSERT INTO todo (title, priority, created_at, completed_at) VALUES ('organize', 2, '2017-07-22 11:10', '2017-07-23 13:10'), ('walk dog', 4, 'yesterday', 'today'), ('skip', 3, 'yesterday', 'today'), ('write', 2, '2017-04-30 13:10', 'today'), ('type', 5, '2017-01-30 10:10', '2017-02-25 13:10'), ('smile', 1, '2017-05-10 13:10', '2017-05-12 17:10'), ('be happy', 3, '2017-03-15 13:10', '2017-03-17 13:12'), ('smize', 2, '2017-07-30 13:10', '2017-07-30 15:10'), ('say goodbye', 5, '2007-04-30 13:32', '2017-04-30 13:10');
INSERT INTO todo (title, priority, created_at) VALUES ('swim', 3, '2005-04-30 13:10');

FIND INCOMPLETE TODOS WITH PRIORITY OF 3
SELECT title
FROM todo
WHERE priority = 3 AND completed_at IS NULL;

FIND NUMBER OF INCOMPLETE TODOS BY PRIORITY
SELECT COUNT(title), priority
FROM todo
WHERE completed_at IS NULL
GROUP BY priority;

FIND NUMBER OF TODOS BY PRIORITY IN LAST 30 DAYS
SELECT COUNT(id), priority
FROM todo
WHERE created_at > current_date - INTERVAL '30' DAY
GROUP BY priority;

FIND NEXT TODO TO WORK ON WITH HIGHEST PRIORITY AND CREATED FIRST
SELECT title, created_at
FROM todo
WHERE completed_at IS NULL
ORDER BY created_at;
