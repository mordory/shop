#!/usr/bin/python
#-*- coding: utf-8 -*-
import os
import csv
import re

##定义列表查找字符串比较函数
def findStr(alist,astr):
    for substr in alist:
        if(re.search(substr,astr)):
            return (substr+'\n')

    return astr
    
## 定义列表
basestr=['毛庄行政村','毛寨行政村','赵楼行政村','付楼行政村','高小庙行政村','卢寨行政村','王拱行政村','刘营行政村','徐庄行政村','大王庄行政村','朱楼行政村','谢庄行政村','王大庄行政村','从楼行政村','崔堂行政村','李楼行政村','李黄楼行政村','杨庙行政村','大刘庄行政村','大郭庄行政村','洼吴行政村','张白庄行政村','薛庄行政村','陶店行政村','丁村行政村','毛庄行政村','毛寨行政村','赵楼行政村','付楼行政村','高小庙行政村','卢寨行政村','王拱行政村','刘营行政村','徐庄行政村','大王庄行政村','朱楼行政村','谢庄行政村','王大庄行政村','从楼行政村','崔堂行政村','李楼行政村','李黄楼行政村','杨庙行政村','大刘庄行政村','大郭庄行政村','洼吴行政村','张白庄行政村','薛庄行政村','陶店行政村','丁村行政村']
## 从文件中取出一行
revise=open("revise.txt",mode="a+",encoding="utf-8")
origin=open('test.txt',mode='r',encoding='utf-8')
done = 0
## 遍历字符串数组
while not done:
    line=origin.readline()
## 如果文件行内包含的字符串在数组内，则替换该行
    if(line=='\n'):
        revise.write('\n')       
##写入文件
    elif(line != ''):
        revise.write(findStr(basestr,line))
    else:
        done = 1
## 退出
revise.flush()
revise.close()
origin.close()
