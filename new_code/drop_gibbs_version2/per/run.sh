#!/usr/bin/env bash 
taskset -c 40 python per.py twitter tp 0.0 ../output/K200_0 200 &
taskset -c 41 python per.py twitter tp 0.1 ../output/K200_01 200 &
taskset -c 42 python per.py twitter tp 0.2 ../output/K200_02 200 &
taskset -c 43 python per.py twitter tp 0.3 ../output/K200_03 200 &
taskset -c 44 python per.py twitter tp 0.4 ../output/K200_04 200 &
taskset -c 45 python per.py twitter tp 0.5 ../output/K200_05 200 &
taskset -c 46 python per.py twitter tp 0.6 ../output/K200_06 200 &
taskset -c 47 python per.py twitter tp 0.7 ../output/K200_07 200 &
taskset -c 48 python per.py twitter tp 0.8 ../output/K200_08 200 &
taskset -c 49 python per.py twitter tp 0.9 ../output/K200_09 200 &
wait

