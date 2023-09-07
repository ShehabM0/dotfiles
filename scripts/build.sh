#!/bin/bash
clear
g++ $1.cpp -o $1
echo "Compiled and running..."
./$1
