clear; clc;

tic();                                                                          
[s,result] = system('python HW5_extracredit_txt.py');
R = textscan(result,'%s%s%s%s%s','delimiter',',');                                                                    
ts = toc();                                                                    
stats = dir('f1p.txt');
fprintf('Write f1p.txt\t\t\t %.6f\t%d\n',ts,stats.bytes);

tic();                                                                          
[s,result] = system('python HW5_extracredit_bin.py');
R = textscan(result,'%s%s%s%s%s','delimiter',',');                                                                    
ts = toc();                                    
stats = dir('f2p.bin');
fprintf('Write f2p.bin (uint16)\t\t\t %.6f\t%d\n',ts,stats.bytes);

if exist('f1p.txt'),delete('f1p.txt'),end
if exist('f2p.bin'),delete('f2p.bin'),end