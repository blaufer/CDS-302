clc; clear;

dno = datenum(2014,1,1);
fid = fopen('solar.sh','w');

for i = dno:dno+9
  dvo = datevec(i); 
  fprintf(fid,'curl -O http://sohowww.nascom.nasa.gov//data/REPROCESSING/Completed//2014/hmiigr/%d%02d%02d/',dvo(1),dvo(2),dvo(3));
  fprintf(fid,'%d%02d%02d_1930_hmiigr_512.jpg\n',dvo(1),dvo(2),dvo(3));
end

fclose(fid);