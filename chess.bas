Check BF877180
Auto 8224

# Run-time Variables

Var y: Num = 15
Var x: Num = 11
Var user: Num = 232
Var turn: Num = 1
Var moves: Num = 1
Var t1: Num = 55
Var t2: Num = 104
Var sec1: Num = 9
Var min1: Num = 0
Var sec2: Num = 7
Var min2: Num = 0
Var color: Num = 0
Var aux: Num = 11
Var start: Num = 1
Var index: Num = 0
Var aux2: Num = 11
Var piece: Num = 8
Var drawing: Num = 6200
Var scolor: Num = 1
Var bg: Num = 6
Var fg: Num = 2
Var cindex: Num = 37
Var lindex: Num = 8
Var s1: Num = 93
Var prev: Num = 8
Var s2: Num = 6
Var a: NumArray(64, 2) = 0, 14, 2, 14, 4, 14, 6, 14, 8, 14, 10, 14, 12, 14, 14, 14, 0, 12, 2, 12, 4, 12, 6, 12, 8, 12, 10, 12, 12, 12, 14, 12, 0, 10, 2, 10, 4, 10, 6, 10, 8, 10, 10, 10, 12, 10, 14, 10, 0, 8, 2, 8, 4, 8, 6, 8, 8, 8, 10, 8, 12, 8, 14, 8, 0, 6, 2, 6, 4, 6, 6, 6, 8, 6, 10, 6, 12, 6, 14, 6, 0, 4, 2, 4, 4, 4, 6, 4, 8, 4, 10, 4, 12, 4, 14, 4, 0, 2, 2, 2, 4, 2, 6, 2, 8, 2, 10, 2, 12, 2, 14, 2, 0, 0, 2, 0, 4, 0, 6, 0, 8, 0, 10, 0, 12, 0, 14, 0
Var b: NumArray(64) = 1, 2, 3, 4, 33, 8, 5, 33, 9, 10, 11, 12, 13, 14, 15, 16, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
Var c: NumArray(33) = 6200, 6300, 6400, 6600, 6500, 6400, 6300, 6200, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6200, 6300, 6400, 6600, 6500, 6400, 6300, 6200, 6700
Var d: NumArray(64) = 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0
Var e: NumArray(33) = 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7
Var z: NumFOR = 65536, 65535, 1, 8001, 3
Var i: NumFOR = 15, 14, 1, 5210, 2
Var s: NumFOR = 65, 64, 1, 6010, 2
Var x$: Str = "\#013"
Var f$: Str = "0-0  0-0-0"
Var g$: Str = "0-0  0-0-0"
Var z$: Str = "e8c8"

# End Run-time Variables

   5 CLS : BORDER 7
  10 REM UDG graphics
  20 GO SUB 8000
  30 REM data model
  40 GO SUB 7000
  50 REM HUD display
  60 GO SUB 5000: REM print bottom line
  62 GO SUB 5100: REM print board coords
  63 GO SUB 5200: REM print moves table
  70 REM board display
  80 GO SUB 6000
  90 REM server mode
 100 GO SUB 9000
 104 REM ***************
 105 REM main loop
 106 REM ***************
 110 GO SUB 9000: REM proxy connection
 115 LET z$=""
 116 PRINT #0;AT 1,0;"MOVE: ";z$,,
 120 LET x$=INKEY$
 121 LET t2=PEEK 23672
 122 IF ABS (t2-t1)>=50 THEN GO SUB 5020: LET t1=t2
 123 IF x$="" THEN GO TO 120
 130 IF x$="r" OR x$="R" THEN GO TO 4000: REM resign
 140 IF x$="n" OR x$="N" THEN CLS : GO TO 30
 150 IF x$="t" OR x$="t" THEN GO TO 4200: REM ask for a draw
 155 IF x$="q" OR x$="Q" THEN STOP
 198 REM read moves in z$
 202 IF x$=CHR$ 12 AND LEN z$>0 THEN LET z$=z$( TO LEN z$-1): PRINT #0;AT 1,0;"MOVE: ";z$,: GO TO 120
 203 IF x$=CHR$ 12 AND LEN z$=0 THEN GO TO 120
 204 IF x$<>CHR$ 13 THEN LET z$=z$+x$: PRINT #0;AT 1,0;"MOVE: ";z$,: GO TO 120
 205 PRINT #0;AT 1,0;"MOVE: ";,
 209 REM verifies input
 210 IF LEN z$<>4 AND z$<>"0-0" AND z$<>"0-0-0" THEN BEEP 0.5,1: GO TO 115
 211 IF z$="0-0" THEN GO TO 4500
 212 IF z$="0-0-0" THEN GO TO 4700
 215 IF  CODE (z$(1))>=97 AND  CODE (z$(1))<=104 THEN LET z$(1)=CHR$ ( CODE (z$(1))-32)
 216 IF  CODE (z$(3))>=97 AND  CODE (z$(3))<=104 THEN LET z$(3)=CHR$ ( CODE (z$(3))-32)
 220 IF  CODE (z$(1))<65 OR  CODE (z$(1))>72 THEN BEEP 0.5,1: GO TO 115
 230 IF  CODE (z$(3))<65 OR  CODE (z$(3))>72 THEN BEEP 0.5,1: GO TO 115
 240 IF  CODE (z$(2))<49 OR  CODE (z$(2))>56 THEN BEEP 0.5,1: GO TO 115
 250 IF  CODE (z$(4))<49 OR  CODE (z$(4))>56 THEN BEEP 0.5,1: GO TO 115
 255 REM saves move and applies it to the board
 260 LET f$=f$+z$+" ": LET moves=moves+0.5
 270 GO SUB 5200: REM print moves table
 280 GO SUB 5300: REM Apply move on the board
 281 BEEP 0.1,20: BEEP 0.1,22: BEEP 0.1,25
 285 LET turn=(0 AND turn=1)+(1 AND turn=0)
 290 GO TO 115
4000 REM Resign
4010 STOP
4200 REM Ask for a draw
4210 STOP
4500 REM Apply 0-0 on the board
4510 LET f$=f$+z$+"  "
4520 LET moves=moves+0.5
4530 GO SUB 5200: REM print moves table
4540 IF turn=0 THEN LET z$="E1G1": GO SUB 5300: LET z$="H1F1": GO SUB 5300
4550 IF turn=1 THEN LET z$="E8G8": GO SUB 5300: LET z$="H8F8": GO SUB 5300
4560 BEEP 0.1,20: BEEP 0.1,22: BEEP 0.1,25
4570 LET turn=(0 AND turn=1)+(1 AND turn=0)
4580 GO TO 115
4700 REM Apply 0-0-0 on the board
4710 LET f$=f$+z$
4720 LET moves=moves+0.5
4730 GO SUB 5200: REM print moves table
4740 IF turn=0 THEN LET z$="E1C1": GO SUB 5300: LET z$="A1D1": GO SUB 5300
4750 IF turn=1 THEN LET z$="E8C8": GO SUB 5300: LET z$="A8D8": GO SUB 5300
4760 BEEP 0.1,20: BEEP 0.1,22: BEEP 0.1,25
4770 LET turn=(0 AND turn=1)+(1 AND turn=0)
4780 GO TO 115
4999 STOP
5000 REM HUD display
5011 PRINT AT 21,0; INVERSE 1;"N"; INVERSE 0;"-NEW GAME ";
5012 PRINT INVERSE 1;"R"; INVERSE 0;"-RESIGN ";
5013 PRINT INVERSE 1;"T"; INVERSE 0;"-DRAW ";
5014 PRINT INVERSE 1;"Q"; INVERSE 0;"-END"
5015 RETURN
5020 REM clocks
5021 IF turn=0 THEN INVERSE 1
5022 PRINT AT 1,19;"white": PRINT AT 2,19;
5023 IF min1<10 THEN PRINT "0";
5024 PRINT min1;":";
5026 IF sec1<10 THEN PRINT "0";
5028 PRINT sec1: INVERSE 0
5031 IF turn=1 THEN INVERSE 1
5032 PRINT AT 1,25;"black": PRINT AT 2,25;
5034 IF min2<10 THEN PRINT "0";
5035 PRINT min2;":";
5036 IF sec2<10 THEN PRINT "0";
5038 PRINT sec2: INVERSE 0
5040 IF turn=0 THEN LET sec1=sec1+1
5050 IF turn=1 THEN LET sec2=sec2+1
5055 IF sec1=60 THEN LET sec1=0: LET min1=min1+1
5056 IF sec2=60 THEN LET sec2=0: LET min2=min2+1
5060 RETURN
5100 REM print coordinates
5110 LET aux=8: FOR i=1 TO 16 STEP 2
5120 PRINT AT i+1,0;aux
5125 LET aux=aux-1
5130 NEXT i
5140 LET aux=65: FOR i=1 TO 16 STEP 2
5150 PRINT AT 17,i;CHR$ (aux)
5160 LET aux=aux+1
5170 NEXT i
5180 RETURN
5200 REM print moves table (14*2*5-1=139)
5201 LET start=LEN f$-139: LET index=INT (moves-13.5)
5202 IF start<=0 THEN LET start=1
5203 IF index<0 THEN LET index=0
5205 LET g$=f$(start TO ): LET aux=1
5206 IF start<>1 AND moves>INT (moves) THEN LET aux=aux+5
5210 FOR i=1 TO 14
5211 LET aux2=aux
5220 IF LEN g$>=aux+9 THEN PRINT AT 3+i,18;index+i;" ";g$(aux TO aux+4);" ";g$(aux+5 TO aux+9): LET aux2=aux2+10: GO TO 5223
5221 IF LEN g$>=aux+4 THEN PRINT AT 3+i,18;index+i;" ";g$(aux TO aux+4);" ";"_____": LET aux2=aux2+5: GO TO 5223
5222 IF LEN g$<=aux THEN PRINT AT 3+i,18;index+i;" ";"_____";" ";"_____"
5223 LET aux=aux2
5230 NEXT i
5240 RETURN
5300 REM apply move on the board
5320 LET cindex= CODE (z$(1))-64
5330 LET lindex= CODE (z$(2))-48
5340 LET s1=(lindex-1)*8+cindex
5350 LET prev=b(s1): LET b(s1)=33
5360 LET cindex= CODE (z$(3))-64
5370 LET lindex= CODE (z$(4))-48
5380 LET s2=(lindex-1)*8+cindex
5390 LET b(s2)=prev
5391 IF b(s2)>=9 AND b(s2)<=16 AND z$(4)="8" THEN LET b(s2)=4
5392 IF b(s2)>=17 AND b(s2)<=24 AND z$(4)="1" THEN LET b(s2)=28
5400 LET x=1+a(s1,1): LET y=1+a(s1,2): LET piece=b(s1): LET drawing=c(piece): LET scolor=d(s1)
5410 IF scolor=0 THEN LET bg=5
5420 IF scolor=1 THEN LET bg=6
5430 LET fg=e(piece)
5440 GO SUB drawing
5450 LET x=1+a(s2,1): LET y=1+a(s2,2): LET piece=b(s2): LET drawing=c(piece): LET scolor=d(s2)
5460 IF scolor=0 THEN LET bg=5
5470 IF scolor=1 THEN LET bg=6
5480 LET fg=e(piece)
5490 GO SUB drawing
5495 RETURN
5500 REM read input non blocking
5510 PRINT #0;"MOVES :";z$
5999 RETURN
6000 REM drawing board
6010 FOR s=1 TO 64
6020 LET x=1+a(s,1)
6030 LET y=1+a(s,2)
6040 LET piece=b(s)
6050 LET drawing=c(piece)
6051 LET scolor=d(s)
6052 IF scolor=0 THEN LET bg=5
6053 IF scolor=1 THEN LET bg=6
6054 LET fg=e(piece)
6060 GO SUB drawing
6070 NEXT s
6090 RETURN
6100 REM drawing pawn
6110 PRINT AT y,x; PAPER bg; INK fg;"\a\b"
6120 PRINT AT y+1,x; PAPER bg; INK fg;"\c\d"
6130 RETURN
6200 REM drawing rook
6210 PRINT AT y,x; PAPER bg; INK fg;"\e\f"
6220 PRINT AT y+1,x; PAPER bg; INK fg;"\g\h"
6230 RETURN
6300 REM drawing knight
6310 PRINT AT y,x; PAPER bg; INK fg;"\i\j"
6320 PRINT AT y+1,x; PAPER bg; INK fg;"\k\l"
6330 RETURN
6400 REM drawing bishop
6410 PRINT AT y,x; PAPER bg; INK fg;"\m\n"
6420 PRINT AT y+1,x; PAPER bg; INK fg;"\o\p"
6430 RETURN
6500 REM drawing king
6510 PRINT AT y,x; PAPER bg; INK fg;"\q\r"
6520 PRINT AT y+1,x; PAPER bg; INK fg;"\s\p"
6530 RETURN
6600 REM drawing queen
6610 PRINT AT y,x; PAPER bg; INK fg;"\t\u"
6620 PRINT AT y+1,x; PAPER bg; INK fg;"\s\p"
6630 RETURN
6700 REM blank space
6710 PRINT AT y,x; PAPER bg; INK fg;"  "
6720 PRINT AT y+1,x; PAPER bg; INK fg;"  "
6730 RETURN
7000 REM square_coords
7010 DIM a(64,2)
7020 REM square_piece
7030 DIM b(64)
7040 REM piece_drawing
7050 DIM c(33)
7060 REM square_color
7070 DIM d(64)
7071 REM piece_color
7072 DIM e(33)
7073 REM game variables
7074 LET turn=0: LET f$="": LET moves=0: LET t1=0: LET t2=0: LET sec1=0: LET min1=0: LET sec2=0: LET min2=0
7080 LET color=0
7100 FOR i=1 TO 64
7110 LET y=14-(INT ((i-1)/8))*2
7120 LET x=((i-1)-(INT ((i-1)/8)*8))*2
7130 LET a(i,1)=x
7140 LET a(i,2)=y
7141 IF i>=1 AND i<=16 THEN LET b(i)=i: LET e(i)=2
7142 IF i>=17 AND i<=48 THEN LET b(i)=33: IF i>=17 AND i<=32 THEN LET e(i)=0
7143 IF i>=49 AND i<=64 THEN LET b(i)=(i-48)+16
7313 IF x<>0 THEN LET color=(1 AND color=0)+(0 AND color=1)
7314 LET d(i)=color
7320 NEXT i
7400 LET c(1)=6200: LET c(2)=6300: LET c(3)=6400: LET c(4)=6600: LET c(5)=6500: LET c(6)=6400: LET c(7)=6300: LET c(8)=6200
7410 LET c(9)=6100: LET c(10)=6100
7420 LET c(11)=6100: LET c(12)=6100
7430 LET c(13)=6100: LET c(14)=6100
7440 LET c(15)=6100: LET c(16)=6100
7450 LET c(17)=6100: LET c(18)=6100: LET c(19)=6100: LET c(20)=6100: LET c(21)=6100: LET c(22)=6100: LET c(23)=6100: LET c(24)=6100
7460 LET c(25)=6200: LET c(26)=6300
7470 LET c(27)=6400: LET c(28)=6600
7480 LET c(29)=6500: LET c(30)=6400
7490 LET c(31)=6300: LET c(32)=6200
7495 LET c(33)=6700
7560 LET e(33)=7
7999 RETURN
8000 REM UDGs graphics
8001 RESTORE 8000: FOR z=USR "a" TO USR "u"+7
8002 READ user: POKE z,user
8003 NEXT z
8009 REM pawn
8010 DATA 0,1,3,7,7,7,1,3
8020 DATA 0,128,192,96,160,224,128,192
8030 DATA 7,3,7,15,31,31,63,0
8040 DATA 160,192,160,208,24,184,252,0
8299 REM rook
8300 DATA 0,54,54,54,63,15,15,31
8310 DATA 0,108,108,108,252,240,208,152
8320 DATA 15,15,15,15,31,63,127,0
8330 DATA 208,208,208,208,232,140,254,0
8600 REM knight
8610 DATA 0,0,1,6,15,31,7,9
8620 DATA 0,64,192,224,208,200,232,232
8630 DATA 3,15,31,31,15,3,63,0
8640 DATA 200,208,144,32,224,192,252,0
8650 REM bishop
8660 DATA 0,1,3,7,3,9,28,29
8670 DATA 0,128,192,224,224,208,232,248
8680 DATA 15,7,3,15,31,63,63,0
8690 DATA 240,224,192,240,232,204,252,0
8700 REM king
8710 DATA 0,1,1,15,7,53,121,127
8720 DATA 0,128,128,240,224,172,158,254
8730 DATA 63,7,7,15,31,63,127,0
8740 REM queen
8750 DATA 17,59,17,11,31,15,31,15
8760 DATA 136,220,136,208,248,240,248,232
8770 REM \a\b\e\f\i\j\m\n\q\r\t\u
8780 REM \c\d\g\h\k\l\o\p\s\p\s\p
8790 RETURN
9000 REM proxy connection
9001 PRINT AT 19,5; FLASH 1;"CONNECTING WITH PROXY"; FLASH 0
9010 RETURN
