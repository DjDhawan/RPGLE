      * This program will take values from user and tell how many numbers are
      * repeated and provide the count
     H
     D Cnum            S              1S 0
     D Arr             S              1S 0 Dim(15)  Descend
     D I               S              3S 0
     D Count           S              3S 0
      /free
      * This program will take values from user and tell how many numbers are
      * repeated and provide the count
       Dsply 'How many numbers you want to enter' ' ' Cnum;

       For I = 1 to Cnum;
         IF I = 1;
           Dsply 'Enter 1st number' ' ' Arr(1) ;
         Elseif I = Cnum;
           Dsply 'Enter last number' ' ' Arr(Cnum) ;
         Else;
           Dsply 'Enter next number' ' ' Arr(I) ;
         endif;
       endfor;

         Sorta Arr;
         I = 1;
         Count = 1;

       For I = 1 to Cnum-1;
         If Arr(I) = Arr(I+1) ;
            Count = Count + 1;
         else;
            Dsply ('Number ' + %Char(Arr(I)) + ' is repeated ' +
               %Char(Count) + ' times');
            Count = 1;
         endif;
       endfor;
            Dsply ('Number ' + %Char(Arr(I)) + ' is repeated ' +
               %Char(Count) + ' times');
      /end-free
     C                   SETON                                            LR
