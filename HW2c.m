fid = fopen('matlabsql.sql','w');
fprintf(fid,'PRAGMA foreign_keys=OFF;\n');
fprintf(fid,'BEGIN TRANSACTION;\n');
fprintf(fid,'CREATE TABLE NUMBERS(\n');
fprintf(fid,'ID INT PRIMARY KEY NOT NULL,\n');
fprintf(fid,'ID2 INT NOT NULL);\n');

for x = 1:500
    fprintf(fid,'INSERT INTO "NUMBERS" VALUES(%d,%d);\n',x,501 - x);
end

fprintf(fid,'COMMIT;\n');
fclose(fid);