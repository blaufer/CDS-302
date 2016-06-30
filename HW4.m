clear;                                                                          

N = 2^16;
A = [0:N-1]';
                                                                                
fprintf('\nMethod\t\t\t\t\t Time [s]\tSize [Bytes]\n');
fprintf('--------------------------------------------------------------------\n');

tic(); % Start timer
save -ascii f1.txt A                                                  
ts = toc(); % Stop timer
stats = dir('f1.txt');                                                        
fprintf('Write f1.txt using save -ascii\t\t %.6f\t%d\n',ts,stats.bytes);

tic();                                                                          
fid = fopen('f2.txt','w');
fprintf(fid,'%d\n',A);
ts = toc();
fclose(fid);
stats = dir('f2.txt');
fprintf('Write f2.txt using fprintf\t\t %.6f\t%d\n',ts,stats.bytes);

tic();                                                                          
fid = fopen('f3.txt','w');
for i = 1:length(A)
    fprintf(fid,'%d\n',A(i));
end
fclose(fid);
ts = toc();
stats = dir('f3.txt');
fprintf('Write f3.txt using fprintf w/loop\t %.6f\t%d\n',ts,stats.bytes);

if (N <= 2^16);
  tic();                                                                          
  fid = fopen('f1.bin','wb');                                                   
  fwrite(fid,A,'uint16');                                                         
  fclose(fid);                                                                    
  ts = toc();                                                                    
  stats = dir('f1.bin');
  fprintf('Write f1.bin (uint16)\t\t\t %.6f\t%d\n',ts,stats.bytes);

  A16 = uint16(A);
  tic();                                                                          
  fid = fopen('f1.bin','wb');                                                   
  fwrite(fid,A16,'uint16');                                                         
  fclose(fid);                                                                    
  ts = toc();                                                                    
  stats = dir('f1.bin');
  fprintf('Write f1.bin (uint16); cast before\t %.6f\t%d\n',ts,stats.bytes);
end

if (N <= 2^32)
  tic();                                                                          
  fid = fopen('f2.bin','wb');                                                   
  fwrite(fid,A,'uint32');                                                         
  fclose(fid);                                                                    
  ts = toc();                                                                    
  stats = dir('f2.bin');
  fprintf('Write f2.bin (uint32)\t\t\t %.6f\t%d\n',ts,stats.bytes);

  A32 = uint32(A);
  tic();
  fid = fopen('f2.bin','wb');
  fwrite(fid,A32,'uint32');
  fclose(fid);
  ts = toc();
  stats = dir('f2.bin');
  fprintf('Write f2.bin (uint32); cast before\t %.6f\t%d\n',ts,stats.bytes);
end

tic();                                                                          
fid = fopen('f3.bin','wb');                                                   
fwrite(fid,A,'uint64');                                                         
fclose(fid);                                                                    
ts = toc();                                                                    
stats = dir('f3.bin');
fprintf('Write f3.bin (uint64)\t\t\t %.6f\t%d\n',ts,stats.bytes);

A64 = uint64(A);
tic();                                                                          
fid = fopen('f3.bin','wb');                                                   
fwrite(fid,A64,'uint64');                                                         
fclose(fid);                                                                    
ts = toc();                                                                    
stats = dir('f3.bin');
fprintf('Write f3.bin (uint64); cast before\t %.6f\t%d\n',ts,stats.bytes);

tic();
fid = fopen('f4.bin','wb');
fwrite(fid,A,'single');
fclose(fid);
ts = toc();
stats = dir('f4.bin');
fprintf('Write f4.bin (single)\t\t\t %.6f\t%d\n',ts,stats.bytes);

ASINGLE = single(A);
tic();
fid = fopen('f4.bin','wb');
fwrite(fid,ASINGLE,'single');
fclose(fid);
ts = toc();
stats = dir('f4.bin');
fprintf('Write f4.bin (single); cast before\t %.6f\t%d\n',ts,stats.bytes);

tic();
fid = fopen('f5.bin','wb');
fwrite(fid,A,'double');
fclose(fid);
t = toc();
stats = dir('f5.bin');
fprintf('Write f5.bin (double)\t\t\t %.6f\t%d\n',ts,stats.bytes);

if exist('HW4.c')
  system('gcc HW4.c -o HW4');
  [s,result] = system('./HW4');
  R = textscan(result,'%s%s%s%s%s','delimiter',',');

  if (N <= 2^16)
    stats = dir('f1c.bin');
    fprintf('Write f1c.bin (uint short) in c\t\t %.6f\t%d\n',str2num(R{1}{1}),stats.bytes);
  end
  if (N <= 2^32)
    stats = dir('f2c.bin');
    fprintf('Write f2c.bin (uint) in c\t\t %.6f\t%d\n',str2num(R{2}{1}),stats.bytes);
  end
  stats = dir('f3c.bin');
  fprintf('Write f3c.bin (uint long) in c\t\t %.6f\t%d\n',str2num(R{3}{1}),stats.bytes);
  stats = dir('f4c.bin');
  fprintf('Write f4c.bin (float) in c\t\t %.6f\t%d\n',str2num(R{4}{1}),stats.bytes);
  stats = dir('f5c.bin');
  fprintf('Write f5c.bin (double) in c\t\t %.6f\t%d\n',str2num(R{5}{1}),stats.bytes);
end

tic();
fid = fopen('numbers.sqlite3','w');
fprintf(fid,'PRAGMA foreign_keys=OFF;\n');
fprintf(fid,'BEGIN TRANSACTION;\n');
fprintf(fid,'CREATE TABLE NUMBERS(ID INT PRIMARY KEY);');
fprintf(fid,'INSERT INTO "NUMBERS" VALUES(%d);\n',A);
fprintf(fid,'COMMIT;\n');
fclose(fid) ;
ts = toc();
fprintf('Create numbers.sqlite3\t\t\t %.6f\t%d\n',ts,stats.bytes);

system('rm -f numbers.db');
tic();
system('sqlite3 numbers.db < numbers.sqlite3');
tsql = toc();
stats = dir('numbers.db');
fprintf('Create numbers.db\t\t\t %.6f\t%d\n',ts,stats.bytes);

if (0) % Too slow to not use BEGIN TRANSACTION/COMMIT;
tic();
fid = fopen('numbers2.sqlite3','w');
fprintf(fid,'PRAGMA foreign_keys=OFF;\n');
fprintf(fid,'CREATE TABLE NUMBERS(ID INT PRIMARY KEY);');
fprintf(fid,'INSERT INTO "NUMBERS" VALUES(%d);\n',A);
fclose(fid) ;
ts = toc();
fprintf('Create numbers2.sqlite3\t\t\t %.6f\t%d\n',ts,stats.bytes);

system('rm -f numbers2.db');
tic();
system('sqlite3 numbers2.db < numbers2.sqlite3');
tsql = toc();
stats = dir('numbers.db');
fprintf('Create numbers2.db\t\t\t %.6f\t%d\n',ts,stats.bytes);
end

fprintf('\n');
fprintf('\nMethod\t\t\t\t\t Time [s]\tSize [#]\n');
fprintf('--------------------------------------------------------------------\n');

tic();
[a,result] = system('wc -l f1.txt | cut -d" " -f1');
ts = toc();
fprintf('Count # of lines in f1.txt w/wc\t\t %.6f\t%d\n',ts,str2num(result));

tic();
load f1.txt
lf1 = length(f1);
ts = toc();
fprintf('Count # in f1.txt w/load\t\t %.6f\t%d\n',ts,lf1);

tic();
fid = fopen('f2.txt');
A = fscanf(fid,'%d\n');
lf1 = length(A);
fclose(fid);
ts = toc();
fprintf('Count # in f2.txt w/fscanf\t\t %.6f\t%d\n',ts,lf1);

clear A
tic();
fid = fopen('f3.txt','r');
i = 1;
while 1
    [a,cnt] = fscanf(fid,'%d',1);
    if (cnt == 0)
        break;
    end
    A(i) = a;
    i = i+1;
end
fclose(fid);
lf1 = length(A);
ts = toc();
fprintf('Count # in f3.txt w/fscanf/loop\t\t %.6f\t%d\n',ts,lf1);

A = zeros(N,1);
tic();
fid = fopen('f3.txt','r');
i = 1;
while 1
    [a,cnt] = fscanf(fid,'%d',1);
    if (cnt == 0)
        break;
    end
    A(i) = a;
    i = i+1;
end
fclose(fid);
lf1 = length(A);
ts = toc();
fprintf('Count # in f3.txt w/fscanf/loop/prealloc %.6f\t%d\n',ts,lf1);

if (N <= 2^16)
  tic();
  fid = fopen('f1.bin','r');
  A = fread(fid,Inf,'uint16');
  fclose(fid);
  lf1 = length(A);
  ts = toc();
  fprintf('Count # in f1.bin w/fread\t\t %.6f\t%d\n',ts,lf1);
end

if (N <= 2^32)
  tic();
  fid = fopen('f2.bin','r');
  A = fread(fid,Inf,'uint32');
  fclose(fid);
  lf1 = length(A);
  ts = toc();
  fprintf('Count # in f2.bin w/fread\t\t %.6f\t%d\n',ts,lf1);
end

tic();
fid = fopen('f3.bin','r');
A = fread(fid,Inf,'uint64');
fclose(fid);
lf1 = length(A);
ts = toc();
fprintf('Count # in f3.bin w/fread\t\t %.6f\t%d\n',ts,lf1);

tic();
fid = fopen('f4.bin','r');
A = fread(fid,Inf,'single');
fclose(fid);
lf1 = length(A);
ts = toc();
fprintf('Count # in f4.bin w/fread\t\t %.6f\t%d\n',ts,lf1);

tic();
fid = fopen('f5.bin','r');
A = fread(fid,Inf,'double');
fclose(fid);
lf1 = length(A);
ts = toc();
fprintf('Count # in f5.bin w/fread\t\t %.6f\t%d\n',ts,lf1);

tic();
[a,result] = system('sqlite3 numbers.db "SELECT COUNT(ID) from NUMBERS"');
ts = toc();
fprintf('Count # in numbers.db w/SELECT\t\t %.6f\t%d\n',ts,str2num(result));

if exist('numbers2.db')
    tic();
    [a,result] = system('sqlite3 numbers2.db "SELECT COUNT(ID) from NUMBERS"');
    ts = toc();
    fprintf('Count # in numbers2.db w/SELECT\t\t %.6f\t%d\n',ts,str2num(result));
end

delete('f1.txt');
delete('f2.txt');
delete('f3.txt');

delete('f1.bin');
delete('f2.bin');
delete('f3.bin');
delete('f4.bin');
delete('f5.bin');

delete('numbers.sqlite3');
delete('numbers.db');

if exist('numbers2.sqlite3'),delete('numbers2.sqlite3'),end
if exist('numbers2.db'),delete('numbers2.db'),end

if exist('f1c.bin'),delete('f1c.bin'),end
if exist('f2c.bin'),delete('f2c.bin'),end
if exist('f3c.bin'),delete('f3c.bin'),end
if exist('f4c.bin'),delete('f4c.bin'),end
if exist('f5c.bin'),delete('f5c.bin'),end