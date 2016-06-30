clear; clc;
fid=fopen('bou20130402vmin.min');
k = 1;
while 1
  tline = fgetl(fid);
  if ~ischar(tline)
    break;
  end
  if strmatch('2013-',tline)
    tline = regexprep(tline,'-',' ');
    tline = regexprep(tline,':',' ');
    A(k,:) = str2num(tline); 
    k = k+1;
  end
end
fclose(fid);

fid = fopen('BOUH_20130402.txt','w');
fprintf(fid, 'Year MO DY HR MN BOUH\n');
for i = 1:size(A,1)                                                               
  % Should be
  % fprintf(fid,'%d %02d %02d %02d %02d %.2f\n',A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,8));       
  % .02 does not make sense.  How do you zero pad the fractional part of a number on the left?
  fprintf(fid,'%d %02d %02d %02d %02d %.02f\n',A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,8));       
end
fclose(fid);
