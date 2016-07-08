#coding=utf-8
import re

file = open(u'd:/采集/douban.html','r+')
str = file.read()

pattern = re.compile('title="(.*?)"',re.S)
content = re.findall(pattern,str)
for item in content:
	print item.decode('utf-8').encode('gbk')