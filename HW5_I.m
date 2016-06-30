clc; clear;
% 10/10
% See solutions for alternatives
% http://bobweigel.net/cds302/index.php?title=HW5
%I used a, b, c, and d for each section.

a = '1000,100,10,1,X';
a = regexprep(a,'X','-1');
an = str2num(a)

b = '### 1000,100,10,1 ZZZ';
b = regexprep(b,'#','');
b = regexprep(b,'Z','');
b = regexprep(b,' ','');
bn = str2num(b)

c = '### 1000,100,10,1 ###';
c = regexprep(c,'#','');
c = regexprep(c,' ','');
cn = str2num(c)

d = '### 1000,100,10,1 xxx';
d = regexprep(d,'#','');
d = regexprep(d,'x','');
d = regexprep(d,' ','');
dn = str2num(d)
