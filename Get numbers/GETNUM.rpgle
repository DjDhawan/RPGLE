      * This program will input a string of different type of integers from user
      * and show the numbers present in that string.
     H
     D NumChar         S             20A
     D Result          S             20A   Varying
     D i               S              2S 0
     D Tmp             S              1A
     D Pos             S              1S 0
     D Digits          S             10A   Inz('0123456789')
      /free
        Dsply 'Enter numbers and char' ' ' Numchar;
        For i=1 to %len(%trim(NumChar));
           Tmp = %Subst(NumChar:i:1);  //Move Ith variable to Tmp variable
           Pos = %check(Digits:Tmp);   //%Check will compare Digits with Tmp
                                       // and return 0(found) or 1(not found)
           Dsply (Tmp + ' : ' + %char(pos));
           If (pos = 0);
              Result += Tmp;
           endif;
        Endfor;
        Dsply Result;
      /end-free
     C                   SETON                                            LR
