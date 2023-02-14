-- Object Files
data-object-atXXXX.bin

Read by LoadEnemyBatch()

byte order to variable conversion:
00	01	02	03	04
58	54	55	56	57
X		Y

exemple (data-object-ACB8.bin)
58	54	55	56	57
00	3C	01	BE	00
01	0A	01	64	00
02	00	01	46	00
0A	64	01	78	00
0B	5A	01	96	00
03	6E	01	78	00
03	60	01	64	00
03	78	01	54	00
FF

for each one above there's a data-10bytes file:
02	70	10	0B	02	1F	01	05	0A	00