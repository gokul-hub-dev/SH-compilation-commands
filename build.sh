#!/bin/bash

echo "starting..."

build_o()
{
echo "building object file.."
gcc -c call_func.c -o call_func.o
gcc -c main.c -o main.o
gcc call_func.o main.o -o exe
}


build(){
#Preprocessing -> handling macro like #define,#ifdef and more.
#remove comment lines and bring as a c code
cpp call_func.c call_func.i
cpp main.c main.i

#compilation -> preprocessed C code into assembly language code.
gcc -S call_func.i -o call_func.s
gcc -S main.i -o main.s

#Assembly -> is a low-level representation of your code that is specific to the target architecture. It's still not directly executable.
# "as" like assembler
as call_func.s -o call_func.o
as main.s -o main.o

#linking -> object files are combined to create a complete executable program
gcc call_func.o main.o -o exe
ls -lrt
}

clean(){
echo "cleaning..."
find . -iname "*.i" -type f -delete
find . -iname "*.s" -type f -delete
find . -iname "*.o" -type f -delete
rm exe
ls
}

rebuild(){
echo "cleaning..."
find . -iname "*.i" -type f -delete
find . -iname "*.s" -type f -delete
find . -iname "*.o" -type f -delete
rm exe

echo "rebuilding..."
cpp call_func.c call_func.i
cpp main.c main.i
gcc -S call_func.i -o call_func.s
gcc -S main.i -o main.s
as call_func.s -o call_func.o
as main.s -o main.o
gcc call_func.o main.o -o exe
ls -lrt
}

if [ "$1" == "build" ]; then
    echo "called function --> $1"
    build
elif [ "$1" == "build_o" ]; then
    echo "called function --> $1"
    build_o
elif [ "$1" == "rebuild" ]; then
    echo "called function --> $1"
    rebuild
elif [ "$1" == "clean" ]; then
    echo "called function --> $1"
    clean
fi
