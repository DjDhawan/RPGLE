     H
     FUSERS     IF   E           K DISK
      *
     D CountDS         DS
     D Count1                         2S 0
     D Count2                         2S 0
     DAges             S              2S 0
      *
     C
      /free
           Ages = 30;
         Exec sql
            Set option commit = *none;
         Exec sql
            Select count(*), Count(distinct firstname) into :CountDS
                   from djdhawan/users  where age > :Ages;
            Dsply Count1;
            Dsply Count2;
         *inlr = *on;
      /End-free
