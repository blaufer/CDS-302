clc; clear;
% Answer accepted
dno = datenum(2014,1,1);
fid = fopen('solar3.sh','w');

for i = dno:dno+350
  dvo = datevec(i); 
  fprintf(fid,'curl -O http://sohowww.nascom.nasa.gov//data/REPROCESSING/Completed//2014/hmiigr/%d%02d%02d/',dvo(1),dvo(2),dvo(3));
  fprintf(fid,'%d%02d%02d_1930_hmiigr_512.jpg\n',dvo(1),dvo(2),dvo(3));
end

fprintf(fid,'montage -tile +27+13 ');

for i = dno:dno+350
  dvo = datevec(i); 
  % OK, but see solutions for a better way as discussed.
  if i == (dno+7 | dno+14 | dno+27 | dno+28 | dno+91 | dno+136 | dno+203 | dno+231 | dno+252 | dno+257 | dno+280 | dno+309 | dno+315 | dno+337)
    fprintf(fid,'null: ');
  else
    fprintf(fid,'%d%02d%02d_1930_hmiigr_512.jpg ',dvo(1),dvo(2),dvo(3));
  end
end

fprintf(fid,'solar3.jpg');

fclose(fid);
