# Works with UXTerm
# UXTerm is only a GUI for a shell.  Should really say "works with Bash".  Note mkdir -p /tmp/A/B/C/D creates directories as needed ;).
mkdir ./tmp/A; mkdir ./tmp/A/B; mkdir ./tmp/A/B/C; mkdir ./tmp/A/B/C/D;
touch ./tmp/A/B/C/D/a.txt
cp ./tmp/A/B/C/D/a.txt ./tmp/A/B/b.txt
