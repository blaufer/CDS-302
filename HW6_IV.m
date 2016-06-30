clc; clear;

dno = datenum(2014,1,1);
fid = fopen('solar2.sh','w');

fprintf(fid,'montage -tile +10+1 ');

for i = dno:dno+9
  dvo = datevec(i); 
  if i == dno+7
    fprintf(fid,'null: ');
  else
    fprintf(fid,'%d%02d%02d_1930_hmiigr_512.jpg ',dvo(1),dvo(2),dvo(3));
  end
end

fprintf(fid,'solar2.jpg');

fclose(fid);