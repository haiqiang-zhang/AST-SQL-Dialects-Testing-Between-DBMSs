PRAGMA enable_verification;
create or replace table orders(ordered_at int);
create or replace table stg_orders(ordered_at int);
insert into orders values (1);
insert into stg_orders values (1);
with
orders as (
    select * from main.stg_orders
    where ordered_at >= (select max(ordered_at) from main.orders)
),
some_more_logic as (
    select *
    from orders
)
select * from some_more_logic;
