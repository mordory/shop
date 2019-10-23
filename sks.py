#!/usr/bin/python3
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
   comparefile = ''
   try:
	opts, args = getopt.getopt(argv,"hi:o:c:",["input=","output=","compare="])
   except getopt.GetoptError:
	print ('test.py -i <inputfile> -o <outputfile> -c <comparefile>')
	sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
	   print ('test.py -i <inputfile> -o <outputfile> -c <compaerfile>')
	   sys.exit()
      elif opt in ("-i", "--input"):
	   inputfile = arg
      elif opt in ("-o", "--output"):
	   outputfile = arg
	elif opt in ("-c", "--compare"):
	   comparefile = arg
   print(inputfile,outputfile,comparefile)

    
   list=[]
## 从文件中取出一行  
##如果不是二进制形式打开文件，encoding='unicode_escape'
   if(inputfile != None ):
	csvFile=open(inputfile,mode="r",encoding='utf-8')
	reader=csv.reader(csvFile)
   if(outputfile != None):
	csvFile2=open(outputfile,mode="w",newline='')
	writer=csv.writer(csvFile2)
   if(comparefile != None):
	comFile=open(comparefile,mode="r",encoding='utf-8')
	reader1=csv.reader(comFile)
## 退出
   csvFile2.flush()
   csvFile2.close()
   comFile.close()
   csvFile.close()


if __name__ == "__main__":
   main(sys.argv[1:])
