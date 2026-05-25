Check C7A17DA1
Auto 8224

# Run-time Variables

Var user: Num = 0
Var z: NumFOR = 65456, 65535, 1, 8001, 3

# End Run-time Variables

   5 CLS : BORDER 0
  10 REM UDG graphics
  20 GO SUB 8000
  30 REM data model
  40 GO SUB 7000
  50 REM HUD display
  60 GO SUB 5000: GO SUB 5020: GO SUB 5100: GO SUB 5200
  70 REM board display
  80 GO SUB 6000
  90 REM server mode
 100 GO SUB 9000
 105 REM main loop
 110 PRINT AT 19,5; FLASH 1;"WAITING FOR A CLIENT"; FLASH 0
 120 LET z$=INKEY$: IF z$<>"p" AND z$<>"P" AND z$<>"n" AND z$<>"N" AND z$<>"z" AND z$<>"Z" THEN GO TO 120
 130 IF z$="q" OR z$="Q" THEN STOP
 140 IF z$="n" OR z$="N" THEN CLS : GO TO 30
 150 IF z$="z" OR z$="Z" THEN GO SUB 9500
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
 260 LET f$=f$+z$: LET moves=moves+0.5
 270 GO SUB 5200
 280 GO SUB 5300
 290 GO SUB 200
4999 STOP
5000 REM HUD display
5011 PRINT AT 21,3; INVERSE 1;"N"; INVERSE 0;"-NEW GAME ";
5012 PRINT INVERSE 1;"Z"; INVERSE 0;"-CONNECT ";
5014 PRINT INVERSE 1;"P"; INVERSE 0;"-HELP"
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
5200 REM print moves 14*2*4-1=111
5201 LET start=LEN f$-111: LET index=INT (moves-13.5)
5202 IF start<=0 THEN LET start=1
5203 IF index<0 THEN LET index=0
5205 LET g$=f$(start TO ): LET aux=1
5206 IF start<>1 AND moves>INT (moves) THEN LET aux=aux+4
5210 FOR i=1 TO 14
5211 LET aux2=aux
5220 IF LEN g$>=aux+7 THEN PRINT AT 3+i,18;index+i;" ";g$(aux TO aux+3);" ";g$(aux+4 TO aux+7): LET aux2=aux2+8: GO TO 5223
5221 IF LEN g$>=aux+3 THEN PRINT AT 3+i,18;index+i;" ";g$(aux TO aux+3);" ";"....": LET aux2=aux2+4: GO TO 5223
5222 IF LEN g$<=aux THEN PRINT AT 3+i,18;index+i;" ";"....";" ";"...."
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
7074 LET turn=1: DIM t(2): LET t(1)=300: LET t(2)=300: LET f$="": LET moves=0
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
9000 REM server connection
9010 RETURN
9500 REM client connection
9510 RETURN
