#!/usr/bin/env bash
taskset -c 50 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_00 &
taskset -c 51 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_01 &
taskset -c 52 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_02 &
taskset -c 53 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_03 &
taskset -c 54 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_04 &
taskset -c 55 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_05 &
taskset -c 56 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_06 &
taskset -c 57 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_07 &
taskset -c 58 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_08 &
taskset -c 59 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/200_09 &
taskset -c 60 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_00 &
taskset -c 40 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_01 &
taskset -c 41 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_02 &
taskset -c 42 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_03 &
taskset -c 43 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_04 &
taskset -c 44 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_05 &
taskset -c 45 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_06 &
taskset -c 46 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_07 &
taskset -c 47 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_08 &
taskset -c 48 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/100_09 &
taskset -c 49 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_00 &
taskset -c 30 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_01 &
taskset -c 31 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_02 &
taskset -c 32 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_03 &
taskset -c 33 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_04 &
taskset -c 34 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_05 &
taskset -c 35 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_06 &
taskset -c 36 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_07 &
taskset -c 37 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_08 &
taskset -c 38 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/150_09 &
taskset -c 39 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_00 &
taskset -c 20 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_01 &
taskset -c 21 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_02 &
taskset -c 22 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_03 &
taskset -c 23 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_04 &
taskset -c 24 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_05 &
taskset -c 25 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_06 &
taskset -c 26 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_07 &
taskset -c 27 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_08 &
taskset -c 28 python NPMI.py ../dataset/yahoo/yahoo.txt.sf ../dataset/yahoo/models/50_09 &
wait
