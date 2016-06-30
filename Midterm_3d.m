clear; clc;

fid = fopen('BOUH_20130402-20130410.txt');
tline = fgetl(fid);
k = 1;
k = 1;
while 1
  tline = fgetl(fid);
  if ~ischar(tline),break,end
  A(k,:) = str2num(tline);
  k = k+1;
end
fclose(fid);                                                                 

fid2 = fopen('BOUH_20130402-20130410.bin','wb');
% Even though you said 'wb', MATLAB wrote an ASCII file.  Take a look at the file created.
for i = 1:size(A,1)
    fprintf(fid2,'%d %d %d %d %d %d\n',A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,6));
end
fclose(fid2);
