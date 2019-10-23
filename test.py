#!/usr/bin/python3
# -*- coding: utf-8 -*-

import csv
import sys,getopt
import os
import re


def main(argv):
	inputfile = ''
	comparefile = ''
	outputfile = ''
	try:
		opts, args=getopt.getopt(argv,"hi:o:c:",["input=","output=","compare="])
	except getopt.GetoptError:
		print(1)
		print ('test.py -i <inputfile>  -o <outputfile>  -c <comparefile>')
		sys.exit(2)
	for opt, arg in opts:
		if opt ==  '-h':
			print ('test.py -i <inputfile> -o <outputfile>  -c <comparefile>')
			sys.exit()
		elif opt in ("-i", "--input"):
			inputfile = arg
		elif opt in ("-o", "--output"):
			outputfile = arg
		elif opt in ("-c", "--comare"):
			comparefile = arg
	if(inputfile != None):
		csv1=open(inputfile,mode="r",encoding="utf-8")
		reader=csv.reader(csv1)
	if(outputfile != None):
		csv2=open(outputfile,mode="w",encoding="utf-8")
		writer=csv.writer(csv2)
	if(comparefile != None):
		csv3=open(comparefile,mode="r",encoding="utf-8")
		reader2=csv.reader(csv3)
	
	for line in reader:
			for row in reader2:
			if(line[1] == row[5]):
				line.append(row[13])
				line.append(row[14])
				line.append(row[15])
				writer.writerow(line)
	csv1.close()
	csv2.flush()
	csv2.close()
	csv3.close()

if __name__ == "__main__":
   main(sys.argv[1:])
