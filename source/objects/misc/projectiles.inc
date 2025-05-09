; 8 Directional Projectile Trajectories Table
;
;					\     7 | 3     /
;			  	 	  \		|	  /
;				    6   \	|	/  2
;					----- Enemy ------
;			  	    4	/	|	\  0
;			  		  /		|	  \
;					/     5	| 1	    \
;
;
; octant 6
; font-up
; offsets 00 01 02 03 04
.addr Data_at8F36, Data_at8F3F, Data_at8F4A, Data_at8F55, Data_at8F5F

; octant 4
; front-down
; offsets 05 06 07 08 09
.addr Data_at8F69, Data_at8F72, Data_at8F7D, Data_at8F88, Data_at8F92

; octant 2
; back-up
; offsets 0A 0B 0C 0D 0E
.addr Data_at8F97, Data_at8FA0, Data_at8FAB, Data_at8FB6, Data_at8FC0

; octant 0
; back-down
; offsets 0F 10 11 12 13
.addr Data_at8FC5, Data_at8FCE, Data_at8FD9, Data_at8FE4, Data_at8FEE

; octant 7
; top-front
; offsets 14 15 16 17 18
.addr Data_at8FF3, Data_at8FFC, Data_at9007, Data_at9012, Data_at901C

; octant 3
; top-back
; offsets 19 1A 1B 1C 1D
.addr Data_at9021, Data_at902A, Data_at9035, Data_at9040, Data_at904A

; octant 5
; bottom-front
; offsets 1E 1F 20 21 22
.addr Data_at904F, Data_at9058, Data_at9063, Data_at906E, Data_at9078

; octant 1
; bottom-back
; offsets 23 24 25 26 27
.addr Data_at907D, Data_at9086, Data_at9091, Data_at909C, Data_at90A6


; >> Boss sparks fanning out

; three angles upwards: 90 60 and 30
; offsets 28 29 2A
.addr Data_at90AB, Data_at90B5, Data_at90BF

; central one goes spiralling
; offsets 2B
.addr Data_at90C9

; three angles downwards: 30 60 and 90
; offsets 2C 2D 2E
.addr Data_at9104, Data_at910E, Data_at9118


; >> Boss 3 comets fanning out

; up 30 degrees, horizontal, down 30 degrees
; offsets 2F 30 31
.addr Data_at9122, Data_at9128, Data_at9131


; >> Boss 2 ambers + 3 comets fanning out

; up 60 and 30 degrees, horizontal, down 30 and 60 degrees
; offsets 32 33 34 35 36
.addr Data_at9137, Data_at913D, Data_at9143, Data_at914C, Data_at9152


; >> Boss 5 spiralling ambers fanning out

; up-up, up-front, front, down-front, down-down
; offsets 37, 38, 39, 3A, 3B
.addr Data_at9158, Data_at9193, Data_at91CE, Data_at9209, Data_at9244

; =====================================================
; Regular enemies' projectiles' paths
; =====================================================

; ===== 8 directional bubble shots ====================

; octant 6 (font-up)

; offset 00
Data_at8F36:
.byte afBUBBLE, -2, -2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 01
Data_at8F3F:
.byte afBUBBLE, -1, -1
.byte acLOOPN+2, 0
.byte afBUBBLE, -1,  0, acTIMER+1
.byte acLOOPBACK, 0

; offset 02
Data_at8F4A:
.byte afBUBBLE, -2, -1, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 03
Data_at8F55:
.byte afBUBBLE, -1,  0
.byte acLOOPN+2, 0
.byte afBUBBLE, -1, -1
.byte acLOOPBACK, 0

; offset 04 (straight front)
Data_at8F5F:
.byte afBUBBLE, -1,  0
.byte acLOOPN+16, 0
.byte afBUBBLE, -2,  0
.byte acLOOPBACK, 0

; octant 4 (font-down)

; offset 05
Data_at8F69:
.byte afBUBBLE, -2,  2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 06
Data_at8F72:
.byte afBUBBLE, -1,  1
.byte acLOOPN+2, 0
.byte afBUBBLE, -1,  0, acTIMER+1
.byte acLOOPBACK, 0

; offset 07
Data_at8F7D:
.byte afBUBBLE, -2,  1, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 08
Data_at8F88:
.byte afBUBBLE, -1,  0
.byte acLOOPN+2, 0
.byte afBUBBLE, -1,  1
.byte acLOOPBACK, 0

; offset 09 (straight front)
Data_at8F92:
.byte afBUBBLE, -1,  0
.byte acLOOPBACK, 0


; octant 2 (back-up)

; offset 0A
Data_at8F97:
.byte afBUBBLE,  2, -2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 0B
Data_at8FA0:
.byte afBUBBLE,  1, -1
.byte acLOOPN+2, 0
.byte afBUBBLE,  1,  0, acTIMER+1
.byte acLOOPBACK, 0

; offset 0C
Data_at8FAB:
.byte afBUBBLE,  2, -1, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 0D
Data_at8FB6:
.byte afBUBBLE,  1,  0
.byte acLOOPN+2, 0
.byte afBUBBLE,  1, -1
.byte acLOOPBACK, 0

; offset 0E (straight back)
Data_at8FC0:
.byte afBUBBLE,  1,  0
.byte acLOOPBACK, 0


; octant 0 (back-down)

; offset 0F
Data_at8FC5:
.byte afBUBBLE,  2,  2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 10
Data_at8FCE:
.byte afBUBBLE,  1,  1
.byte acLOOPN+2, 0
.byte afBUBBLE,  1,  0, acTIMER+1
.byte acLOOPBACK, 0

; offset 11
Data_at8FD9:
.byte afBUBBLE,  2,  1, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 12
Data_at8FE4:
.byte afBUBBLE,  1,  0
.byte acLOOPN+2, 0
.byte afBUBBLE,  1,  1
.byte acLOOPBACK, 0

; offset 13 (straight back)
Data_at8FEE:
.byte afBUBBLE,  1,  0
.byte acLOOPBACK, 0


; octant 7 (top-front)

; offset 14
Data_at8FF3:
.byte afBUBBLE, -2, -2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 15
Data_at8FFC:
.byte afBUBBLE, -1, -1
.byte acLOOPN+2, 0
.byte afBUBBLE,  0, -1, acTIMER+1
.byte acLOOPBACK, 0

; offset 16
Data_at9007:
.byte afBUBBLE, -1, -2, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 17
Data_at9012:
.byte afBUBBLE,  0, -1
.byte acLOOPN+2, 0
.byte afBUBBLE, -1, -1
.byte acLOOPBACK, 0

; offset 18 (straight up)
Data_at901C:
.byte afBUBBLE,  0, -1
.byte acLOOPBACK, 0


; octant 3 (top-back)

; offset 19
Data_at9021:
.byte afBUBBLE,  2, -2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 1A
Data_at902A:
.byte afBUBBLE,  1, -1
.byte acLOOPN+2, 0
.byte afBUBBLE,  0, -1, acTIMER+1
.byte acLOOPBACK, 0

; offset 1B
Data_at9035:
.byte afBUBBLE,  1, -2, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 1C
Data_at9040:
.byte afBUBBLE,  0, -1
.byte acLOOPN+2, 0
.byte afBUBBLE,  1, -1
.byte acLOOPBACK, 0


; offset 1D (straight up)
Data_at904A:
.byte afBUBBLE,  0, -1
.byte acLOOPBACK, 0


; octant 5 (bottom-front)

; offset 1E
Data_at904F:
.byte afBUBBLE, -2,  2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 1F
Data_at9058:
.byte afBUBBLE, -1,  1
.byte acLOOPN+2, 0
.byte afBUBBLE,  0,  1, acTIMER+1
.byte acLOOPBACK, 0

; offset 20
Data_at9063:
.byte afBUBBLE, -1,  2, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 21
Data_at906E:
.byte afBUBBLE,  0,  1
.byte acLOOPN+2, 0
.byte afBUBBLE, -1,  1
.byte acLOOPBACK, 0

; offset 22 (straight down)
Data_at9078:
.byte afBUBBLE,  0,  1
.byte acLOOPBACK, 0


; octant 1 (bottom-back)

; offset 23
Data_at907D:
.byte afBUBBLE,  2,  2, acTIMER+1
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 24
Data_at9086:
.byte afBUBBLE,  1,  1
.byte acLOOPN+2, 0
.byte afBUBBLE,  0,  1, acTIMER+1
.byte acLOOPBACK, 0

; offset 25
Data_at9091:
.byte afBUBBLE,  1,  2, acTIMER+1
.byte acLOOPN+4, 0
.byte afBUBBLE,  0,  0
.byte acLOOPBACK, 0

; offset 26
Data_at909C:
.byte afBUBBLE,  0,  1
.byte acLOOPN+2, 0
.byte afBUBBLE,  1,  1
.byte acLOOPBACK, 0

; offset 27 (straight down)
Data_at90A6:
.byte afBUBBLE,  0,  1
.byte acLOOPBACK, 0





; ==============================================

; Boss special attacks

; ==============================================


; ==============================================
; >> Boss 7 SPARKs fanning out
; ==============================================

; three angles upwards: 90 60 and 30

; offsets 28 (90 degrees up)
Data_at90AB:
.byte afSPARKLE+0, 0, -3, acTIMER+1
.byte afSPARKLE+1, 0, -2, acTIMER+1
.byte acLOOPBACK, 0

; offsets 29 (60 degrees up)
Data_at90B5:
.byte afSPARKLE+0, -1, -2, acTIMER+1 ; $3C, $FF, $FE, $81
.byte afSPARKLE+1, -1, -2, acTIMER+1
.byte acLOOPBACK, 0

; offsets 2A (30 degrees up)
Data_at90BF:
.byte afSPARKLE+0, -2, -1, acTIMER+1
.byte afSPARKLE+1, -2, -1, acTIMER+1
.byte acLOOPBACK, 0

; central one goes spiralling
; last index 3A
Data_at90C9:
.byte afSPARKLE+1, -3, -2 ; 0
.byte afSPARKLE+0, -3, -1 ; 1
.byte afSPARKLE+1, -3, -1 ; 2
.byte afSPARKLE+0, -3,  0 ; 3
.byte afSPARKLE+1, -3,  1 ; 4
.byte afSPARKLE+0, -3,  1 ; 5
.byte afSPARKLE+1, -3,  2 ; 6
.byte afSPARKLE+0, -3,  1 ; 7
.byte afSPARKLE+1, -2,  2 ; 8
.byte afSPARKLE+0, -1,  3 ; 9
.byte afSPARKLE+1,  1,  3 ; 10
.byte afSPARKLE+0,  2,  2 ; 11
.byte afSPARKLE+1,  3,  1 ; 12
.byte afSPARKLE+0,  3, -1 ; 13
.byte afSPARKLE+1,  2, -2 ; 14
.byte afSPARKLE+0,  1, -3 ; 15
.byte afSPARKLE+1, -1, -3 ; 16
.byte afSPARKLE+0, -2, -2 ; 17
.byte afSPARKLE+1, -3, -1 ; 18
.byte acLOOPBACK, 0 ; loop back to frame zero

; three angles downwards: 30 60 and 90

; offsets 2C (30 degrees down)
Data_at9104:
.byte afSPARKLE+0, -2,  1, acTIMER+1
.byte afSPARKLE+1, -2,  1, acTIMER+1
.byte acLOOPBACK, 0

; offsets 2D (60 degrees down)
Data_at910E:
.byte afSPARKLE+0, -1,  2, acTIMER+1
.byte afSPARKLE+1, -1,  2, acTIMER+1
.byte acLOOPBACK, 0

; offsets 2E (90 degrees down)
Data_at9118:
.byte afSPARKLE+0,  0,  3, acTIMER+1
.byte afSPARKLE+1,  0,  2, acTIMER+1
.byte acLOOPBACK, 0


; ==============================================
; >> Boss 3 COMETs fanning out
; ==============================================

.define afCometStraight $2C
.define afCometUp $3E
.define afCometDown $3F

; up 30 degrees, horizontal, down 30 degrees
; offsets 2F (30 degrees up)
Data_at9122:
.byte afCometUp, -3, -1
.byte acLOOPBACK, 0, -1

; offsets 30 (horizontal)
Data_at9128:
.byte afCometStraight, -4,  0
.byte afCometStraight, -3,  0
.byte acLOOPBACK, 0, -1

; offsets 31 (30 degrees down)
Data_at9131:
.byte afCometDown, -3,  1
.byte acLOOPBACK, 0, -1

; ==============================================
; >> Boss 2 AMBERs + 3 COMETs fanning out
; ==============================================

; offsets 32 (60 degrees up)
Data_at9137:
.byte afAMBER,  -2, -2
.byte acLOOPBACK, 0
.byte acEND

; offsets 33 (30 degrees up)
Data_at913D:
.byte afCometUp, -3, -1
.byte acLOOPBACK, 0
.byte acEND


; offsets 34 (horizontal)
Data_at9143:
.byte afCometStraight,  -3, 0
.byte afCometStraight,  -4, 0
.byte acLOOPBACK, 0
.byte acEND


; offsets 35 (30 degrees down)
Data_at914C:
.byte afCometDown,  -3, 1
.byte acLOOPBACK, 0
.byte acEND


; offsets 36 (60 degrees down)
Data_at9152:
.byte afAMBER,  -2, 2
.byte acLOOPBACK, 0
.byte acEND



; ==============================================
; Boss: 5 spiralling AMBERs fanning out
; ==============================================

; offsets 37 (60 degrees up)
Data_at9158:
.byte afAMBER+1, -2, -4 ; 0
.byte afAMBER+0, -2, -3 ; 1
.byte afAMBER+1, -2, -3 ; 2
.byte afAMBER+0, -2, -1 ; 3
.byte afAMBER+1, -2,  0 ; 4
.byte afAMBER+0, -2,  0 ; 5
.byte afAMBER+1, -2,  1 ; 6
.byte afAMBER+0, -2,  0 ; 7
.byte afAMBER+1, -1,  1 ; 8
.byte afAMBER+0,  0,  2 ; 9
.byte afAMBER+1,  0,  2 ; 10
.byte afAMBER+0,  1,  1 ; 11
.byte afAMBER+1,  2,  0 ; 12
.byte afAMBER+0,  2, -3 ; 13
.byte afAMBER+1,  1, -4 ; 14
.byte afAMBER+0,  0, -5 ; 15
.byte afAMBER+1,  0, -5 ; 16
.byte afAMBER+0, -1, -4 ; 17
.byte afAMBER+1, -2, -3 ; 18
.byte acLOOPBACK, 0

Data_at9193:
; offsets 38 (30 degrees up)
.byte afAMBER+1, -3, -4 ; 0
.byte afAMBER+0, -3, -3 ; 1
.byte afAMBER+1, -3, -3 ; 2
.byte afAMBER+0, -3, -1 ; 3
.byte afAMBER+1, -3,  1 ; 4
.byte afAMBER+0, -3,  1 ; 5
.byte afAMBER+1, -3,  2 ; 6
.byte afAMBER+0, -3,  1 ; 7
.byte afAMBER+1, -2,  2 ; 8
.byte afAMBER+0, -1,  3 ; 9
.byte afAMBER+1,  1,  3 ; 10
.byte afAMBER+0,  2,  2 ; 11
.byte afAMBER+1,  3,  1 ; 12
.byte afAMBER+0,  3, -2 ; 13
.byte afAMBER+1,  2, -3 ; 14
.byte afAMBER+0,  1, -4 ; 15
.byte afAMBER+1, -1, -4 ; 16
.byte afAMBER+0, -3, -4 ; 17
.byte afAMBER+1, -4, -3 ; 18
.byte acLOOPBACK, 0

; offsets 39 (horizontal)
Data_at91CE:
.byte afAMBER+1, -3, -2 ; 0
.byte afAMBER+0, -3, -1 ; 1
.byte afAMBER+1, -3, -1 ; 2
.byte afAMBER+0, -3,  0 ; 3
.byte afAMBER+1, -3,  1 ; 4
.byte afAMBER+0, -3,  1 ; 5
.byte afAMBER+1, -3,  2 ; 6
.byte afAMBER+0, -3,  1 ; 7
.byte afAMBER+1, -3,  2 ; 8
.byte afAMBER+0, -2,  3 ; 9
.byte afAMBER+1,  0,  3 ; 10
.byte afAMBER+0,  1,  2 ; 11
.byte afAMBER+1,  2,  1 ; 12
.byte afAMBER+0,  2, -1 ; 13
.byte afAMBER+1,  1, -2 ; 14
.byte afAMBER+0,  0, -3 ; 15
.byte afAMBER+1, -2, -3 ; 16
.byte afAMBER+0, -3, -2 ; 17
.byte afAMBER+1, -4, -1 ; 18
.byte acLOOPBACK, 0

; offsets 3A (30 degrees down)
Data_at9209:
.byte afAMBER+1, -3,  4 ; 0
.byte afAMBER+0, -3,  3 ; 1
.byte afAMBER+1, -3,  3 ; 2
.byte afAMBER+0, -3,  1 ; 3
.byte afAMBER+1, -3, -1 ; 4
.byte afAMBER+0, -3, -1 ; 5
.byte afAMBER+1, -3, -2 ; 6
.byte afAMBER+0, -3, -1 ; 7
.byte afAMBER+1, -2, -2 ; 8
.byte afAMBER+0, -1, -3 ; 9
.byte afAMBER+1,  1, -3 ; 10
.byte afAMBER+0,  2, -2 ; 11
.byte afAMBER+1,  3, -1 ; 12
.byte afAMBER+0,  3,  2 ; 13
.byte afAMBER+1,  2,  3 ; 14
.byte afAMBER+0,  1,  4 ; 15
.byte afAMBER+1, -1,  4 ; 16
.byte afAMBER+0, -3,  4 ; 17
.byte afAMBER+1, -4,  3 ; 18
.byte acLOOPBACK, 0

; offsets 3B (31 degrees down)
Data_at9244:
.byte afAMBER+1, -2,  4 ; 0
.byte afAMBER+0, -2,  3 ; 1
.byte afAMBER+1, -2,  3 ; 2
.byte afAMBER+0, -2,  1 ; 3
.byte afAMBER+1, -2,  0 ; 4
.byte afAMBER+0, -2,  0 ; 5
.byte afAMBER+1, -2, -1 ; 6
.byte afAMBER+0, -2,  0 ; 7
.byte afAMBER+1, -1, -1 ; 8
.byte afAMBER+0,  0, -2 ; 9
.byte afAMBER+1,  0, -2 ; 10
.byte afAMBER+0,  1, -1 ; 11
.byte afAMBER+1,  2,  0 ; 12
.byte afAMBER+0,  2,  3 ; 13
.byte afAMBER+1,  1,  4 ; 14
.byte afAMBER+0,  0,  5 ; 15
.byte afAMBER+1,  0,  5 ; 16
.byte afAMBER+0, -1,  4 ; 17
.byte afAMBER+1, -2,  3 ; 18
.byte acLOOPBACK, 0
