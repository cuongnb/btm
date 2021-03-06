# -*- coding: utf-8 -*-
"""
Created on Mon May 11 16:10:03 2015

@author: dhbk
"""
import sys

def count_voca(fp):
    count = 0
    while True:
        line = fp.readline()
        # check end of file
        if len(line) < 1:
            break
        count += 1           
    return(count)

def main():
    # check
    if len(sys.argv) != 3:
        print'usage: python count_voca.py [voca file] [count file]'
        exit()
    voca_file_name = sys.argv[1]
    count_file_name = sys.argv[2]
    # 
    fp = open(voca_file_name, 'r')
    count = count_voca(fp)
    fp.close()
    #
    fp = open(count_file_name, 'w')
    fp.write('voca_count: %d' % (count))
    fp.close()
if __name__ == '__main__':
    main()
