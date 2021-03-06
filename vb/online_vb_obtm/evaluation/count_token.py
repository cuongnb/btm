# -*- coding: utf-8 -*-
"""
Created on Mon May 11 15:48:43 2015

@author: dhbk
"""
import string, sys

def count_token(fp):
    token = 0
    doc = 0
    while True:
        line = fp.readline()
        doc += 1
        if doc % 10000 == 0:
            print doc
        # check end of file
        if len(line) < 5:
            break
        tokens = string.split(line)
        counts = int(tokens[0]) + 1
        for j in range(1, counts):
            token_count = tokens[j].split(':')
            token += int(token_count[1])           
    return(token)

def main():
    # check
    if len(sys.argv) != 3:
        print'usage: python count_token.py [data file] [token file]'
        exit()
    data_file_name = sys.argv[1]
    token_file_name = sys.argv[2]
    # 
    fp = open(data_file_name, 'r')
    token = count_token(fp)
    fp.close()
    #
    fp = open(token_file_name, 'w')
    fp.write('token_count: %d' % (token))
    fp.close()
if __name__ == '__main__':
    main()
