clc; clear;

% This writes 10^6 values.
tic
x = rand(1000,1000);

fid = fopen('binary.bin', 'wb');
fwrite(fid, x, 'double');
fclose(fid);
toc
