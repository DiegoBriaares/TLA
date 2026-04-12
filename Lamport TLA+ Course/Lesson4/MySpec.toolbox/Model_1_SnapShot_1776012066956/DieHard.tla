------------------------------ MODULE DieHard ------------------------------
EXTENDS Integers

VARIABLES x, y

Init == (x = 0) /\ (y = 0)

FillSmall == (x' = 3) /\ (y' = y)

FillBig == (x' = x) /\ (y' = 5)

EmptySmall == (x' = 0) /\ (y' = y)

EmptyBig == (x' = x) /\ (y' = 0)

PourFromSmall == \/ (/\ (x <= 5 - y) 
                     /\ (x' = 0) 
                     /\ (y' = x + y))
                 \/ (/\ (x > 5 - y)
                     /\ (x' = x - 5 + y)
                     /\ (y' = 5))

PourFromBig == \/ (/\ (y <= 3 - x)
                   /\ (x' = x + y) 
                   /\ (y' = 0))
               \/ (/\ (y > 3 - x)
                   /\ (x' = 3)
                   /\ (y' = y - 3 + x)) 


Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ PourFromSmall
        \/ PourFromBig


TypeOK == /\ (x \in 0..3)
          /\ (y \in 0.. 5)

=============================================================================
\* Modification History
\* Last modified Sun Apr 12 10:40:41 CST 2026 by digogonz
\* Created Sun Apr 12 09:24:29 CST 2026 by digogonz
