#!/usr/bin/python
# -*- coding: UTF-8 -*-

## infomation
## version 0.2
## This python script used to handle the csv file, revise the address to a short fomat. script version 1.00, format and args is changeless
import sys, getopt
import os
import csv
import re

def main(argv):
   inputfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["input=","output="])
   except getopt.GetoptError:
      print ('test.py -i <inputfile> -o <outputfile>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print ('test.py -i <inputfile> -o <outputfile>')
         sys.exit()
      elif opt in ("-i", "--input"):
         inputfile = arg
      elif opt in ("-o", "--output"):
         outputfile = arg



##定义列表查找字符串比较函数
def findStr(alist,astr):
    for substr in alist:
        if(re.search(substr,astr)):
            return (substr+'\n')

    return astr
    
## 定义列表
basestr=['毛庄行政村','毛寨行政村','赵楼行政村','付楼行政村','高小庙行政村','卢寨行政村','王拱行政村','刘营行政村','徐庄行政村','大王庄行政村','朱楼行政村','谢庄行政村','王大庄行政村','从楼行政村','崔堂行政村','李楼行政村','李黄楼行政村','杨庙行政村','大刘庄行政村','大郭庄行政村','洼吴行政村','张白庄行政村','薛庄行政村','陶店行政村','丁村行政村','毛庄行政村','毛寨行政村','赵楼行政村','付楼行政村','高小庙行政村','卢寨行政村','王拱行政村','刘营行政村','徐庄行政村','大王庄行政村','朱楼行政村','谢庄行政村','王大庄行政村','从楼行政村','崔堂行政村','李楼行政村','李黄楼行政村','杨庙行政村','大刘庄行政村','大郭庄行政村','洼吴行政村','张白庄行政村','薛庄行政村','陶店行政村','丁村行政村']
list=[]
## 从文件中取出一行  
##如果不是二进制形式打开文件，encoding='unicode_escape'
csvFile=open(inputfile,mode="r",encoding='gbk')
reader=csv.reader(csvFile)
for item in reader:  
    if(item != None):
        addr=findStr(basestr,item[14])
        item[14]=addr
        list.append(item)
    else:
        continue

csvFile2=open(outputfile,mode="w",newline='')
writer=csv.writer(csvFile2)
for index in list:
    writer.writerow(index)
## 退出
csvFile2.flush()
csvFile2.close()
csvFile.close()


if __name__ == "__main__":
   main(sys.argv[1:])
