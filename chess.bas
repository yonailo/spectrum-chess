    5 CLS : BORDER 7
    6 DEF FN t$(n)=" "(1 TO n<10)+STR$ (n)
    7 PRINT AT 11,8;"INITIALIZING UDGs ";AT 12,10;"PLEASE WAIT..."
   10 REM UDG graphics
   20 GO SUB 8000
   30 REM data model
   35 PRINT AT 11,8;"INITIALIZING BOARD";AT 12,10;"WAIT AGAIN... "
   40 GO SUB 7000
   50 REM HUD display
   60 CLS : GO SUB 5000: REM print bottom line
   62 GO SUB 5100: REM print board coords
   63 GO SUB 5200: REM print moves table
   70 REM board display
   80 GO SUB 6000
  104 REM ***************
  105 REM begin main loop
  106 REM ***************
  110 GO TO 9000: REM proxy connection
  115 LET z$=""
  116 IF player=turn THEN PRINT #0;AT 1,0;"MOVE: ";z$,,
  120 LET x$=INKEY$
  121 LET t2=PEEK 23672
  122 IF ABS (t2-t1)>=50 THEN GO SUB 5020: LET t1=t2
  123 IF player<>turn THEN PRINT #5;"p": INPUT #5;j;j$
  124 IF player<>turn AND j$="disconn" THEN GO TO 9200
  125 IF player<>turn AND j=4 AND j$="recv" THEN INPUT #4;z$: GO TO 252
  129 IF x$="" THEN GO TO 120
  130 IF x$="r" OR x$="R" THEN GO TO 4000: REM resign
  140 IF x$="n" OR x$="N" THEN CLS : GO TO 30
  150 IF x$="t" OR x$="t" THEN GO TO 4200: REM ask for a draw
  155 IF x$="q" OR x$="Q" THEN STOP 
  156 IF player<>turn THEN GO TO 115
  198 REM read moves in z$
  202 IF x$=CHR$ 12 AND LEN z$>0 THEN LET z$=z$( TO LEN z$-1): PRINT #0;AT 1,0;"MOVE: ";z$,: GO TO 120
  203 IF x$=CHR$ 12 AND LEN z$=0 THEN GO TO 120
  204 IF x$<>CHR$ 13 THEN LET z$=z$+x$: PRINT #0;AT 1,0;"MOVE: ";z$,: GO TO 120
  205 IF player=turn THEN PRINT #0;AT 1,0;"MOVE: ";,
  209 REM verifies input
  210 IF LEN z$<>4 AND z$<>"0-0" AND z$<>"0-0-0" THEN BEEP 0.5,1: GO TO 115
  215 IF CODE (z$(1))>=97 AND CODE (z$(1))<=104 THEN LET z$(1)=CHR$ (CODE (z$(1))-32)
  216 IF CODE (z$(3))>=97 AND CODE (z$(3))<=104 THEN LET z$(3)=CHR$ (CODE (z$(3))-32)
  220 IF CODE (z$(1))<65 OR CODE (z$(1))>72 THEN BEEP 0.5,1: GO TO 115
  230 IF CODE (z$(3))<65 OR CODE (z$(3))>72 THEN BEEP 0.5,1: GO TO 115
  240 IF CODE (z$(2))<49 OR CODE (z$(2))>56 THEN BEEP 0.5,1: GO TO 115
  250 IF CODE (z$(4))<49 OR CODE (z$(4))>56 THEN BEEP 0.5,1: GO TO 115
  251 REM saves move and applies it to the board
  252 IF z$="RESIGN" THEN PRINT AT 19,5;"PEER RESIGNED. GAME OVER": PAUSE 0: CLS : GO TO 30
  253 IF z$="DRAW" THEN PRINT AT 19,5;"PEER WANTS DRAW...": INPUT "ACCEPT ? (Y/N)"; LINE x$
  254 IF z$="DRAW" AND (x$="y" OR x$="Y") THEN PRINT #4;"Y": PRINT AT 19,5;"DRAW ACCEPTED. GAME OVER":%close #4: PAUSE 0: CLS : GO TO 30
  255 IF z$="DRAW" AND (x$="n" OR x$="N") THEN PRINT #4;"N": PRINT AT 19,5;"DRAW REFUSED. PLAYING...": GO TO 115
  256 IF z$="DRAW" THEN GO TO 253
  258 IF z$="0-0" THEN GO TO 4500
  259 IF z$="0-0-0" THEN GO TO 4700
  260 LET f$=f$+z$+" ": LET moves=moves+0.5
  270 GO SUB 5200: REM print moves table
  280 GO SUB 5300: REM Apply move on the board
  281 BEEP 0.1,20: BEEP 0.1,22: BEEP 0.1,25
  282 IF player=turn THEN PRINT #4;z$
  285 LET turn=(0 AND turn=1)+(1 AND turn=0)
  290 GO TO 115
  291 REM ***************
  292 REM end main loop
  293 REM ***************
 3998 REM 
 3999 REM ***************
 4000 REM Resign
 4001 REM ***************
 4010 PRINT #4;"RESIGN":%close #4
 4020 PRINT AT 19,5;"YOU RESIGN. GAME OVER": PAUSE 0: CLS : GO TO 30
 4199 REM ***************
 4200 REM Ask for a draw
 4201 REM ***************
 4210 PRINT #4;"DRAW"
 4220 INPUT #4;z$
 4230 IF z$="Y" THEN PRINT AT 19,5;"DRAW ACEPTED. GAME OVER": PAUSE 0: CLS : GO TO 30
 4240 IF z$="N" THEN PRINT AT 19,5;"DRAW REFUSED. PLAYING...": GO TO 115
 4499 REM **********************
 4500 REM Apply 0-0 on the board
 4501 REM **********************
 4510 LET f$=f$+z$+"  "
 4520 LET moves=moves+0.5
 4530 GO SUB 5200: REM print moves table
 4540 IF turn=0 THEN LET z$="E1G1": GO SUB 5300: LET z$="H1F1": GO SUB 5300
 4550 IF turn=1 THEN LET z$="E8G8": GO SUB 5300: LET z$="H8F8": GO SUB 5300
 4560 BEEP 0.1,20: BEEP 0.1,22: BEEP 0.1,25
 4570 LET turn=(0 AND turn=1)+(1 AND turn=0)
 4580 GO TO 115
 4699 REM ************************
 4700 REM Apply 0-0-0 on the board
 4701 REM ************************
 4710 LET f$=f$+z$
 4720 LET moves=moves+0.5
 4730 GO SUB 5200: REM print moves table
 4740 IF turn=0 THEN LET z$="E1C1": GO SUB 5300: LET z$="A1D1": GO SUB 5300
 4750 IF turn=1 THEN LET z$="E8C8": GO SUB 5300: LET z$="A8D8": GO SUB 5300
 4760 BEEP 0.1,20: BEEP 0.1,22: BEEP 0.1,25
 4770 LET turn=(0 AND turn=1)+(1 AND turn=0)
 4780 GO TO 115
 4999 REM ***************
 5000 REM HUD display
 5001 REM ***************
 5011 PRINT AT 21,0; INVERSE 1;"N"; INVERSE 0;"-NEW GAME ";
 5012 PRINT INVERSE 1;"R"; INVERSE 0;"-RESIGN ";
 5013 PRINT INVERSE 1;"T"; INVERSE 0;"-DRAW ";
 5014 PRINT INVERSE 1;"Q"; INVERSE 0;"-END"
 5015 RETURN 
 5018 REM ***************
 5019 REM clocks
 5020 REM ***************
 5021 IF turn=0 THEN INVERSE 1
 5022 PRINT AT 1,21;"White": PRINT AT 2,21;
 5023 IF min1<10 THEN PRINT "0";
 5024 PRINT min1;":";
 5026 IF sec1<10 THEN PRINT "0";
 5028 PRINT sec1: INVERSE 0
 5031 IF turn=1 THEN INVERSE 1
 5032 PRINT AT 1,27;"Black": PRINT AT 2,27;
 5034 IF min2<10 THEN PRINT "0";
 5035 PRINT min2;":";
 5036 IF sec2<10 THEN PRINT "0";
 5038 PRINT sec2: INVERSE 0
 5040 IF turn=0 THEN LET sec1=sec1+1
 5050 IF turn=1 THEN LET sec2=sec2+1
 5055 IF sec1=60 THEN LET sec1=0: LET min1=min1+1
 5056 IF sec2=60 THEN LET sec2=0: LET min2=min2+1
 5060 RETURN 
 5099 REM ***************
 5100 REM print coordinates
 5101 REM ***************
 5110 LET aux=8: FOR i=1 TO 16 STEP 2
 5120 PRINT AT i+1,0;aux
 5125 LET aux=aux-1
 5130 NEXT i
 5140 LET aux=65: FOR i=1 TO 16 STEP 2
 5150 PRINT AT 17,i;CHR$ (aux)
 5160 LET aux=aux+1
 5170 NEXT i
 5180 RETURN 
 5197 REM *****************
 5198 REM print annotations
 5199 REM (14*2*5-1=139)
 5200 REM *****************
 5201 LET start=LEN f$-139: LET index=INT (moves-13.5)
 5202 IF start<=0 THEN LET start=1
 5203 IF index<0 THEN LET index=0
 5205 LET g$=f$(start TO ): LET aux=1
 5206 IF start<>1 AND moves>INT (moves) THEN LET aux=aux+5
 5210 FOR i=1 TO 14
 5211 LET aux2=aux
 5220 IF LEN g$>=aux+9 THEN PRINT AT 3+i,18;FN t$(index+i);" ";g$(aux TO aux+4);" ";g$(aux+5 TO aux+9): LET aux2=aux2+10: GO TO 5223
 5221 IF LEN g$>=aux+4 THEN PRINT AT 3+i,18;FN t$(index+i);" ";g$(aux TO aux+4);" ";"_____": LET aux2=aux2+5: GO TO 5223
 5222 IF LEN g$<=aux THEN PRINT AT 3+i,18;FN t$(index+i);" ";"_____";" ";"_____"
 5223 LET aux=aux2
 5230 NEXT i
 5240 RETURN 
 5299 REM ************************
 5300 REM apply move on the board
 5301 REM ************************
 5320 LET cindex=CODE (z$(1))-64
 5330 LET lindex=CODE (z$(2))-48
 5340 LET s1=(lindex-1)*8+cindex
 5350 LET prev=b(s1): LET b(s1)=33: REM blank space at origin square
 5360 LET cindex=CODE (z$(3))-64
 5370 LET lindex=CODE (z$(4))-48
 5380 LET s2=(lindex-1)*8+cindex
 5390 LET b(s2)=prev: REM origin piece at destination square
 5391 IF b(s2)>=9 AND b(s2)<=16 AND z$(4)="8" THEN LET b(s2)=4: REM white promotes as queen
 5392 IF b(s2)>=17 AND b(s2)<=24 AND z$(4)="1" THEN LET b(s2)=28: REM black promotes as queen
 5400 LET x=1+a(s1,1): LET y=1+a(s1,2): LET piece=b(s1)
 5430 LET fg=0: LET bg=8
 5440 GO SUB 6055: REM draws empty piece at origin square
 5450 LET x=1+a(s2,1): LET y=1+a(s2,2): LET piece=b(s2)
 5455 IF piece<=16 THEN LET fg=2
 5490 GO SUB 6055: REM draws piece at destination square
 5495 RETURN 
 5999 REM **********************
 6000 REM draws the whole board
 6001 REM **********************
 6005 LET bg=5
 6010 FOR s=1 TO 64
 6020 LET x=1+a(s,1)
 6030 LET y=1+a(s,2)
 6040 LET piece=b(s)
 6045 IF x<>1 THEN LET bg=(6 AND bg=5)+(5 AND bg=6)
 6046 LET fg=0: IF piece<=16 THEN LET fg=2
 6047 GO SUB 6055: REM drawing pieces
 6050 NEXT s
 6052 RETURN 
 6053 REM ***************************
 6054 REM drawing pieces subroutine
 6055 REM ***************************
 6056 IF piece>=9 AND piece<=24 THEN PRINT AT y,x; PAPER bg; INK fg;"\a\b": PRINT AT y+1,x; PAPER bg; INK fg;"\c\d": REM drawing pawn
 6057 IF piece=1 OR piece=8 OR piece=25 OR piece=32 THEN PRINT AT y,x; PAPER bg; INK fg;"\e\f": PRINT AT y+1,x; PAPER bg; INK fg;"\g\h": REM drawing rook
 6058 IF piece=2 OR piece=7 OR piece=26 OR piece=31 THEN PRINT AT y,x; PAPER bg; INK fg;"\i\j": PRINT AT y+1,x; PAPER bg; INK fg;"\k\l": REM drawing knight
 6059 IF piece=3 OR piece=6 OR piece=27 OR piece=30 THEN PRINT AT y,x; PAPER bg; INK fg;"\m\n": PRINT AT y+1,x; PAPER bg; INK fg;"\o\p": REM drawing bishop
 6060 IF piece=4 OR piece=28 THEN PRINT AT y,x; PAPER bg; INK fg;"\t\u": PRINT AT y+1,x; PAPER bg; INK fg;"\s\p": REM drawing king
 6061 IF piece=5 OR piece=29 THEN PRINT AT y,x; PAPER bg; INK fg;"\q\r": PRINT AT y+1,x; PAPER bg; INK fg;"\s\p": REM drawing queen
 6062 IF piece=33 THEN PRINT AT y,x; PAPER bg; INK fg;"  ": PRINT AT y+1,x; PAPER bg; INK fg;"  ": REM drawing blank space
 6090 RETURN 
 6999 REM *****************
 7000 REM game variables
 7001 REM *****************
 7010 DIM a(64,2): REM mapping square_coords
 7030 DIM b(64): REM mapping square_piece
 7074 LET turn=0: LET f$="": LET moves=0: LET t1=0: LET t2=0: LET sec1=0: LET min1=0: LET sec2=0: LET min2=0
 7100 FOR i=1 TO 64
 7110 LET y=14-(INT ((i-1)/8))*2
 7120 LET x=((i-1)-(INT ((i-1)/8)*8))*2
 7130 LET a(i,1)=x
 7140 LET a(i,2)=y
 7141 IF i>=1 AND i<=16 THEN LET b(i)=i
 7142 IF i>=17 AND i<=48 THEN LET b(i)=33
 7143 IF i>=49 AND i<=64 THEN LET b(i)=(i-48)+16
 7320 NEXT i
 7998 RETURN 
 7999 REM ****************
 8000 REM UDGs graphics
 8001 REM ****************
 8002 RESTORE 8000: FOR z=USR "a" TO USR "u"+7
 8003 READ user: POKE z,user
 8004 NEXT z
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
 8770 REM \a\b\e\f\i\j\m\n\q\r SPECTRUM PLAY 
 8780 REM \c\d\g\h\k\l\o\p\s\p\s\p
 8790 RETURN 
 8999 REM ******************
 9000 REM proxy connection
 9001 REM ******************
 9005 PRINT AT 19,5; FLASH 1;"CONNECTING WITH PROXY"; FLASH 0
 9006 INPUT "CHOOSE WHITE OR BLACK (W/B): "; LINE z$
 9007 IF z$="w" OR  z$="W" THEN LET port=2500: LET player=0: GO TO 9010
 9008 IF z$="b" OR z$="B" THEN LET port=2501: LET player=1: GO TO 9010
 9009 GO TO 9006
 9010 %connect #4,"tuxe.es",port
 9020 %oneof 9200
 9030 PRINT #4;"ping": PRINT AT 19,5;"WAITING FOR PEER",
 9040 %control #5
 9050 PRINT #5;"p": INPUT #5;j;j$
 9060 IF j$="disconn" THEN GO TO 9200
 9070 IF j=4 AND j$="recv" THEN INPUT #4;z$: IF z$="ping" THEN PRINT AT 19,5;"PLAYING...",,: GO TO 115
 9080 LET z$=INKEY$
 9090 IF z$="n" OR z$="N" THEN %close #4: CLS : GO TO 30
 9095 IF z$="q" OR z$="Q" THEN %close #4: STOP 
 9100 GO TO 9050
 9200 %close #4: PRINT AT 19,5;"REMOTE LOST CONNECTION": PAUSE 0: CLS : GO TO 30 
