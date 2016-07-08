use Exercise
--分主客场
--select a.name+'  vs  '+b.name from department a,department b where a.name!=b.name
--不分主客场
select a.name as 'Team A',b.name as 'Team B' from department a,department b where a.name<b.name
--这个程序用到了字符串的"<"比较