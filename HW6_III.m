clc; clear;

dno = datenum(2014,1,1);
fid = fopen('HW6_III.sh','w');

fprintf(fid,'montage -tile +10+1 ');

for i = dno:dno+9
  dvo = datevec(i); 
  fprintf(fid,'%d%02d%02d_1930_hmiigr_512.jpg ',dvo(1),dvo(2),dvo(3));
end

fprintf(fid,'solar2.jpg');

fclose(fid);