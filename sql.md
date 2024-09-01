# sql

## 顺序

from -> join -> on -> where -> group by ->having -> select-> distinct -> order by-> limit

## 连接

1.外连接

​	实现对null值的处理

​	查找所有信息

```sql
select stu.sno,sname,sage from stu left outer join sc on stu.sno=sc.sno
```

2.union

实现并集，连接两个查询语句

```sql
select a,b from t1
union [all]
select c,d from t2
```

​	union类似于或

​	union all类似以及

3.自身连接+左连接



## 聚集

1.聚集函数：count,sum,avg,max,min

​	用于select子句和group by中的having子句

2.where 子句中不能用聚集函数

3.聚集函数遇到空值

​	count(*)对元祖计数，不会跳过

​	其他会跳过空值

4.count(case when then else end)

```sql
select s.user_id,round(
count(case when action='confirmed' then s.user_id end)
/count(s.user_id),2
) 
as confirmation_rate 
from Signups s 
left join Confirmations c on s.user_id=c.user_id
group by s.user_id

 
```

​		省略else，那就默认为null，即不会被统计

5 .count(if(expr,id,null)) 

意思：如果是expr的,则返回 id，否则返回null，但是只对有id值的进行计数，不会对null值计数。

6.avg(conditon)

```sql
SELECT
    s.user_id,
    ROUND(IFNULL(AVG(c.action='confirmed'), 0), 2) AS confirmation_rate
FROM
    Signups AS s
LEFT JOIN
    Confirmations AS c
ON
    s.user_id = c.user_id
GROUP BY
    s.user_id

 
```

7.order by 后面可以加count()

## 查询select

1.select(case when)

​	例：编写解决方案来交换每两个连续的学生的座位号。如果学生的数量是奇数，则最后一个学生的id不交换。按 `id` **升序** 返回结果表

```sql
select (case
when mod(id,2)=1 and id=(select count(*) from Seat) then id
when mod(id,2)=1 then id+1
else id-1
end)as id ,student 
from Seat
order by id
```

 2.limit 

limit n 查询n条数据