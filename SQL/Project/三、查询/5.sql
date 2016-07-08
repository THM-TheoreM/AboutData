use Project

--like除了通配符“%”外“_”表示有且仅有一个字符；“_”需要用“[]”转义否则表示一个任意字符
select * from course where cname like 'DB[_]%i__'