     H
     FUSERS     IF   E           K DISK
      *
     D Myds          E DS                  Extname(Users)
      *
     C
      /free
         Exec sql
            Set option commit = *none;
         Exec sql
            Declare C1 Cursor for
            Select * from djdhawan/users where age > 30;
         Exec sql
            Open C1;
         Exec sql
            Fetch next from C1 into :Myds;

         DoW SQLCODE = 0;
           Dsply Myds;
           Exec sql
            Fetch next from C1 into :Myds;
         Enddo;
         *inlr = *on;
      /End-free
