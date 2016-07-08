use Exercise
select top 5 * into #Temp from CUSTOMERS order by ID asc
select top 4 * from  #Temp order by ID desc
--¡ÈªÓ‘À”√top, order by