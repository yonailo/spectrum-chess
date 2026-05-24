Check 0DBD9F64
Auto 8224

# Run-time Variables

Var y: Num = 13
Var x: Num = 9
Var turn: Num = 1
Var findex: Num = 1
Var switch: Num = 8
Var aux: Num = 15
Var color: Num = 1
Var user: Num = 232
Var piece: Num = 33
Var drawing: Num = 6700
Var scolor: Num = 0
Var bg: Num = 5
Var fg: Num = 7
Var cindex: Num = 5
Var lindex: Num = 4
Var s1: Num = 13
Var prev: Num = 13
Var s2: Num = 29
Var a: NumArray(64, 2) = 0, 14, 2, 14, 4, 14, 6, 14, 8, 14, 10, 14, 12, 14, 14, 14, 0, 12, 2, 12, 4, 12, 6, 12, 8, 12, 10, 12, 12, 12, 14, 12, 0, 10, 2, 10, 4, 10, 6, 10, 8, 10, 10, 10, 12, 10, 14, 10, 0, 8, 2, 8, 4, 8, 6, 8, 8, 8, 10, 8, 12, 8, 14, 8, 0, 6, 2, 6, 4, 6, 6, 6, 8, 6, 10, 6, 12, 6, 14, 6, 0, 4, 2, 4, 4, 4, 6, 4, 8, 4, 10, 4, 12, 4, 14, 4, 0, 2, 2, 2, 4, 2, 6, 2, 8, 2, 10, 2, 12, 2, 14, 2, 0, 0, 2, 0, 4, 0, 6, 0, 8, 0, 10, 0, 12, 0, 14, 0
Var b: NumArray(64) = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 33, 14, 15, 16, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 13, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
Var c: NumArray(33) = 6200, 6300, 6400, 6600, 6500, 6400, 6300, 6200, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6100, 6200, 6300, 6400, 6600, 6500, 6400, 6300, 6200, 6700
Var d: NumArray(64) = 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1
Var e: NumArray(33) = 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7
Var t: NumArray(2) = 299, 299
Var i: NumFOR = 15, 14, 1, 5210, 2
Var z: NumFOR = 65536, 65535, 1, 8001, 3
Var s: NumFOR = 65, 64, 1, 6010, 2
Var i$: Str = "aaa"
Var z$: Str = "E2E4"
Var f$: StrArray(40, 2, 4) = "E2E4............................................................................................................................................................................................................................................................................................................................"

# End Run-time Variables

   5 CLS : BORDER 0
  10 REM data model
  20 GO SUB 7000
  30 REM graphics
  40 GO SUB 8000
  50 REM HUD display
  60 GO SUB 5000: GO SUB 5020: GO SUB 5100: GO SUB 5200
  70 REM board display
  80 GO SUB 6000
  90 REM enter in server mode
 100 GO SUB 9000
 105 REM main loop
 110 PRINT AT 19,5;"LISTENING ON PORT 2000"
 120 LET z$=INKEY$: IF z$<>"q" AND z$<>"n" THEN GO TO 120
 130 IF z$="q" THEN STOP
 140 INPUT "IP ADDR: "; LINE i$
 200 INPUT "MOVE: "; LINE z$
 205 REM verifies input
 210 IF LEN z$<>4 THEN PRINT AT 0,0;LEN z$: BEEP 0.5,1: GO TO 200
 215 IF  CODE (z$(1))>=97 AND  CODE (z$(1))<=104 THEN LET z$(1)=CHR$ ( CODE (z$(1))-32)
 216 IF  CODE (z$(3))>=97 AND  CODE (z$(3))<=104 THEN LET z$(3)=CHR$ ( CODE (z$(3))-32)
 220 IF  CODE (z$(1))<65 OR  CODE (z$(1))>72 THEN BEEP 0.5,1: GO TO 200
 230 IF  CODE (z$(3))<65 OR  CODE (z$(3))>72 THEN BEEP 0.5,1: GO TO 200
 240 IF  CODE (z$(2))<49 OR  CODE (z$(2))>56 THEN BEEP 0.5,1: GO TO 200
 250 IF  CODE (z$(4))<49 OR  CODE (z$(4))>56 THEN BEEP 0.5,1: GO TO 200
 255 REM saves move and applies it to the board
 260 LET f$(findex,turn)=z$
 270 GO SUB 5200
 280 GO SUB 5300
 290 GO SUB 200
4999 STOP
5000 REM HUD display
5011 PRINT AT 21,0; INVERSE 1;"N"; INVERSE 0;"-NEW GAME ";
5012 PRINT INVERSE 1;"R"; INVERSE 0;"-RESIGN ";
5013 PRINT INVERSE 1;"T"; INVERSE 0;"-DRAW ";
5014 PRINT INVERSE 1;"Q"; INVERSE 0;"-END"
5015 RETURN
5019 REM clocks
5020 PRINT AT 1,19;"white": PRINT AT 2,19;t(1): PRINT AT 1,25;"black": PRINT AT 2,25;t(2)
5030 LET t(1)=t(1)-1: LET t(2)=t(2)-1
5040 IF t(1)=0 THEN STOP
5050 IF t(1)=0 THEN STOP
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
5200 REM print moves
5201 LET aux=findex-14
5202 IF aux<1 THEN LET aux=1
5210 FOR i=1 TO 14
5220 PRINT AT 3+i,18;aux;". ";f$(aux,1);" ";f$(aux,2): LET aux=aux+1
5230 NEXT i
5240 RETURN
5300 REM apply move on the board
5310 LET z$=f$(findex,turn)
5320 LET cindex= CODE (z$(1))-64
5330 LET lindex= CODE (z$(2))-48
5340 LET s1=(lindex-1)*8+cindex
5350 LET prev=b(s1): LET b(s1)=33
5360 LET cindex= CODE (z$(3))-64
5370 LET lindex= CODE (z$(4))-48
5380 LET s2=(lindex-1)*8+cindex
5390 LET b(s2)=prev
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
6110 PRINT AT y+0,x; PAPER bg; INK fg;"\a\b"
6120 PRINT AT y+1,x; PAPER bg; INK fg;"\c\d"
6130 RETURN
6200 REM drawing rook
6210 PRINT AT y+0,x; PAPER bg; INK fg;"\e\f"
6220 PRINT AT y+1,x; PAPER bg; INK fg;"\g\h"
6230 RETURN
6300 REM drawing knight
6310 PRINT AT y+0,x; PAPER bg; INK fg;"\i\j"
6320 PRINT AT y+1,x; PAPER bg; INK fg;"\k\l"
6330 RETURN
6400 REM drawing bishop
6410 PRINT AT y+0,x; PAPER bg; INK fg;"\m\n"
6420 PRINT AT y+1,x; PAPER bg; INK fg;"\o\p"
6430 RETURN
6500 REM drawing king
6510 PRINT AT y+0,x; PAPER bg; INK fg;"\q\r"
6520 PRINT AT y+1,x; PAPER bg; INK fg;"\s\p"
6530 RETURN
6600 REM drawing queen
6610 PRINT AT y+0,x; PAPER bg; INK fg;"\t\u"
6620 PRINT AT y+1,x; PAPER bg; INK fg;"\s\p"
6630 RETURN
6700 REM blank space
6710 PRINT AT y+0,x; PAPER bg; INK fg;"  "
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
7074 LET turn=1: DIM t(2): LET t(1)=300: LET t(2)=300: LET findex=1
7075 REM moves
7076 DIM f$(40,2,4)
7077 FOR i=1 TO 40
7078 LET f$(i,1)="....": LET f$(i,2)="...."
7079 NEXT i
7100 FOR i=1 TO 64
7110 LET y=14-(INT ((i-1)/8))*2
7120 LET x=((i-1)-(INT ((i-1)/8)*8))*2
7130 LET a(i,1)=x
7140 LET a(i,2)=y
7150 NEXT i
7200 FOR i=17 TO 48
7210 LET b(i)=33
7230 NEXT i
7240 FOR i=1 TO 16
7250 LET b(i)=i
7260 NEXT i
7270 FOR i=49 TO 64
7280 LET b(i)=(i-48)+16
7290 NEXT i
7300 LET switch=0: FOR i=1 TO 64
7310 LET aux=(i-1)-(INT ((i-1)/8)*8)
7311 IF aux=0 THEN LET switch=switch+1
7318 LET color=(i-1+switch)-(INT ((i-1+switch)/2)*2)
7319 LET d(i)=color
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
7500 FOR i=1 TO 16
7510 LET e(i)=2
7520 NEXT i
7530 FOR i=17 TO 32
7540 LET e(i)=0
7550 NEXT i
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
9000 REM spectranet server mode
9010 RETURN
