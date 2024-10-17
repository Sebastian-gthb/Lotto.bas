TYPE Datensatz
    te AS STRING * 1
END TYPE
DIM by AS Datensatz
DIM SHARED InterFeld(0 TO 34) AS INTEGER
DIM SHARED OutregBx AS INTEGER
DIM SHARED OutregCx AS INTEGER
DIM SHARED OutregDx AS INTEGER
DIM SHARED tip1(1 TO 6) AS INTEGER
DIM SHARED tip2(1 TO 6) AS INTEGER
DIM SHARED tip3(1 TO 6) AS INTEGER
DIM SHARED tip4(1 TO 6) AS INTEGER
DIM SHARED tip5(1 TO 6) AS INTEGER
DIM SHARED tip6(1 TO 6) AS INTEGER
DIM SHARED tip7(1 TO 6) AS INTEGER
DIM SHARED tip8(1 TO 6) AS INTEGER
DIM SHARED tip9(1 TO 6) AS INTEGER
DIM SHARED tip10(1 TO 6) AS INTEGER
DIM kreutz(1 TO 92) AS INTEGER
DIM richtig(1 TO 92) AS INTEGER
DIM rzz(1 TO 92) AS INTEGER
DIM x AS LONG
DIM y AS LONG
DECLARE SUB InitInterrupt ()
DECLARE SUB INTERRUPT (Nr%, iax%, ibx%, icx%, idx%)
CALL InitInterrupt
DEF SEG = VARSEG(kreutz(1))
BLOAD "lotto2.dat", VARPTR(kreutz(1))
DEF SEG

SCREEN 12
PALETTE 6, 0
LINE (0, 0)-(20, 20), 6, BF
GET (0, 0)-(10, 8), richtig
PALETTE 3, 0
LINE (0, 0)-(20, 20), 3, BF
GET (0, 0)-(10, 8), rzz
PALETTE
CLS
LINE (0, 0)-(639, 479), 15, BF
DEF SEG = &HA000
BLOAD "lotto1.dat", 0
DEF SEG

LINE (35, 375)-(135, 375), 1
LINE -(135, 470), 1
LINE -(40, 470), 1
LINE -(35, 465), 1
LINE -(35, 375), 1
PAINT (40, 400), 1
PSET (35, 375), 15
PSET (135, 375), 15
PSET (135, 470), 15
LINE (39, 381)-(44, 385), 15, BF
LINE (131, 381)-(126, 385), 0, BF
LINE (48, 375)-(122, 385), 7, BF
LINE (48, 386)-(122, 430), 15, BF
LINE (48, 395)-(122, 395), 7
LINE (48, 405)-(122, 405), 7
LINE (48, 415)-(122, 415), 7
LINE (48, 425)-(122, 425), 7
LINE (60, 440)-(110, 470), 7, BF
LINE (67, 443)-(80, 465), 1, BF

LINE (39, 419)-(81, 441), 7, BF
LINE (41, 421)-(79, 439), 8, BF
PSET (41, 421), 7
PSET (41, 439), 7
PSET (79, 439), 7
PSET (79, 421), 7
PSET (39, 419), 1
PSET (39, 441), 1
PSET (81, 419), 15

LINE (89, 419)-(131, 441), 7, BF
LINE (91, 421)-(129, 439), 8, BF
PSET (91, 421), 7
PSET (91, 439), 7
PSET (129, 439), 7
PSET (129, 421), 7
PSET (89, 419), 15
PSET (131, 441), 1
PSET (131, 419), 1

LINE (149, 419)-(191, 441), 7, BF
LINE (151, 421)-(189, 439), 8, BF
PSET (151, 421), 7
PSET (151, 439), 7
PSET (189, 439), 7
PSET (189, 421), 7
PSET (149, 419), 15
PSET (149, 441), 15
PSET (191, 441), 15
PSET (191, 419), 15

LINE (249, 419)-(291, 441), 7, BF
LINE (251, 421)-(289, 439), 8, BF
PSET (251, 421), 7
PSET (251, 439), 7
PSET (289, 439), 7
PSET (289, 421), 7
PSET (249, 419), 15
PSET (249, 441), 15
PSET (291, 441), 15
PSET (291, 419), 15

LINE (539, 419)-(581, 441), 7, BF
LINE (541, 421)-(579, 439), 8, BF
PSET (541, 421), 7
PSET (541, 439), 7
PSET (579, 439), 7
PSET (579, 421), 7
PSET (539, 419), 15
PSET (539, 441), 15
PSET (581, 441), 15
PSET (581, 419), 15

LOCATE 26, 7: PRINT "Save"
LOCATE 26, 13: PRINT "Load"
LOCATE 26, 21: PRINT "NEU"
LOCATE 26, 30: PRINT "Vergleich"
LOCATE 26, 69: PRINT "Ende"

eins = 1
zwei = 2
drei = 3
vier = 4
fuenf = 5
sechs = 6
zz = 7
sz = 8
LINE (72, 290)-(262, 333), 10, B
LINE (95, 290)-(119, 333), 10, B
LINE (143, 290)-(167, 333), 10, B
LINE (191, 290)-(215, 333), 10, B
LINE (214, 290)-(214, 333), 10
LINE (215, 290)-(238, 333), 11, B
LINE (239, 290)-(262, 333), 12, B
PAINT (80, 310), 2, 10
PAINT (100, 310), 2, 10
PAINT (120, 310), 2, 10
PAINT (150, 310), 2, 10
PAINT (170, 310), 2, 10
PAINT (200, 310), 2, 10
PAINT (220, 310), 1, 11
PAINT (240, 310), 4, 12
LOCATE 20, 10: PRINT eins
LOCATE 20, 13: PRINT zwei
LOCATE 20, 16: PRINT drei
LOCATE 20, 19: PRINT vier
LOCATE 20, 22: PRINT fuenf
LOCATE 20, 25: PRINT sechs
LOCATE 20, 28: PRINT zz
LOCATE 20, 31: PRINT sz
CALL INTERRUPT(&H33, &H7, 0, 0, 640)
CALL INTERRUPT(&H33, &H8, 0, 0, 480)
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
DO
CALL INTERRUPT(&H33, &H3, 0, 0, 0)
IF OutregBx >= 1 AND OutregCx > 68 AND OutregCx < 166 AND OutregDx > 66 AND OutregDx < 150 THEN tip = 1: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 169 AND OutregCx < 267 AND OutregDx > 66 AND OutregDx < 150 THEN tip = 3: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 270 AND OutregCx < 368 AND OutregDx > 66 AND OutregDx < 150 THEN tip = 5: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 371 AND OutregCx < 469 AND OutregDx > 66 AND OutregDx < 150 THEN tip = 7: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 472 AND OutregCx < 570 AND OutregDx > 66 AND OutregDx < 150 THEN tip = 9: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 68 AND OutregCx < 166 AND OutregDx > 153 AND OutregDx < 237 THEN tip = 2: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 169 AND OutregCx < 267 AND OutregDx > 153 AND OutregDx < 237 THEN tip = 4: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 270 AND OutregCx < 368 AND OutregDx > 153 AND OutregDx < 237 THEN tip = 6: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 371 AND OutregCx < 469 AND OutregDx > 153 AND OutregDx < 237 THEN tip = 8: GOSUB kreuze
IF OutregBx >= 1 AND OutregCx > 472 AND OutregCx < 570 AND OutregDx > 153 AND OutregDx < 237 THEN tip = 10: GOSUB kreuze

IF OutregBx = 1 AND OutregCx > 70 AND OutregCx < 287 AND OutregDx > 288 AND OutregDx < 333 THEN tip = 1: GOSUB zahlen

Esc$ = INKEY$
IF OutregBx = 1 AND OutregCx > 39 AND OutregCx < 81 AND OutregDx > 419 AND OutregDx < 441 THEN GOSUB saven
IF Esc$ = "s" OR Esc$ = "S" THEN GOSUB saven

IF OutregBx = 1 AND OutregCx > 89 AND OutregCx < 131 AND OutregDx > 419 AND OutregDx < 441 THEN GOSUB laden
IF Esc$ = "l" OR Esc$ = "L" THEN GOSUB laden

IF OutregBx = 1 AND OutregCx > 149 AND OutregCx < 191 AND OutregDx > 419 AND OutregDx < 441 THEN GOSUB new
IF Esc$ = "n" OR Esc$ = "N" THEN GOSUB new

IF OutregBx = 1 AND OutregCx > 249 AND OutregCx < 291 AND OutregDx > 419 AND OutregDx < 441 THEN GOSUB vergleich
IF Esc$ = "v" OR Esc$ = "V" THEN GOSUB vergleich

IF OutregBx = 1 AND OutregCx > 539 AND OutregCx < 581 AND OutregDx > 419 AND OutregDx < 441 THEN GOTO 10
IF Esc$ = CHR$(27) THEN GOTO 10
PLAY "P20"
LOOP
10

CALL INTERRUPT(&H33, &H2, 0, 0, 0)
SCREEN 9
SCREEN 0
END

kreuze:
IF tip = 1 THEN x = FIX((OutregCx - 69) / 14) + 1: y = FIX((OutregDx - 67) / 12)
IF tip = 3 THEN x = FIX((OutregCx - 170) / 14) + 1: y = FIX((OutregDx - 67) / 12)
IF tip = 5 THEN x = FIX((OutregCx - 271) / 14) + 1: y = FIX((OutregDx - 67) / 12)
IF tip = 7 THEN x = FIX((OutregCx - 372) / 14) + 1: y = FIX((OutregDx - 67) / 12)
IF tip = 9 THEN x = FIX((OutregCx - 473) / 14) + 1: y = FIX((OutregDx - 67) / 12)
IF tip = 2 THEN x = FIX((OutregCx - 69) / 14) + 1: y = FIX((OutregDx - 154) / 12)
IF tip = 4 THEN x = FIX((OutregCx - 170) / 14) + 1: y = FIX((OutregDx - 154) / 12)
IF tip = 6 THEN x = FIX((OutregCx - 271) / 14) + 1: y = FIX((OutregDx - 154) / 12)
IF tip = 8 THEN x = FIX((OutregCx - 372) / 14) + 1: y = FIX((OutregDx - 154) / 12)
IF tip = 10 THEN x = FIX((OutregCx - 473) / 14) + 1: y = FIX((OutregDx - 154) / 12)
zahl = 7 * y + x
IF OutregBx = 1 THEN GOTO 205
IF OutregBx > 1 THEN GOSUB weg: GOTO 20
205
IF tip = 1 THEN GOTO 30
IF tip = 2 THEN GOTO 40
IF tip = 3 THEN GOTO 50
IF tip = 4 THEN GOTO 60
IF tip = 5 THEN GOTO 70
IF tip = 6 THEN GOTO 80
IF tip = 7 THEN GOTO 90
IF tip = 8 THEN GOTO 100
IF tip = 9 THEN GOTO 110
IF tip = 10 THEN GOTO 120
30
IF zahl = tip1(1) OR zahl = tip1(2) OR zahl = tip1(3) OR zahl = tip1(4) THEN GOTO 20
IF zahl = tip1(5) OR zahl = tip1(6) THEN GOTO 20
IF tip1(1) = 0 THEN tip1(1) = zahl: krz = 1: GOTO 20
IF tip1(2) = 0 THEN tip1(2) = zahl: krz = 1: GOTO 20
IF tip1(3) = 0 THEN tip1(3) = zahl: krz = 1: GOTO 20
IF tip1(4) = 0 THEN tip1(4) = zahl: krz = 1: GOTO 20
IF tip1(5) = 0 THEN tip1(5) = zahl: krz = 1: GOTO 20
IF tip1(6) = 0 THEN tip1(6) = zahl: krz = 1: GOTO 20
GOTO 20
40
IF zahl = tip2(1) OR zahl = tip2(2) OR zahl = tip2(3) OR zahl = tip2(4) THEN GOTO 20
IF zahl = tip2(5) OR zahl = tip2(6) THEN GOTO 20
IF tip2(1) = 0 THEN tip2(1) = zahl: krz = 1: GOTO 20
IF tip2(2) = 0 THEN tip2(2) = zahl: krz = 1: GOTO 20
IF tip2(3) = 0 THEN tip2(3) = zahl: krz = 1: GOTO 20
IF tip2(4) = 0 THEN tip2(4) = zahl: krz = 1: GOTO 20
IF tip2(5) = 0 THEN tip2(5) = zahl: krz = 1: GOTO 20
IF tip2(6) = 0 THEN tip2(6) = zahl: krz = 1: GOTO 20
GOTO 20
50
IF zahl = tip3(1) OR zahl = tip3(2) OR zahl = tip3(3) OR zahl = tip3(4) THEN GOTO 20
IF zahl = tip3(5) OR zahl = tip3(6) THEN GOTO 20
IF tip3(1) = 0 THEN tip3(1) = zahl: krz = 1: GOTO 20
IF tip3(2) = 0 THEN tip3(2) = zahl: krz = 1: GOTO 20
IF tip3(3) = 0 THEN tip3(3) = zahl: krz = 1: GOTO 20
IF tip3(4) = 0 THEN tip3(4) = zahl: krz = 1: GOTO 20
IF tip3(5) = 0 THEN tip3(5) = zahl: krz = 1: GOTO 20
IF tip3(6) = 0 THEN tip3(6) = zahl: krz = 1: GOTO 20
GOTO 20
60
IF zahl = tip4(1) OR zahl = tip4(2) OR zahl = tip4(3) OR zahl = tip4(4) THEN GOTO 20
IF zahl = tip4(5) OR zahl = tip4(6) THEN GOTO 20
IF tip4(1) = 0 THEN tip4(1) = zahl: krz = 1: GOTO 20
IF tip4(2) = 0 THEN tip4(2) = zahl: krz = 1: GOTO 20
IF tip4(3) = 0 THEN tip4(3) = zahl: krz = 1: GOTO 20
IF tip4(4) = 0 THEN tip4(4) = zahl: krz = 1: GOTO 20
IF tip4(5) = 0 THEN tip4(5) = zahl: krz = 1: GOTO 20
IF tip4(6) = 0 THEN tip4(6) = zahl: krz = 1: GOTO 20
GOTO 20
70
IF zahl = tip5(1) OR zahl = tip5(2) OR zahl = tip5(3) OR zahl = tip5(4) THEN GOTO 20
IF zahl = tip5(5) OR zahl = tip5(6) THEN GOTO 20
IF tip5(1) = 0 THEN tip5(1) = zahl: krz = 1: GOTO 20
IF tip5(2) = 0 THEN tip5(2) = zahl: krz = 1: GOTO 20
IF tip5(3) = 0 THEN tip5(3) = zahl: krz = 1: GOTO 20
IF tip5(4) = 0 THEN tip5(4) = zahl: krz = 1: GOTO 20
IF tip5(5) = 0 THEN tip5(5) = zahl: krz = 1: GOTO 20
IF tip5(6) = 0 THEN tip5(6) = zahl: krz = 1: GOTO 20
GOTO 20
80
IF zahl = tip6(1) OR zahl = tip6(2) OR zahl = tip6(3) OR zahl = tip6(4) THEN GOTO 20
IF zahl = tip6(5) OR zahl = tip6(6) THEN GOTO 20
IF tip6(1) = 0 THEN tip6(1) = zahl: krz = 1: GOTO 20
IF tip6(2) = 0 THEN tip6(2) = zahl: krz = 1: GOTO 20
IF tip6(3) = 0 THEN tip6(3) = zahl: krz = 1: GOTO 20
IF tip6(4) = 0 THEN tip6(4) = zahl: krz = 1: GOTO 20
IF tip6(5) = 0 THEN tip6(5) = zahl: krz = 1: GOTO 20
IF tip6(6) = 0 THEN tip6(6) = zahl: krz = 1: GOTO 20
GOTO 20
90
IF zahl = tip7(1) OR zahl = tip7(2) OR zahl = tip7(3) OR zahl = tip7(4) THEN GOTO 20
IF zahl = tip7(5) OR zahl = tip7(6) THEN GOTO 20
IF tip7(1) = 0 THEN tip7(1) = zahl: krz = 1: GOTO 20
IF tip7(2) = 0 THEN tip7(2) = zahl: krz = 1: GOTO 20
IF tip7(3) = 0 THEN tip7(3) = zahl: krz = 1: GOTO 20
IF tip7(4) = 0 THEN tip7(4) = zahl: krz = 1: GOTO 20
IF tip7(5) = 0 THEN tip7(5) = zahl: krz = 1: GOTO 20
IF tip7(6) = 0 THEN tip7(6) = zahl: krz = 1: GOTO 20
GOTO 20
100
IF zahl = tip8(1) OR zahl = tip8(2) OR zahl = tip8(3) OR zahl = tip8(4) THEN GOTO 20
IF zahl = tip8(5) OR zahl = tip8(6) THEN GOTO 20
IF tip8(1) = 0 THEN tip8(1) = zahl: krz = 1: GOTO 20
IF tip8(2) = 0 THEN tip8(2) = zahl: krz = 1: GOTO 20
IF tip8(3) = 0 THEN tip8(3) = zahl: krz = 1: GOTO 20
IF tip8(4) = 0 THEN tip8(4) = zahl: krz = 1: GOTO 20
IF tip8(5) = 0 THEN tip8(5) = zahl: krz = 1: GOTO 20
IF tip8(6) = 0 THEN tip8(6) = zahl: krz = 1: GOTO 20
GOTO 20
110
IF zahl = tip9(1) OR zahl = tip9(2) OR zahl = tip9(3) OR zahl = tip9(4) THEN GOTO 20
IF zahl = tip9(5) OR zahl = tip9(6) THEN GOTO 20
IF tip9(1) = 0 THEN tip9(1) = zahl: krz = 1: GOTO 20
IF tip9(2) = 0 THEN tip9(2) = zahl: krz = 1: GOTO 20
IF tip9(3) = 0 THEN tip9(3) = zahl: krz = 1: GOTO 20
IF tip9(4) = 0 THEN tip9(4) = zahl: krz = 1: GOTO 20
IF tip9(5) = 0 THEN tip9(5) = zahl: krz = 1: GOTO 20
IF tip9(6) = 0 THEN tip9(6) = zahl: krz = 1: GOTO 20
GOTO 20
120
IF zahl = tip10(1) OR zahl = tip10(2) OR zahl = tip10(3) OR zahl = tip10(4) THEN GOTO 20
IF zahl = tip10(5) OR zahl = tip10(6) THEN GOTO 20
IF tip10(1) = 0 THEN tip10(1) = zahl: krz = 1: GOTO 20
IF tip10(2) = 0 THEN tip10(2) = zahl: krz = 1: GOTO 20
IF tip10(3) = 0 THEN tip10(3) = zahl: krz = 1: GOTO 20
IF tip10(4) = 0 THEN tip10(4) = zahl: krz = 1: GOTO 20
IF tip10(5) = 0 THEN tip10(5) = zahl: krz = 1: GOTO 20
IF tip10(6) = 0 THEN tip10(6) = zahl: krz = 1: GOTO 20
GOTO 20
20
CALL INTERRUPT(&H33, &H2, 0, 0, 0)
IF tip = 1 THEN x = 70 + (x - 1) * 14: y = 68 + y * 12
IF tip = 3 THEN x = 171 + (x - 1) * 14: y = 68 + y * 12
IF tip = 5 THEN x = 272 + (x - 1) * 14: y = 68 + y * 12
IF tip = 7 THEN x = 373 + (x - 1) * 14: y = 68 + y * 12
IF tip = 9 THEN x = 474 + (x - 1) * 14: y = 68 + y * 12
IF tip = 2 THEN x = 70 + (x - 1) * 14: y = 155 + y * 12
IF tip = 4 THEN x = 171 + (x - 1) * 14: y = 155 + y * 12
IF tip = 6 THEN x = 272 + (x - 1) * 14: y = 155 + y * 12
IF tip = 8 THEN x = 373 + (x - 1) * 14: y = 155 + y * 12
IF tip = 10 THEN x = 474 + (x - 1) * 14: y = 155 + y * 12
IF krz = 1 THEN PUT (x, y), kreutz, XOR: krz = 0
CALL INTERRUPT(&H33, &H7, 0, 0, 640)
CALL INTERRUPT(&H33, &H8, 0, 0, 480)
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
RETURN

weg:
IF tip = 1 THEN GOTO 130
IF tip = 2 THEN GOTO 140
IF tip = 3 THEN GOTO 150
IF tip = 4 THEN GOTO 160
IF tip = 5 THEN GOTO 170
IF tip = 6 THEN GOTO 180
IF tip = 7 THEN GOTO 190
IF tip = 8 THEN GOTO 200
IF tip = 9 THEN GOTO 210
IF tip = 10 THEN GOTO 220
130
IF tip1(1) = zahl THEN tip1(1) = 0: krz = 1: GOTO 230
IF tip1(2) = zahl THEN tip1(2) = 0: krz = 1: GOTO 230
IF tip1(3) = zahl THEN tip1(3) = 0: krz = 1: GOTO 230
IF tip1(4) = zahl THEN tip1(4) = 0: krz = 1: GOTO 230
IF tip1(5) = zahl THEN tip1(5) = 0: krz = 1: GOTO 230
IF tip1(6) = zahl THEN tip1(6) = 0: krz = 1: GOTO 230
GOTO 230
140
IF tip2(1) = zahl THEN tip2(1) = 0: krz = 1: GOTO 230
IF tip2(2) = zahl THEN tip2(2) = 0: krz = 1: GOTO 230
IF tip2(3) = zahl THEN tip2(3) = 0: krz = 1: GOTO 230
IF tip2(4) = zahl THEN tip2(4) = 0: krz = 1: GOTO 230
IF tip2(5) = zahl THEN tip2(5) = 0: krz = 1: GOTO 230
IF tip2(6) = zahl THEN tip2(6) = 0: krz = 1: GOTO 230
GOTO 230
150
IF tip3(1) = zahl THEN tip3(1) = 0: krz = 1: GOTO 230
IF tip3(2) = zahl THEN tip3(2) = 0: krz = 1: GOTO 230
IF tip3(3) = zahl THEN tip3(3) = 0: krz = 1: GOTO 230
IF tip3(4) = zahl THEN tip3(4) = 0: krz = 1: GOTO 230
IF tip3(5) = zahl THEN tip3(5) = 0: krz = 1: GOTO 230
IF tip3(6) = zahl THEN tip3(6) = 0: krz = 1: GOTO 230
GOTO 230
160
IF tip4(1) = zahl THEN tip4(1) = 0: krz = 1: GOTO 230
IF tip4(2) = zahl THEN tip4(2) = 0: krz = 1: GOTO 230
IF tip4(3) = zahl THEN tip4(3) = 0: krz = 1: GOTO 230
IF tip4(4) = zahl THEN tip4(4) = 0: krz = 1: GOTO 230
IF tip4(5) = zahl THEN tip4(5) = 0: krz = 1: GOTO 230
IF tip4(6) = zahl THEN tip4(6) = 0: krz = 1: GOTO 230
GOTO 230
170
IF tip5(1) = zahl THEN tip5(1) = 0: krz = 1: GOTO 230
IF tip5(2) = zahl THEN tip5(2) = 0: krz = 1: GOTO 230
IF tip5(3) = zahl THEN tip5(3) = 0: krz = 1: GOTO 230
IF tip5(4) = zahl THEN tip5(4) = 0: krz = 1: GOTO 230
IF tip5(5) = zahl THEN tip5(5) = 0: krz = 1: GOTO 230
IF tip5(6) = zahl THEN tip5(6) = 0: krz = 1: GOTO 230
GOTO 230
180
IF tip6(1) = zahl THEN tip6(1) = 0: krz = 1: GOTO 230
IF tip6(2) = zahl THEN tip6(2) = 0: krz = 1: GOTO 230
IF tip6(3) = zahl THEN tip6(3) = 0: krz = 1: GOTO 230
IF tip6(4) = zahl THEN tip6(4) = 0: krz = 1: GOTO 230
IF tip6(5) = zahl THEN tip6(5) = 0: krz = 1: GOTO 230
IF tip6(6) = zahl THEN tip6(6) = 0: krz = 1: GOTO 230
GOTO 230
190
IF tip7(1) = zahl THEN tip7(1) = 0: krz = 1: GOTO 230
IF tip7(2) = zahl THEN tip7(2) = 0: krz = 1: GOTO 230
IF tip7(3) = zahl THEN tip7(3) = 0: krz = 1: GOTO 230
IF tip7(4) = zahl THEN tip7(4) = 0: krz = 1: GOTO 230
IF tip7(5) = zahl THEN tip7(5) = 0: krz = 1: GOTO 230
IF tip7(6) = zahl THEN tip7(6) = 0: krz = 1: GOTO 230
GOTO 230
200
IF tip8(1) = zahl THEN tip8(1) = 0: krz = 1: GOTO 230
IF tip8(2) = zahl THEN tip8(2) = 0: krz = 1: GOTO 230
IF tip8(3) = zahl THEN tip8(3) = 0: krz = 1: GOTO 230
IF tip8(4) = zahl THEN tip8(4) = 0: krz = 1: GOTO 230
IF tip8(5) = zahl THEN tip8(5) = 0: krz = 1: GOTO 230
IF tip8(6) = zahl THEN tip8(6) = 0: krz = 1: GOTO 230
GOTO 230
210
IF tip9(1) = zahl THEN tip9(1) = 0: krz = 1: GOTO 230
IF tip9(2) = zahl THEN tip9(2) = 0: krz = 1: GOTO 230
IF tip9(3) = zahl THEN tip9(3) = 0: krz = 1: GOTO 230
IF tip9(4) = zahl THEN tip9(4) = 0: krz = 1: GOTO 230
IF tip9(5) = zahl THEN tip9(5) = 0: krz = 1: GOTO 230
IF tip9(6) = zahl THEN tip9(6) = 0: krz = 1: GOTO 230
GOTO 230
220
IF tip10(1) = zahl THEN tip10(1) = 0: krz = 1: GOTO 230
IF tip10(2) = zahl THEN tip10(2) = 0: krz = 1: GOTO 230
IF tip10(3) = zahl THEN tip10(3) = 0: krz = 1: GOTO 230
IF tip10(4) = zahl THEN tip10(4) = 0: krz = 1: GOTO 230
IF tip10(5) = zahl THEN tip10(5) = 0: krz = 1: GOTO 230
IF tip10(6) = zahl THEN tip10(6) = 0: krz = 1: GOTO 230
230
RETURN


saven:
OPEN "lotto.sav" FOR BINARY AS #1
p = 1
FOR i% = 1 TO 6
a$ = CHR$(tip1(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip2(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip3(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip4(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip5(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip6(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip7(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip8(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip9(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
FOR i% = 1 TO 6
a$ = CHR$(tip10(i%))
PUT #1, p, a$
p = p + 1
NEXT i%
CLOSE #1
RETURN

laden:
OPEN "lotto.sav" FOR BINARY AS #1
p = 1
FOR i% = 1 TO 6
GET #1, p, by
tip1(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip2(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip3(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip4(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip5(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip6(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip7(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip8(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip9(i%) = ASC(by.te)
p = p + 1
NEXT i%
FOR i% = 1 TO 6
GET #1, p, by
tip10(i%) = ASC(by.te)
p = p + 1
NEXT i%
CLOSE #1
CALL INTERRUPT(&H33, &H2, 0, 0, 0)
DEF SEG = &HA000
BLOAD "lotto1.dat", 0
DEF SEG
FOR i% = 1 TO 6
IF tip1(i%) = 0 THEN GOTO 300
y = FIX((tip1(i%) - 1) / 7)
x = (tip1(i%) - 7 * y) - 1
x = 70 + x * 14
y = 68 + y * 12
PUT (x, y), kreutz, XOR
300
NEXT i%
FOR i% = 1 TO 6
IF tip2(i%) = 0 THEN GOTO 301
y = FIX((tip2(i%) - 1) / 7)
x = (tip2(i%) - 7 * y) - 1
x = 70 + x * 14
y = 155 + y * 12
PUT (x, y), kreutz, XOR
301
NEXT i%
FOR i% = 1 TO 6
IF tip3(i%) = 0 THEN GOTO 302
y = FIX((tip3(i%) - 1) / 7)
x = (tip3(i%) - 7 * y) - 1
x = 171 + x * 14
y = 68 + y * 12
PUT (x, y), kreutz, XOR
302
NEXT i%
FOR i% = 1 TO 6
IF tip4(i%) = 0 THEN GOTO 303
y = FIX((tip4(i%) - 1) / 7)
x = (tip4(i%) - 7 * y) - 1
x = 171 + x * 14
y = 155 + y * 12
PUT (x, y), kreutz, XOR
303
NEXT i%
FOR i% = 1 TO 6
IF tip5(i%) = 0 THEN GOTO 304
y = FIX((tip5(i%) - 1) / 7)
x = (tip5(i%) - 7 * y) - 1
x = 272 + x * 14
y = 68 + y * 12
PUT (x, y), kreutz, XOR
304
NEXT i%
FOR i% = 1 TO 6
IF tip6(i%) = 0 THEN GOTO 305
y = FIX((tip6(i%) - 1) / 7)
x = (tip6(i%) - 7 * y) - 1
x = 272 + x * 14
y = 155 + y * 12
PUT (x, y), kreutz, XOR
305
NEXT i%
FOR i% = 1 TO 6
IF tip7(i%) = 0 THEN GOTO 306
y = FIX((tip7(i%) - 1) / 7)
x = (tip7(i%) - 7 * y) - 1
x = 373 + x * 14
y = 68 + y * 12
PUT (x, y), kreutz, XOR
306
NEXT i%
FOR i% = 1 TO 6
IF tip8(i%) = 0 THEN GOTO 307
y = FIX((tip8(i%) - 1) / 7)
x = (tip8(i%) - 7 * y) - 1
x = 373 + x * 14
y = 155 + y * 12
PUT (x, y), kreutz, XOR
307
NEXT i%
FOR i% = 1 TO 6
IF tip9(i%) = 0 THEN GOTO 308
y = FIX((tip9(i%) - 1) / 7)
x = (tip9(i%) - 7 * y) - 1
x = 474 + x * 14
y = 68 + y * 12
PUT (x, y), kreutz, XOR
308
NEXT i%
FOR i% = 1 TO 6
IF tip10(i%) = 0 THEN GOTO 309
y = FIX((tip10(i%) - 1) / 7)
x = (tip10(i%) - 7 * y) - 1
x = 474 + x * 14
y = 155 + y * 12
PUT (x, y), kreutz, XOR
309
NEXT i%
CALL INTERRUPT(&H33, &H7, 0, 0, 640)
CALL INTERRUPT(&H33, &H8, 0, 0, 480)
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
RETURN

new:
CALL INTERRUPT(&H33, &H2, 0, 0, 0)
DEF SEG = &HA000
BLOAD "lotto1.dat", 0
DEF SEG
FOR i% = 1 TO 6
tip1(i%) = 0
tip2(i%) = 0
tip3(i%) = 0
tip4(i%) = 0
tip5(i%) = 0
tip6(i%) = 0
tip7(i%) = 0
tip8(i%) = 0
tip9(i%) = 0
tip10(i%) = 0
NEXT i%
CALL INTERRUPT(&H33, &H7, 0, 0, 640)
CALL INTERRUPT(&H33, &H8, 0, 0, 480)
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
RETURN

zahlen:
IF OutregCx > 70 AND OutregCx < 94 AND OutregDx > 288 AND OutregDx < 303 THEN eins = eins + 1
IF OutregCx > 93 AND OutregCx < 118 AND OutregDx > 288 AND OutregDx < 303 THEN zwei = zwei + 1
IF OutregCx > 117 AND OutregCx < 142 AND OutregDx > 288 AND OutregDx < 303 THEN drei = drei + 1
IF OutregCx > 141 AND OutregCx < 166 AND OutregDx > 288 AND OutregDx < 303 THEN vier = vier + 1
IF OutregCx > 165 AND OutregCx < 190 AND OutregDx > 288 AND OutregDx < 303 THEN fuenf = fuenf + 1
IF OutregCx > 189 AND OutregCx < 214 AND OutregDx > 288 AND OutregDx < 303 THEN sechs = sechs + 1
IF OutregCx > 213 AND OutregCx < 238 AND OutregDx > 288 AND OutregDx < 303 THEN zz = zz + 1
IF OutregCx > 237 AND OutregCx < 262 AND OutregDx > 288 AND OutregDx < 303 THEN sz = sz + 1

IF OutregCx > 70 AND OutregCx < 94 AND OutregDx > 317 AND OutregDx < 333 THEN eins = eins - 1
IF OutregCx > 93 AND OutregCx < 118 AND OutregDx > 317 AND OutregDx < 333 THEN zwei = zwei - 1
IF OutregCx > 117 AND OutregCx < 142 AND OutregDx > 317 AND OutregDx < 333 THEN drei = drei - 1
IF OutregCx > 141 AND OutregCx < 166 AND OutregDx > 317 AND OutregDx < 333 THEN vier = vier - 1
IF OutregCx > 165 AND OutregCx < 190 AND OutregDx > 317 AND OutregDx < 333 THEN fuenf = fuenf - 1
IF OutregCx > 189 AND OutregCx < 214 AND OutregDx > 317 AND OutregDx < 333 THEN sechs = sechs - 1
IF OutregCx > 213 AND OutregCx < 238 AND OutregDx > 317 AND OutregDx < 333 THEN zz = zz - 1
IF OutregCx > 237 AND OutregCx < 262 AND OutregDx > 317 AND OutregDx < 333 THEN sz = sz - 1

IF eins > 49 THEN eins = 1
IF zwei > 49 THEN zwei = 1
IF drei > 49 THEN drei = 1
IF vier > 49 THEN vier = 1
IF fuenf > 49 THEN fuenf = 1
IF sechs > 49 THEN sechs = 1
IF zz > 49 THEN zz = 1
IF sz > 9 THEN sz = 0

IF eins < 1 THEN eins = 49
IF zwei < 1 THEN zwei = 49
IF drei < 1 THEN drei = 49
IF vier < 1 THEN vier = 49
IF fuenf < 1 THEN fuenf = 49
IF sechs < 1 THEN sechs = 49
IF zz < 1 THEN zz = 49
IF sz < 0 THEN sz = 9

CALL INTERRUPT(&H33, &H2, 0, 0, 0)
LOCATE 20, 10: PRINT eins
LOCATE 20, 13: PRINT zwei
LOCATE 20, 16: PRINT drei
LOCATE 20, 19: PRINT vier
LOCATE 20, 22: PRINT fuenf
LOCATE 20, 25: PRINT sechs
LOCATE 20, 28: PRINT zz
LOCATE 20, 31: PRINT sz
FOR i = 1 TO 400: NEXT i
CALL INTERRUPT(&H33, &H7, 0, 0, 640)
CALL INTERRUPT(&H33, &H8, 0, 0, 480)
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
RETURN

vergleich:
IF eins = zwei OR eins = drei OR eins = vier OR eins = fuenf THEN GOSUB fehler: GOTO 15
IF eins = sechs OR eins = zz OR zwei = drei OR zwei = vier OR zwei = fuenf THEN GOSUB fehler: GOTO 15
IF zwei = sechs OR zwei = zz OR drei = vier OR drei = fuenf OR drei = sechs THEN GOSUB fehler: GOTO 15
IF drei = zz OR vier = fuenf OR vier = sechs OR vier = zz OR fuenf = sechs THEN GOSUB fehler: GOTO 15
IF fuenf = zz OR sechs = zz THEN GOSUB fehler: GOTO 15
numer(1) = eins
numer(2) = zwei
numer(3) = drei
numer(4) = vier
numer(5) = fuenf
numer(6) = sechs
numer(7) = zz
CALL INTERRUPT(&H33, &H2, 0, 0, 0)
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip1(i%) <> numer(j%) THEN GOTO 400
y = FIX((tip1(i%) - 1) / 7)
x = (tip1(i%) - 7 * y) - 1
x = 71 + x * 14
y = 69 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
400
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip2(i%) <> numer(j%) THEN GOTO 401
y = FIX((tip2(i%) - 1) / 7)
x = (tip2(i%) - 7 * y) - 1
x = 71 + x * 14
y = 156 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
401
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip3(i%) <> numer(j%) THEN GOTO 402
y = FIX((tip3(i%) - 1) / 7)
x = (tip3(i%) - 7 * y) - 1
x = 172 + x * 14
y = 69 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
402
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip4(i%) <> numer(j%) THEN GOTO 403
y = FIX((tip4(i%) - 1) / 7)
x = (tip4(i%) - 7 * y) - 1
x = 172 + x * 14
y = 156 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
403
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip5(i%) <> numer(j%) THEN GOTO 404
y = FIX((tip5(i%) - 1) / 7)
x = (tip5(i%) - 7 * y) - 1
x = 273 + x * 14
y = 69 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
404
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip6(i%) <> numer(j%) THEN GOTO 405
y = FIX((tip6(i%) - 1) / 7)
x = (tip6(i%) - 7 * y) - 1
x = 273 + x * 14
y = 156 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
405
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip7(i%) <> numer(j%) THEN GOTO 406
y = FIX((tip7(i%) - 1) / 7)
x = (tip7(i%) - 7 * y) - 1
x = 374 + x * 14
y = 69 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
406
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip8(i%) <> numer(j%) THEN GOTO 407
y = FIX((tip8(i%) - 1) / 7)
x = (tip8(i%) - 7 * y) - 1
x = 374 + x * 14
y = 156 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
407
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip9(i%) <> numer(j%) THEN GOTO 408
y = FIX((tip9(i%) - 1) / 7)
x = (tip9(i%) - 7 * y) - 1
x = 475 + x * 14
y = 69 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
408
NEXT i%
NEXT j%
FOR j% = 1 TO 7
FOR i% = 1 TO 6
IF tip10(i%) <> numer(j%) THEN GOTO 409
y = FIX((tip10(i%) - 1) / 7)
x = (tip10(i%) - 7 * y) - 1
x = 475 + x * 14
y = 156 + y * 12
IF j% < 7 THEN PUT (x, y), richtig, XOR
IF j% > 6 THEN PUT (x, y), rzz, XOR
PLAY "L64N80N40N20N10N5"
409
NEXT i%
NEXT j%
CALL INTERRUPT(&H33, &H7, 0, 0, 640)
CALL INTERRUPT(&H33, &H8, 0, 0, 480)
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
15
RETURN

fehler:
PLAY "L30N50P50N50P50N50P50N40"
RETURN

SUB InitInterrupt
PoiSeg% = VARSEG(OutregBx)
PoiPos% = VARPTR(OutregBx)
bxSLow% = (PoiSeg% MOD 256)
bxSHigh% = INT(PoiSeg% / 256)
bxPLow% = (PoiPos% MOD 256)
bxPHigh% = INT(PoiPos% / 256)
PoiSeg% = VARSEG(OutregCx)
PoiPos% = VARPTR(OutregCx)
cxSLow% = (PoiSeg% MOD 256)
cxSHigh% = INT(PoiSeg% / 256)
cxPLow% = (PoiPos% MOD 256)
cxPHigh% = INT(PoiPos% / 256)
PoiSeg% = VARSEG(OutregDx)
PoiPos% = VARPTR(OutregDx)
dxSLow% = (PoiSeg% MOD 256)
dxSHigh% = INT(PoiSeg% / 256)
dxPLow% = (PoiPos% MOD 256)
dxPHigh% = INT(PoiPos% / 256)
DEF SEG = VARSEG(InterFeld(0))
Poi% = VARPTR(InterFeld(0))
POKE Poi%, &HB8
POKE Poi% + 1, &H0
POKE Poi% + 2, &H0
POKE Poi% + 3, &HBB
POKE Poi% + 4, &H0
POKE Poi% + 5, &H0
POKE Poi% + 6, &HB9
POKE Poi% + 7, &H0
POKE Poi% + 8, &H0
POKE Poi% + 9, &HBA
POKE Poi% + 10, &H0
POKE Poi% + 11, &H0
POKE Poi% + 12, &HCD
POKE Poi% + 13, &H0
POKE Poi% + 14, &H6
POKE Poi% + 15, &H56
POKE Poi% + 16, &HB8
POKE Poi% + 17, cxSLow%
POKE Poi% + 18, cxSHigh%
POKE Poi% + 19, &H8E
POKE Poi% + 20, &HC0
POKE Poi% + 21, &HB8
POKE Poi% + 22, cxPLow%
POKE Poi% + 23, cxPHigh%
POKE Poi% + 24, &H8B
POKE Poi% + 25, &HF0
POKE Poi% + 26, &H26
POKE Poi% + 27, &H88
POKE Poi% + 28, &HC
POKE Poi% + 29, &H26
POKE Poi% + 30, &H88
POKE Poi% + 31, &H6C
POKE Poi% + 32, &H1
POKE Poi% + 33, &HB8
POKE Poi% + 34, dxSLow%
POKE Poi% + 35, dxSHigh%
POKE Poi% + 36, &H8E
POKE Poi% + 37, &HC0
POKE Poi% + 38, &HB8
POKE Poi% + 39, dxPLow%
POKE Poi% + 40, dxPHigh%
POKE Poi% + 41, &H8B
POKE Poi% + 42, &HF0
POKE Poi% + 43, &H26
POKE Poi% + 44, &H88
POKE Poi% + 45, &H14
POKE Poi% + 46, &H26
POKE Poi% + 47, &H88
POKE Poi% + 48, &H74
POKE Poi% + 49, &H1
POKE Poi% + 50, &HB8
POKE Poi% + 51, bxSLow%
POKE Poi% + 52, bxSHigh%
POKE Poi% + 53, &H8E
POKE Poi% + 54, &HC0
POKE Poi% + 55, &HB8
POKE Poi% + 56, bxPLow%
POKE Poi% + 57, bxPHigh%
POKE Poi% + 58, &H8B
POKE Poi% + 59, &HF0
POKE Poi% + 60, &H26
POKE Poi% + 61, &H88
POKE Poi% + 62, &H1C
POKE Poi% + 63, &H26
POKE Poi% + 64, &H88
POKE Poi% + 65, &H7C
POKE Poi% + 66, &H1
POKE Poi% + 67, &H5E
POKE Poi% + 68, &H7
POKE Poi% + 69, &HCB
DEF SEG
END SUB

SUB INTERRUPT (Nr%, iax%, ibx%, icx%, idx%)
ah% = INT(iax% / 256)
bh% = INT(ibx% / 256)
ch% = INT(icx% / 256)
dh% = INT(idx% / 256)
al% = (iax% MOD 256)
bl% = (ibx% MOD 256)
cl% = (icx% MOD 256)
dl% = (idx% MOD 256)
DEF SEG = VARSEG(InterFeld(0))
Poi% = VARPTR(InterFeld(0))
POKE Poi% + 1, al%
POKE Poi% + 2, ah%
POKE Poi% + 4, bl%
POKE Poi% + 5, bh%
POKE Poi% + 7, cl%
POKE Poi% + 8, ch%
POKE Poi% + 10, dl%
POKE Poi% + 11, dh%
POKE Poi% + 13, Nr%
CALL ABSOLUTE(Poi%)
DEF SEG
END SUB

