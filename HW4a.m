clc; clear;

tic
x = rand(1000,1000);

save -ascii -double ascii.txt x;
toc
