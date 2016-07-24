# SAS
**Installation**

  下载地址及安装过程详见http://jingyan.baidu.com/article/fec4bce240380ef2618d8b3b.html
  
  p.s.1：安装前系统时间要调到给的SID文件许可截止时间之前
  
  p.s.2：可能第一次安装会卡在前几项，可以“停止”后再运行一次，会接着安装，不要点右上角“×”，安装会回退
  
  p.s.3：Google中搜索“SID_header SAS 9.4 win 64 2016 filetype:txt”可以搜索最新SID许可，然后运行“续订SAS软件”更新SID即可免去每次运行SAS前都调整系统时间

**基本知识**

- 程序窗口：

  日志窗口：记录运行的详细信息包括运行时间、编译报错等

  编辑器窗口：编写代码；当且仅当光标放在该窗口下可以单机“运行”→“提交”来测试程序

  结果窗口：显示代码成功运行后程序输出结果的目录

  输出窗口：显示SAS程序运行的文本型输出结果

  SAS资源管理器窗口：显示SAS数据库和SAS数据集

  p.s.：在“视图”菜单中可以打开/切换上述5个窗口
  
- 数据集与逻辑库：

  数据集：使用和分析计算数据的原始来源
  
  逻辑库：数据集文件的集合
  
  数据集分为两种：临时数据集和永久数据集；命名方式上永久数据集需要“LIBNAME.FILENAME”而临时数据集只需要“FILENAME”
  
  逻辑库也分为两种：临时库和永久库，临时库中文件在每次SAS启动时创建在关闭时删除，work库是默认临时库
  
  利用编辑器中命令创建逻辑库：libname LIBNAME 'ABSOLUTEPATH';（将数据集文件与磁盘中某个文件夹联系在一起，但LIBNAME不一定要和ABSOLUTEPATH中文件夹名相同）
  
  可视化界面创建逻辑库：进入“SAS资源管理器”窗口→双击进入“逻辑库”→右键“新建”→输入逻辑库“名称”（字母开头）→选择“路径”→如果是永久库“启动时启用”

  数据集的创建：菜单“工具”→“表编辑器”，右键表头某一列“Column Attributes”可以设置该列的别名“name”，数据类型“type”为字符型（默认）还是数字型，输出格式“format”，输入格式“informat”
  
  数据集的排序：打开数据集后在菜单“编辑”中选择“编辑模式”→在菜单“数据”中选择“排序”；如果只对一列排序可以直接右键该列表头选择“sort”
  
- EXCEL与SAS数据集：

  从excel文件（等外部文件中）导入数据集：菜单“文件”→“导入数据”→“Browse”文件路径→选择Sheet→“Options”选项中有“Use data in the first row as SAS variable names”来控制是否有表头别名→选择要放入的逻辑库“library”给定数据集名称“Member”→“Finish”

  p.s.：如果显示“连接失败”，日志窗口提示“ERROR: 连接: 没有注册类  ERROR: LIBNAME 语句出错。”则应下载“Accessdatabaseengine_x64.exe”并安装，如果在安装时遇到系统检测到已装32位的版本，需要运行“cmd”，输入绝对路径/相对路径加上“/passive”，如“F:\AccessDatabaseEngine_x64.exe /passive”，安装完成后运行“regedit”，删除注册表中“HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\14.0\Common\FilesPaths”中“mso.dll”文件
  
  将数据集文件导出到excel文件中：菜单“文件”→“导出数据”→“Library”中选择导出数据集来自的逻辑库“Member”中选择需要导出的数据集→选择输出文件类型→选择输出文件路径及名称→“finish”
  
**基础编程**

- 整理成SAS数据集：

  * 直接输入：


          data FILENAME;
          input VARIABLENAME1[$] [?] VARIABLENAME2 [?] ......;
          cards;
          DATALINES
          ;
          run;
  
    []中为可选参数：
  
    $：变量为字符类型（不加表示为数字类型）
  
    ?：特殊控制
  
    ①start-end：为两个整数，数据占据的起始和终止位置（不足部分必须用空格补齐），没有这个参数时即使是字符型变量也不能有空格，但加了以后可以允许空格（这样空格可以当做缺省值）
  
    ②MMDDYY8.：表示月月天天年年总共8位输入
  
    p.s.1：当变量中有分号时用"cards4"代替"cards"，且DATALINES结束用连续四个分号标记
  
    p.s.2：缺省值用小数点"."表示
  
    p.s.3：日期型包括时间型数据在SAS中用数值型保存
  
  * 由程序输出提供：
  
  
          data FILENAME;
          CODEBLOCKS;
          output;
          CODEBLOCKS;
  

- 显示数据到结果窗口：

  
          proc print data=FILENAME; 
          [id IDNAME;]
          [format ......;]
          [var VARIABLENAME1 VARIABLENAME2;]
          run;
  
  
  
  id IDNAME：用"IDNAME"列替换默认的"obs"列作为标识列
  
  format VARIABLENAME L1.L2：指定输出列总长度为L1，其中小数部分占L2位

  format VARIABLENAME1 VARIABLENAME2：先输出VARIABLENAME1再输出VARIABLENAME2

  var VARIABLENAME1 VARIABLENAME2：指定输出变量列
  
- 修改数据集/复制数据集：


          data FILENAME1;
          set FILENAME2;
  
  
- 初始化数据集中某一列的值：

  ```retain VARIABLE1 VALUE1 VARIABLE2 VALUE2......```  
    
- 循环结构：

  ①do

  
          do VARIABLE=STARTVALUE to ENDVALUE by STEPLENGTH;
          CODE BLOCKS;
          end;


  ②do while
  
  
          do VARIABLE=STARTVALUE to ENDVALUE by STEPLENGTH while (BOOLEAN EXPRESSION);
          CODE BLOCKS;
          end;


  ③do until
  
  
          do VARIABLE=STARTVALUE to ENDVALUE by STEPLENGTH until (BOOLEAN EXPRESSION);
          CODE BLOCKS;
          end;


  do while和do until的区别在于前者先判断循环条件是否满足再进入循环，后者直接进入循环直到满足终止条件

- 分支结构：

  ①if
  
  
          if BOOLEAN EXPRESSION then
          CODEBLOCKS;
          [else CODEBLOCKS;]


  ②select
  
  
          select(VARIABLENAME);
          when(VALUE1) STATEMENT1;
          ......
          otherwise STATEMENT;
          end;
  
  
  VALUE1有多个时用逗号“,”分隔
  

          select;
          when(BOOLEAN EXPRESSION1) STATEMENT1;
          ......
          otherwise STATEMENT;
          end;


- goto：
  

          ......
          goto SIGNALNAME;
          ......
          SIGNALNAME: STATEMENT;
          ......
