# SQL

SQL=Structured Query Language：结构化查询语言

http://www.w3school.com.cn/quiz/quiz.asp?quiz=sql 可用于检查select语句掌握程度

**视频教程**

http://yun.baidu.com/share/link?shareid=1402927191&uk=4262347089#path=%252FSQLServer%25202008%25E9%25AB%2598%25E7%25BA%25A7%25E6%2595%25B0%25E6%258D%25AE%25E5%25BA%2593%25E7%25AE%25A1%25E7%2590%2586%25E8%25A7%2586%25E9%25A2%2591%25E6%2595%2599%25E7%25A8%258B

**安装**

- 图文详解：http://jingyan.baidu.com/article/86fae3469e6c4b3c48121a76.html

- 最后的防火墙设置详细可参见
http://blog.sina.com.cn/s/blog_4fdb7deb0101dloa.html

- 最多需要添加TCP 135, 1433和UDP 4500, 500即可，如不确定sql程序位置可在“程序和服务选项卡中”选择“所有符合指定条件的程序”

- 可能需要重启计算机才能实现防火墙的设置更改

**数据类型**

- 整数型：bigint(-2^63~2^63-1之间的整数，占8个字节),int(-2^31~2^31-1之间的整数，占4个字节), smallint(-2^15~2^15-1之间的整数，占2个字节), tinyint(0~255之间的整数，占1个字节)
          
  p.s.:在下方“标识规范”中可选择“(是标识)”将其变为编号，“标识种子”表示起始编号，“标识增量”为等差数列公差

- 浮点数类型：real(精确到第七位小数，占4个字节), float(精确到第十五位小数，占8个字节), decimal(-10^38~10^37，占2~17个字节), numeric(同decimal)

- 货币型：money(-2^63~2^63-1，精确到小数点后4位，占8个字节), smallmoney(-2^31~2^31-1，精确到小数点后4位，占4个字节)

- bool型：bit(除0的数据都认为是1，只占一个字节，且不能是空值)

- 二进制型：binary(n)（n=1~8000）, varbinary(n)（以Ox起始，超出部分截断，若位数为基数则前面补一个0使其为偶数位）, uniqueidentifier(唯一标识号，用于存储全局唯一标识符，占16字节), image（以Ox起始，用于存储图像，1~2^31字节）, binary large object（用于存放异常巨大的二进制数据块）

- 文本型：char(n)（n=1~8000固定长度ASCII，不足部分用空格补上）, nchar(n)（n=1~4000固定长度Unicode，每个字符占两个字节）, varchar(n)（可变长度）, nvarchar(n)（可变长度）, text（1~2^31-1字节ASCII）, ntext（1~2^30-1字节Unicode）

  都用西文单引号'......'！！！

- 日期：datetime(日期和时间的结合体，1753-1-1 0:00:00~9999 23:59:59,8个字节，前四个放日期，后四个放时间，省略一半默认1900-1-1/12:00:00), smalldatetime(1900-1-1~2079-6-6，占4个字节，前两个放日期，后两个放时间)

- 其他：sysname=nvarchar(128) not null（非空的128个Unicode）, SQL-VARIANT（任何一种SQL认为合法的数据）, table（函数返回结果的数据类型）

p.s.：“允许null值”表示是否可以是空值，再去掉下方选项卡中“默认值或绑定”（默认值表示在不填写时执行SQL自动填充的值）可以将一个字段变为必填字段，在“工具”→“选项”→“Designers”→“表设计器和数据库设计器”→取消勾选“阻止保存要求重新创建表的更改”即可防止设计完后不能保存的问题！！！
      
**基本操作**

- SQL对大小写不敏感，即不区分大小写！！！

- \--：单行注释；

- /*......*/：多行注释；

- 点击左上角“新建查询”进行代码编写；

- 每次执行完以后可能需要刷新数据库列表（第一次可能需要重启SQL）才能看到对数据库列表的改动

- 创建databse：


          create database DATABASENAME
          on
          (
          name=数据库逻辑名,
          filename='路径1\\数据库文件名.mdf',
          size=M1,--初始大小
          maxsize=N1,--最大大小
          filegrowth=P1%--增长率
          )
          log on
          (
          name=事务日志逻辑名,
          filename='路径2\\事务日志文件名.ldf',
          size=M2,
          maxsize=N2,
          filegrowth=P2%
          )


  p.s.：也可以简单的“create database DATABASENAME”

- 修改databse名称：exec sp_renamedb OLDNAME,NEWNAME

- 修改数据库名称：exec sp_rename OLDNAME,NEWNAME

- 增加事务日志文件：


		  alter database DATABASENAME
          add log file
          (
          name=FILENAME1,
          filename='路径\FILENAME2.ldf',
          filegrowth=P%
          )


- 增加数据库文件：


		  alter database DATABASENAME
          add file
          (
          name=FILENAME1,
          filename='路径\FILENAME2.mdf',
          size=M
          )


- 删除文件：

  alter database DATABASENAME

  remove file FILENAME--数据库/事务日志逻辑名

- 删除databse：drop database DATABASENAME1,......(注意创建并不支持这种格式，只能一次一个)

- 创建表(TABLE)：


          use DATABASENAME--打开数据库
          create table TABLENAME--创建表
          (
		  KEYNAME1 DATATYPE1 [not null] [identity(1,1)] [primary key],--字段名 数据类型,
		  ......
		  )


  p.s.1：“not null”表示不允许NULL值；identity(1,1)表示如果DATATYPE是标识列，还可以设置(标识种子,标识增量)；primary key表示主键，即唯一标识这一列（一个表中只能有一个主键），这列中值不能重复，不能为NULL；三者排列顺序无先后要求

  p.s.2：主键可以由多个字段组成，其SQL语句为：primary key(KEYNAME1,...)
  
  p.s.3：check约束的SQL语句为：check(KEYNAME between ... and .../in(...))
  
  p.s.4：外键约束的SQL语句为：references TABLENAME(KEYNAME)
  
  p.s.5：临时表前加一个#表示局部临时表（关闭这个查询.sql文件后即消失），加两个#表示全局临时表（断开连接再重连后即消失）
  
- 修改表设计：


          use DATABASENAME
          alter table TABLENAME
          ①add KEYNAME KEYTYPE [default DEFAULTVALUE]--增加字段，默认值在下次添加数据时生效
		  ②alter column KEYNAME KEYTYPE--转换字段类型
		  ③drop column KEYNAME--删除字段

- 数据条目变更：

  use DATABASENAME

  ①手动填充：insert into TABLENAME(KEYNAME1,......)  values(VALUE1,......)--添加数据，不全的用NULL/默认值填充，如果不允许NULL值且没有默认填充将编译报错

  p.s.1：如果values包含所有内容可以不用(KEYNAME1,......) 

  p.s.2：插入多个有结构的数据可以用`exec(@x)`，其中@x是一个字符类型变量，内容为'insert into TABLENAME values(VALUE1,......)',注意原来VALUE中可能的文本类型需要用的单引号'string'现在要变成''string''

  ②用select语句得到结果填充：insert into TABLENAME select语句
  
  ③更新/插入新字段：update TABLENAME set KEYNAME1=VALUE1,...... [where CONDITON]--更新所有/[条件]数据

  p.s.：除了直接赋值还可以像KEYNAME1=KEYNAME1+1000这样的运算语进行更改

  ④delete from TABLENAME [where CONDITION]--删除所有/[条件]数据

- 删除表：

  use DATABASENAME
  
  drop table TABLENAME

**select基本格式**

  use DATABASENAME

  select [top NUM / distinct] ? [as KEYNAME] [into TABLENAME] from TABLENAME [where CONDITION] [order by KEYNAME] [compute SUM/AVG/MAX/MIN(KEYNAME),...... by KEYNAME / group by KEYNAME]

  []为可选项，其余为必须的格式

- ?=*：从TABLENAME中选取所有字段
 
- ?=KEYNAME1,......：从TABLENAME中选取相应字段，并不一定要按照原表中字段顺序！！！
 
- ?=COUNT(\*)：返回查询到的数据条目个数，不包含NULL值，所以“\*”变为KEYNAME有意义

- ?=SUM/AVG/MAX/MIN(KEYNAME)：返回总和/平均值/最大值/最小值并以指定列名显示

- top NUM：前NUM条符合条件的记录，也可以是“top NUM percent”表示百分比

- distinct：仅返回不同的VALUE，多个字段有一个不同即distinct

- as KEYNAME：将紧邻的一列以指定列名（而不是默认的“(无列名)”）显示，即若KEYNAME1,KEYNAME2 as KEYNAME只会将KEYNAME2以KEYNAME列名显示，所以每个KEYNAME可以有一个as

- into TABLENAME：将查询出来的结果放到新表中，自动创建新表

- where CONDITION：需要满足的条件（e.g.：教师工资<4000）

- order by KEYNAME1 [asc/desc]：按照某一指定列升序/降序排列，默认从小到大（中文按照拼音字母顺序）；如果KEYNAME1值相同可以再加上“,KEYNAME2 [asc/desc]”再进一步排序

- compute SUM/AVG/MAX/MIN(KEYNAME1),...... by KEYNAME：对KEYNAME进行分组然后计算出KEYNAME1,......相应统计量；KEYNAME必须是order的第一个字段即主要字段！！！

- group by KEYNAME [having CONDITION]：按照字段分组，此时“?”对于单一组来说要有意义(比如“KEYNAME本身”或者“其他KEYNAME的统计函数”)且CONDITION不能使用前面[as KEYNAME]中的KEYNAME！！！

**CONDITION**

- 比较运算符： KEYNAME >/</=/>=/<=/!=/<>（等价于!=）/!>/!< VALUE

  p.s.：空值用“is Null”而不是“=”！！！
  
- or：用于“或”逻辑连接

- not/!：用于“非”逻辑，“not”写在运算符前is后，“!”只能作用于运算符前

- and：用于“与”逻辑连接

- 优先级：圆括号 > “非”/正负 > 乘除 > 加减 > 比较运算符 > “与” > “或”

  p.s.：加减乘除可以直接作用于字段，如“工资+奖金”，姓名='新表'+姓名

- KEYNAME in (VALUE1,......)：在某个集合范围内的

  p.s.：在select语句嵌套时，in很好用（因为select返回一个集合），=容易出错

- KEYNAME between VALUE1 and VALUE2：在某个数值范围内的，包含端点！！！

- KEYNAME like '%CHAR%'：模糊查询，%表示任意个数字符（包括0个）

- exists(select语句返回的集合)：只要集合中有元素则执行前面的select语句，否则为空

- any(select语句返回的集合)：表示集合中的任意一个元素，or的关系

  e.g.：工资>any(select 工资from TABLENAME where CONDITION)表示大于任何一个满足CONDITION的工资大小即可

- all(select语句返回的集合)：表示集合中的所有元素，and的关系

**复合select**

- union=union all：连接两个select表示取并集，忽略重复条目

- intersect：连接两个select表示取交集

- select ? from TABLENAME1,TABLENAME2 [where CONDITION]：Kronecker积的效果，因为有两张表，所有可能会有歧义，此时可用“TABLENAME.KEYNAME”的形式表明用哪个表的字段，没有歧义时可以不加修饰地直接使用“KEYNAME” 

- select ? from TABLENAME1 inner join TABLENAME2 on CONDITION：效果同“,”+“where”

- select ? from TABLENAME1 left join TABLENAME2 on CONDITION：TABLENAME1的数据全显示，TABLENAME2的数据只显示满足条件的条目，其余条目所有字段以NULL填充

- select ? from TABLENAME1 right join TABLENAME2 on CONDITION：（与left相对）TABLENAME2的数据全显示，TABLENAME1的数据只显示满足条件的条目，其余以NULL填充

- select ? from TABLENAME1 full join TABLENAME2 on CONDITION：相当于left join并right join

- inner join=join, left join=left outer join, right join=right outer join, full join=full outer join

- join可以连用，如：stocks a join stocks b on ... join stocks c on ...

**数据有效性**

- 是否允许NULL值：如前所述

- check约束：在“设计”中右键→“check约束”→“添加”可以设计一种数据规则，如“总收入=工资+薪金”/“年龄>20”，可添加多各check约束

- 不允许重复值：在“设计”中右键→“索引/键”→“添加”→类型选择“唯一键”

**索引**

在“设计”中右键→“索引/键”，可添加/查看索引

- 主键/唯一键是一种索引

- 查询所有索引：exec sp_helpindex TABLENAME

- 创建索引：create [unique/clustered/nonclustered] index INDEXNAME on TABLENAME/VIEWNAME(KEYNAME [asc/desc])

p.s.：unique表示唯一索引（即唯一键）；clustered：簇索引（默认）；nonclustered：非簇索引；asc/desc：如前所述

- 修改索引名：exec sp_rename 'TABLENAME.OLDINDEXNAME','NEWINDEXNAME'

- 删除索引：drop index TABLENAME.INDEXNAME

**视图(VIEW)**

- 分为三种：标准视图、索引视图、分区视图

- 与表不同，是一个虚拟的表，视图上的修改和表的修改会相互影响！！！

- 创建视图：create view VIEWNAME as SELECT_STATEMENT

- 修改视图：alter view VIEWNAME as SELECT_STATEMENT

- 删除视图：drop view VIEWNAME

**编程相关**

- 变量的声明：declare @VARIABLENAME1 TYPENAME1,......

p.s.：“@”表示局部变量，只能由当前程序使用；全局变量由SQL定义，不能定义只能用“@@”引用；局部变量不能与SQL定义好的全局变量重名

- 变量的赋值：set/select @VARIABLENAME1=VALUE1,......

p.s.1：set只能为单一变量赋值，select可为任意多个变量赋值

p.s.2：使用select出的值赋值“select @VARIABLENAME=MAX(KEYNAME) from TABLENAME”，不支持“@VARIABLENAME=select MAX(KEYNAME) from TABLENAME”！！！

- 显示变量的值：print/select @VARIABLENAME1,......

p.s.：print只能为单一变量输出，select以表的形式同时在一行输出任意个变量，故支持“as 别名”（print不行）！！！；两个print会换行显示值，所以并不等价于select两个变量；除了输出@VARIABLENAME以外还可以是常量、@VARIABLENAME的运算表达式等等

- 整数的逻辑运算符：&（按位与），|（按位或），~（按位取反），^（按位异或）

- 定义程序块：begin ...... end，相当于一般编程语言中的“{......}”

- if：


		if CONDITION
		CODEBLOCK1
		[else if
		CODEBLOCK2]
		......
		[else
		CODEBLOCK]


- case：


		case
			when CONDITION1	then CODE1
			......
			else CODE
		end


p.s.：“set @VARIABLENAME=case...end”这样的语句是合理的

- while：“while CONDITION”；支持“break，continue”

- goto：“goto TARGETNAME”，需要在某一行前做标记：“TARGETNAME:”

**常用系统函数**

- 常数函数：PI（是一个不带参数的函数！！！）

- 三角函数相关：（均为float型数据）

  SIN/COS/TAN/COT/ASIN/ACOS/ATAN，角度以弧度表示

  DEGREES：把角度转换为弧度

  RADIANS：把弧度转换为角度

- 幂指对数：EXP/LOG/LOG10/SQRT

- 近似函数：CELLING/FLOOR/ROUND(x,NUM)（对x四舍五入保留NUM位小数，可以为负）

- 正负号相关：ABS/SIGN(正数返回1负数返回-1零返回0)

- 随机函数：RAND(0~1之间浮点数)

- ASCII码：ASCII('?')返回字符?的ASCII码，CHAR(NUM)返回ASCII码为NUM的字符

- 字符串相关：

  UPPER/LOWER(STR)：将字符串STR全部转换为大/小写

  STR(VALUE,NUM1,NUM2)：将数值VALUE以总长度NUM1（默认10，不够会迫使以*表示）保留NUM2位小数变为字符串

  LEN(STR)：返回字符串STR的长度

  LTRIM(STR)：去除字符串STR开始的空格

  RTRIM(STR)：去掉字符串STR尾部的空格

  LEFT(STR,NUM)：从STR左侧截取NUM个字符

  RIGHT(STR,NUM)：从STR右侧截取NUM个字符

  SUBSTRING(STR,NUM1,NUM2)：从STR第NUM1个位置开始截取NUM2个字符

  REPLICATE(STR,NUM)：重复STR字符串NUM次

  REVERSE(STR)：逆序字符串STR

  REPLACE(STR,STR1,STR2)：将STR中所有STR1替换为STR2

  SPACE(NUM)：NUM个空格

  STUFF(STR1,NUM1,NUM2,STR2)：将字符串STR第NUM1开始长度为NUM2的子串替换为STR2，NUM1/NUM2为负值/NUM1超出长度返回空字符串，NUM2超出长度认为从NUM1开始到字符串末

- 数据类型转换：

  CAST(VALUE as TYPENAME)：将数据VALUE转换为TYPENAME类型

  CONVERT(TYPENAME,VALUE)：将数据VALUE转换为TYPENAME类型（必须是SQL系统定义的数据类型，不能是用户定义的数据类型；带n的TYPENAME默认为10）

- 日期相关：

  GETDATE()：返回当前的系统日期和时间

  YEAR/MONTH/DAY/(DATE/STR)：返回年/月/日

  以下定义DATEPART为weekday/hour/minute/second/year/month/day中任意一项

  DATENAME(DATEPART,DATE/STR)：返回（字符串型）星期几/小时/分钟/秒/年/月/日

  p.s.：可以通过“set language 'Simplified Chinese'/'English'”来控制输出中文“星期日”还是英文“Sunday”

  DATEPART(DATEPART,DATE/STR)：返回（整型）星期几/小时/分钟/秒/年/月/日

  p.s.：默认周日为一周第一天记为1，周六为7，可以通过“set datefirst NUM”设星期NUM天为一周的第一天

  DATEADD(DATEPART,NUM, DATE/STR)：对DATE/STR中DATEPART部分增加NUM（负数表减少），返回datetime型

  DATEDIFF(DATEPART,DATE1,DATE2)：返回（整型）DATE2-DATE1在DATEPART上的值

**自定义函数**

- 创建函数：


		create function FUNCTIONNAME(@PARAMETERNAME1 PARAMETERTYPE1,......) returns RETURNTYPENAME
		as
		begin
		CODEBLOCK
		return VALUE
		end


- 使用函数：OWNERNAME.FUNCTIONNAME(PARAMETER1,......)

- 修改函数：将“create”改为“alter”即可

- 删除函数：drop function FUNCTIONNAME1[,......]

**存储过程(procedure)**

- 常用系统存储过程：以“exec”开头，后面跟

  sp_attach_db @dbname='DATABASENAME',@filename1='ABSOLUTEPATH\DATABASENAME.mdf'：附加数据库

  sp_detach_db DATABASENAME：分离数据库，不能分离正在use的数据库，需要重启SQL

  sp_rename/sp_renamedb：如前所述

  sp_help TRIGGERNAME/FUNCTIONNAME/......：显示触发器/函数属性

  sp_helptext TRIGGERNAME/FUNCTIONANME/......：显示触发器/函数的编写代码

  sp_changedbowner 'OWNERNAME'：改变数据库所有者

  sp_password OLDPASSWORD NEWPASSWORD LOGINNAME：修改密码

- 创建存储过程：


		create proc PROCNAME
		[@PARAMETERNAME1 PARAMETERTYPE1,
		......
		@OUTPUTPARAMETERNAME1 OUTPUTPARAMETERTYPE1 output,
		......]
		as
		begin
		CODEBLCOK
		end


- 调用存储过程：exec/execute PROCNAME [PARAMETER1,...,OUTPUTPARAMETER1 output,...]

- 修改存储过程：将“create”改为“alter”即可

- 删除存储过程：drop proc PROCNAME1[,......]

**游标(cursor)**

类似于JAVA中的Iterator

- 创建游标：


		use DATABASENAME
		declare CURSORNAME cursor [local/global] [forward_only/scroll] for
		SELECT STATEMENT
		[for read only/for update]


  local/global：局部（限于所在的存储过程/触发器/批程序处理过程）/全局游标

  forward_only/scroll：只进游标（一条一条向后显示）/可选择游标

  for read only/for update：设置为只读游标/更新游标

- 使用游标：


		open CURSORNAME
		fetch next from CURSORNAME--转到下一条记录
		fetch prior from CURSORNAME--转到上一条记录
		fetch first from CURSORNAME--转到第一条记录
		fetch last from CURSORNAME--转到最后一条记录
		fetch absolute NUM from CURSORNAME--转到第NUM条记录
		fetch relative NUM from CURSORNAME--向后跳转NUM（负数表示向前）条记录
		@@fetch_status--0表示正常，-1表示超出范围，-2表示要输出数据已不存在
		fetch ? from CURSORNAME into @VARIABLENAME1,......--将提取出来的条目进行存储，局部变量类型要与select结果的各字段值类型保持一致


- 关闭游标：close CURSORNAME（还可以open）

- 释放游标：deallocate CURSORNAME（相当于删除）

**触发器(trigger)**

- 创建事件后触发器：


		create trigger TRIGGERNAME on TABLENAME for insert as--每次插入条目就触发一次
		begin
		CODEBLOCK
		end


p.s.1：除了“insert”以外还可以是“update”更新时调用，“delete”删除时调用

p.s.2：表的同一个操作可以添加多个事件后触发器

- 设置事件后触发器先后顺序：

  多个触发器同时被触发时先后顺序，只能指定第一个和最后一个被调用的是哪个，其余随机

   sp_settriggerorder @triggername='TRIGGERNAME',@order='?1', @stmttype='?2'

  stmt为statement的缩写

  ?1=first/last/none：设置触发器TRIGGERNAME为第一个/最后一个/取消优先被触发

  ?2=insert/update/delete：指定触发条件

- 创建替代触发器：


		create trigger TRIGGERNAME on TABLENAME instead of delete--用以下代码替代删除
		begin
		CODEBLOCK
		end


p.s.1：除了“delete”以外还可以是“update”替代更新，“insert”替代插入

p.s.2：表的同一个操作只能添加一个替代触发器

- 修改触发器：将“create”改为“alter”即可

- 删除触发器：drop trigger TRIGGERNAME

**数据库安全**

- 服务器认证模式分为两种：Windows身份验证（通过Windows系统管理员方式进入）/SQL Server身份验证（需要用登录名、密码进入）；在安装时可以选择Windows身份验证/混合验证

- 修改认证模式：右键服务器→“属性”→“安全性”，可在两种模式中选择

- 创建新登录名：

  服务器下“安全性”→“登录名”→右键“新建登录名”

  创建新Windows身份验证：“搜索”→“高级”→“立即查找”

  创建新SQL Server身份验证：输入登录名，密码，确认密码，去掉“强制密码过期”，下方可设置“默认数据库”，“默认语言”，在“用户映射”总选择一个数据库，“状态”→“登录”→勾选“启用”

- 角色：在数据库中，为便于对用户及权限进行管理，可以将一组具有相同权限的用户组织在一起，这一组具有相同权限的用户就称为角色

- 权限：分为“授予”，“具有授予权限”，“拒绝”

- 服务器角色（固定9个，权限不能被更改）

  一个登录名可以占用多个服务器角色

  bulkadmin：执行大容量的插入操作

  dbcreator：创建和更改数据库

  diskadmin：管理磁盘文件

  processadmin：管理运行在SQL中的进程

  public：提供数据库中用户的默认权限

  securityadmin：管理服务器的登录

  serveradmin：管理配置服务器范围的设置

  setupadmin：管理扩展的存储过程

  sysadmin：执行SQL安装中的任何操作（权限最高）

  p.s.：“sa”为系统默认管理员用户，系统管理员应拥有sysadmin权限；“Guest”使得没有账号的用户可以通过这个账号访问数据库；“public” 数据库的每个合法用户都属于该角色

- 数据库角色：

  创建数据库用户：DATABASENAME→“安全性”→“用户”→右键“新建用户”→填写“用户名”，选择“登录名”

  创建新数据库角色：DATABASENAME→“安全性”→“角色”→“数据库角色”→右键“新建数据库角色”→填写“角色名称”，“...”选择“所有者”，“添加”角色成员

  p.s.：对象“所有者”对对象有特殊的权限，对象“所有者”可以执行任何与对象有关的 Transact-SQL 语句（例如 Insert、Update、Delete、Select 或 EXECUTE），也可以管理对象的权限

  权限查看：右键数据库角色名→“安全对象”→下方“权限(P)”中显示所拥有的权限

- SQL语句： 
  服务器认证模式：xp_instance_regwrite N'HKEY_LOCAL_MACHINE',N'SOFTWARE\Microsoft\MSSQLServer','LoginMode',N'REG_DWORD',1/2，取值为1表示以Windows身份验证模式进行验证，2表示以SQL Server方式进行验证

  更改密码：execute sp_password 'OLDPASSWORD','NEWPASSWORD','LOGINNAME'

  更改默认数据库：execute sp_defaultdb 'LOGINNAME','DATABASENAME'

  更改默认语言：execute sp_defaultlanguage 'LOGINNAME','Simplified Chinese'

  删除账号：execute sp_droplogin 'LOGINNAME'

  为数据库增加用户：use DATABASENAME&&exec sp_grantdbaccess 'ACCOUNTNAME','USERNAME'

  查询当前数据库所有/指定数据库用户：exec sp_helpuser ['USERNAME']

  删除指定数据库用户：exec sp_revokedbaccess 'USERNAME'

  添加服务器角色：exec sp_addsrvrolemember 'LOGINNAME','服务器角色名'

  删除服务器角色：exec sp_dropsrvrolemember 'LOGINNAME','服务器角色名'

  创建数据库角色：exec sp_addrole '数据库角色名','USERNAME'

  删除数据库角色：exec sp_droprole '数据库角色名'

  将已有数据库角色添加到指定数据库用户：exec sp_addrolemember '数据库角色名','USERNAME'

  删除已添加到数据库用户中的数据库角色：exec sp_droprolemember '数据库角色名', 'USERNAME'

  授予权限：grant update on TABLENAME to 数据库角色名/USERNAME [with grant option]

  p.s.：权限除了“update”以外还可以是“insert”；“with grant option”表示可以将该权限授权给其他人；

  剥夺权限：revoke update on TABLENAME from 数据库角色名/USERNAME cascade

  p.s.：“cascade”表示同时剥夺将该权限授权给其他人的权限（不能只剥夺权限而不剥夺授权给其他人的权限）

  拒绝权限：deny update on TABLENAME to 数据库角色名/USERNAME cascade

**数据库备份与还原**

- 图形化界面备份：右键DATABASENAME→“任务”→“备份”；“备份类型”：“完整”（包括所有数据以及数据库对象）/“差异”（比较上次备份到现在的更改）/“事务日志”；“文件和文件组”：选择性针对性备份

- 图形化界面还原：右键DATABASENAME→“任务”→“还原”→“数据库”/“文件和文件组”/“事务日志”→勾选还原名称→“选项”选择还原文件路径

- SQL语句：

  完整：backup database DATABASENAME to disk=N'PATH\BACKUPNAME' with noformat,noinit,name=N'RECOVERNAME',skip,norewind,nounload,stats=10

  差异：backup database DATABASENAME to disk=N'PATH\BACKUPNAME' with differential,noformat,noinit,name=N'RECOVERNAME',skip,norewind,nounload,stats=10

  事务日志：backup log DATABASENAME to disk=N'PATH\BACKUPNAME' with noformat,noinit,name=N'RECOVERNAME',skip,norewind,nounload,stats=10

  还原：restore database DATABASENAME from disk=N'PATH\BACKUPNAME' with replace

**报表**

- 需要安装SQL Server Business Intelligence Development Studio，没有安装的需要重新到安装包里选择该组件安装，选择“向SQL Server 2008的现有实例中添加功能(A)”而非“执行SQL Server 2008的全新安装”

- 新建报表项目：“文件”→“新建”→“项目”→“报表服务器项目向导”→（填好名称和路径后）“确定”→（弹出一个对话框）“下一步”→“新建数据源”→（填好名称）“类型”选择“Microsoft SQL Server”→“编辑”（填好服务器名，登录方式，“测试连接”成功后选择数据库名）→“下一步”→在“查询字符串”中输入select语句

- 解决中文不能显示的问题：右键不能显示中文的框“文本框属性”→选择一种中文“字体”即可（多个要同时修改可选中区域在上方工具栏中直接修改字体）

- 修改select语句：右键报表名“查询”（点击“编辑为文本”可换为可视化界面）

- 增加货币符号：右键需要修改的区域“文本框属性”→“数字”→“货币”

- 文本框背景色：右键需要修改的区域“文本框属性”→“填充”→选择“填充颜色”

- 隐藏数据：右键需要修改的区域“文本框属性”→“可见性”→“隐藏”/“给予表达式显示或隐藏”（“fx”，在“类别(C)”字段里可选“字段(DataSet1)”在“值(V)”字段里选一个字段，然后双击，再输入<20等条件）

- 插入/删除：在最左端/最上端可右键选择“插入行”/“插入列”，在单元格内有下拉菜单可以选择相应数据，还可以“合并单元格”，修改对齐方式（右键“文本框属性”→“对齐”），字体颜色（右键“文本框属性”→“字体”）；删除行/列类似操作

**sql语句的优化**

- 查看执行时间和cpu占用时间：


		set statistics time on
		CODEBLOCKS
		set statistics time off


  在“结果”右边的“消息”框中可以看到“CPU时间”和“占用时间”

- 查看查询对I/0的操作情况：


		set statistics io on
		CODEBLOCKS
		set statistics io off



  在“消息”框中可以看到“扫描计数”：索引或表扫描次数；“逻辑读取”：数据缓存中读取的页数；“物理读取”：从磁盘中读取的页数；“预读”：查询过程中，从磁盘放入缓存的页数；“lob逻辑读取”：从数据缓存中读取，image，text，ntext或大型数据的页数；“lob物理读取”：从磁盘中读取，image，text，ntext或大型数据的页数；“lob预读”：查询过程中，从磁盘放入缓存的image，text，ntext或大型数据的页数”

- 查看执行计划：

  选中sql语句，在“执行"任务栏同一行内有“显示估计的执行计划”选项，每句sql都会有显示相应开销，鼠标放在图标上会显示此步骤执行的详细内容，分析占百分比多的的一块，可以根据重新设计数据结构，或这重写sql语句，来对此进行优化。
  
- select语句的优化：

  ①能返回具体列的尽量避免用select \*
  
  ②数据量很大的时候尽量避免用distinct，否则会大大降低查询效率
  
  ③能不用union尽量不用，因为数据库要先合并结果集再对结果集进行排序，再进行过滤重复记录的操作，很麻烦
  
  ④判断表中是否存在数据：用select top 1 KEYNAME from TABLENAME比select count(\*) from TABLENAME要好
  
  ⑤复合select语句中由于left/right join取决于左/右表长度，故应先做where再做外层select，如下例中上面的方式就比下面的好
  
  
		select * from 
		( (select * from orde where OrderId>10000) o  left join orderproduct op on o.orderNum=op.orderNum )

		select * from 
		( orde o left join orderproduct op on o.orderNum=op.orderNum )
		where o.OrderId>10000
