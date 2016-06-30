fid = fopen('HW5.txt','w');
fprintf(fid,'%d-%02d-%02d,%02d,%02d:%05.3f,%d,%.2f,%.2f,%.2f,%.2f\n',x');
fclose(fid);

FILENAME = 'ABCDEF';
if ~isempty(regexp(FILENAME,'ABC'))
    fprintf('%s matches pattern\n',FILENAME);
else
    fprintf('%s does not match pattern\n',FILENAME);    
end