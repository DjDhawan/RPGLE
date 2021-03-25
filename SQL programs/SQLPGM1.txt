     H
     FUSERS     IF   E           K DISK
      *
     D
      *
     C
      /free
         Exec sql
            Set option commit = *none;
         Exec sql
            Drop table djdhawan/F1;     // This will delete the existing file
         Exec sql
           Create table djdhawan/F1 as (
            Select * from djdhawan/Users where age > 30 )
            with data;
         *inlr = *on;
      /End-free
