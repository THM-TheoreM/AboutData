use Project

--group by������having������where���������п����þۺϺ���
--��Ϊhaving����˳����group by����
select sno,COUNT(cno) as 'number of courses' from cs group by sno having COUNT(cno)>3