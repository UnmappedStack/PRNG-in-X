#!/bin/bash

set -e

nasm -f elf64 main.asm -o out.o -g
gcc out.o -o out -no-pie

./out
