tic
fid = fopen('binary.bin');
x = fread(fid);
fclose(fid);
n = size(x,1);
fprintf('The number of items is %d\n', n)
toc
