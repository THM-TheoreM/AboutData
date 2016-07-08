use Project

--any的使用；为了排除信息系的学生必须再加一个dept!='信息系'的条件，与严格不等式下的all不同
select sname,age from student where age>any(select age from student where dept='信息系') and dept!='信息系'