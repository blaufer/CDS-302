emp1 = (1,'Paul',32,'California',20000.00);
emp2 = (2,'Allen',25,'Texas',15000.00);
emp3 = (3, 'Teddy', 23, 'Norway', 20000.00 );
emp4 = (4, 'Mark', 25, 'Rich-Mond ', 65000.00 );
emp5 = (5, 'David', 27, 'Texas', 85000.00 );
emp6 = (6, 'Kim', 22, 'South-Hall', 45000.00 );

emps = [emp1,emp2,emp3,emp4,emp5,emp6]

import sqlite3
conn = sqlite3.connect('example.db')

c = conn.cursor()

c.execute('''CREATE TABLE COMPANY(ID,NAME,AGE,ADDRESS,SALARY)''')

for x in emps:
	c.execute("INSERT INTO COMPANY VALUES (x)")

conn.commit()

conn.close()