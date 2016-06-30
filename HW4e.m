tic
x = load('ascii.txt');
% Or, n = prod(size(x))
n = size(x,1)*size(x,2);
fprintf('The number of items is %d\n', n)
toc
