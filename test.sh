#!/bin/bash

assert(){
  expected="$1"
  input="$2"

  make clean
  make ARG="$input"
  ./target
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert  0  0
assert 42 42

make clean
echo OK
