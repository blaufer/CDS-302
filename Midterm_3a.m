% This should be a program that modifies bou_r.htm
clear; clc;
fid=fopen('bou-all.txt');
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

X = [];
for i = 1:size(A)
    X(i) = A(i,4)/360 + A(i,5)/60 + A(i,6);
end

Y = A(:,8)';

Y(Y==99999) = NaN;

plot(X,Y)
