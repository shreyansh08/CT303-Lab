clear all;
close all;
clc;

fs = 5000;
t1 = 1/50;
ts = 1/fs;
t = 0:ts:t1-ts;
mt = sin(2*pi*50*t);
stem(mt)