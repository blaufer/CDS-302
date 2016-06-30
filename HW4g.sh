time sqlite3 random.db "select * from Time;" | wc
# (need wc to count the number of lines)
# Or
time sqlite3 random.db "select COUNT(*) from Time;"
