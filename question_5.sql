-- question_5.sql
-- The following queries assumes that the following tables exists
--    create table organizations (
--      id uuid primary key default uuid_generate_v4() not null,
--      name text not null
--    );
--
--    create table users (
--      id uuid default uuid_generate_v4() not null,
--      name text not null,
--      age int,
--      org_id uuid references organizations(id) not null,
--      meta jsonb
--    );
-- and the meta field on users has the following data:
--
--    {
--      "joined": "2015-01-03T02:32:44",
--      "comment": "prefers linux"
--    }

-- Give me the name and age of all employees.
SELECT name, age FROM users;

-- Give me the name and organization of all employees.
SELECT users.name, organizations.name
FROM users INNER JOIN organizations
ON users.org_id = organizations.id;

-- Give me the oldest person at each organization.
WITH max_users_age_by_organization AS (
  SELECT users.org_id, MAX(users.age) as age
  FROM users
  GROUP BY users.org_id
)
SELECT organizations.id, organizations.name, users.name, max_users_age_by_organization.age
FROM organizations
INNER JOIN max_users_age_by_organization ON organizations.id = max_users_age_by_organization.org_id
INNER JOIN users ON max_users_age_by_organization.age = users.age;

-- Find the first person who joined each company.
WITH first_joined_users_by_organization AS (
  SELECT users.org_id, MIN( to_timestamp(users.meta->>'joined','YYYY-MM-DD HH:MI:SS')::timestamp ) as joined
  FROM users
  GROUP BY users.org_id
)
SELECT organizations.id, organizations.name, users.name, first_joined_users_by_organization.joined
FROM organizations
INNER JOIN first_joined_users_by_organization ON organizations.id = first_joined_users_by_organization.org_id
INNER JOIN users ON first_joined_users_by_organization.joined = to_timestamp(users.meta->>'joined','YYYY-MM-DD HH:MI:SS')::timestamp;

-- Give me the name and comment of all employees.
SELECT users.name, users.meta->>'comment'
FROM users;
