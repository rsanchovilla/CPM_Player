% File TRGPOS.ALG	(c)	8/29/80		The Soft Warehouse %


FUNCTION NEGLT(EX1),
  WHEN SUM(EX1),
    WHEN POSMULT(NUMNUM,2), NEGCOEF(SECOND(EX1)) EXIT EXIT,
  NEGCOEF(EX1),
ENDFUN $

FUNCTION SIN (EX1),
  WHEN ZERO(EX1), EX1  EXIT,
  WHEN NEGLT (EX1), -SIN(-EX1) EXIT,
  SIMPU ('SIN, EX1),
ENDFUN $

FUNCTION COS (EX1),
  WHEN ZERO(EX1), 1  EXIT,
  WHEN NEGLT (EX1), COS(-EX1) EXIT,
  SIMPU ('COS, EX1),
ENDFUN $

FUNCTION TAN (EX1),
  WHEN NEGLT(EX1), -TAN(-EX1)  EXIT,
  WHEN POSMULT(TRGEXPD,2), SIN(EX1)/COS(EX1) EXIT,
  SIMPU('TAN, EX1),
ENDFUN $

FUNCTION COT (EX1),
  WHEN NEGLT(EX1), -COT(-EX1)  EXIT,
  WHEN POSMULT(TRGEXPD,2), COS(EX1)/SIN(EX1) EXIT,
  SIMPU('COT, EX1),
ENDFUN $

FUNCTION CSC (EX1),
  WHEN POSMULT(TRGEXPD,2), SIN(EX1)^-1  EXIT,
  SIMPU ('CSC, EX1),
ENDFUN $

FUNCTION SEC (EX1),
  WHEN POSMULT(TRGEXPD,2), COS(EX1)^-1  EXIT,
  SIMPU ('SEC, EX1),
ENDFUN $


HALF: 1/2 $

TRGSQ: 0 $

PUSH ('TRGSQ, FLAGS) $

PROPERTY BASE, SIN, FUNCTION (EX1, EX2),
  WHEN POSITIVE (EX1)  AND  POSMULT (TRGEXPD, 3),
    SIN(EX2)^(EX1-2) * (HALF - COS(2*EX2)*HALF)  EXIT,
  WHEN LESSER (EX1, -1)  AND  POSMULT (TRGEXPD, 3),
    (SIN(EX2)^-EX1) ^ -1  EXIT,
  WHEN EX1 < 0  AND  NEGMULT (TRGEXPD, 2),
    CSC(EX2) ^ -EX1 EXIT,
  WHEN POSITIVE (EX1)  AND  NEGATIVE (TRGSQ),
    (1-COS(EX2)^2)^QUOTIENT(EX1,2) * SIN(EX2)^MOD(EX1,2) EXIT,
  WHEN LESSER (EX1, -1)  AND  NEGATIVE (TRGSQ),
    EX1: -EX1,
    ((1-COS(EX2)^2)^QUOTIENT(EX1,2) * SIN(EX2)^MOD(EX1,2))^-1
    EXIT,
ENDFUN $

PROPERTY BASE, COS, FUNCTION (EX1, EX2),
  WHEN POSITIVE (EX1)  AND  POSMULT (TRGEXPD, 3),
    COS(EX2)^(EX1-2) * (HALF + COS(2*EX2)*HALF)  EXIT,
  WHEN LESSER (EX1, -1)  AND  POSMULT (TRGEXPD, 3),
    (COS(EX2)^-EX1) ^ -1  EXIT,
  WHEN EX1 < 0  AND  NEGMULT (TRGEXPD, 2),
    SEC(EX2) ^ -EX1 EXIT,
  WHEN POSITIVE (EX1)  AND  POSITIVE (TRGSQ),
    (1-SIN(EX2)^2)^QUOTIENT(EX1,2) * COS(EX2)^MOD(EX1,2) EXIT,
  WHEN LESSER (EX1, -1)  AND  POSITIVE (TRGSQ),
    EX1: -EX1,
    ((1-SIN(EX2)^2)^QUOTIENT(EX1,2) * COS(EX2)^MOD(EX1,2))^-1,
    EXIT,
ENDFUN $

PROPERTY *, SIN, FUNCTION (EX1, EX2),
  WHEN POSMULT (TRGEXPD, 5),
    WHEN FIRST(EX1) EQ 'SIN,
      EX1: SECOND (EX1),
      HALF*COS(EX1-EX2) - HALF*COS(EX1+EX2)  EXIT,
    WHEN FIRST(EX1) EQ 'COS,
      EX1: SECOND (EX1),
      HALF*SIN(EX1+EX2) - HALF*SIN(EX1-EX2)  EXIT EXIT,
ENDFUN $

PROPERTY *, COS, FUNCTION (EX1, EX2),
  WHEN POSMULT (TRGEXPD, 5),
    WHEN FIRST(EX1) EQ 'SIN,
      EX1: SECOND (EX1),
      HALF*SIN(EX1+EX2) + HALF*SIN(EX1-EX2)  EXIT,
    WHEN FIRST(EX1) EQ 'COS,
      EX1: SECOND (EX1),
      HALF*COS(EX1-EX2) + HALF*COS(EX1+EX2)  EXIT EXIT,
ENDFUN $

STOP $
RDS() $
