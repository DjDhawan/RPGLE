     H
     FUsers     UF A E           K Disk
     Fusersfl   CF   E             workstn sfile(SFLDATA:RRN)
     D RRN             S              3S 0
     D I               S              3S 0
     D TEMPID          S                   LIKE(USERID)
     D TEMPFNAME       S                   LIKE(FIRSTNAME)
     D TEMPLNAME       S                   LIKE(LASTNAME)
     D TEMPAGE         S                   LIKE(AGE)
      /free
        EXSR CLRSFL;
        EXSR LOADSFL;
        WRITE FOOTER;

        // DISPLAY SUBFILE
         DOW (*IN03 = *OFF);
           EXFMT SFLCTL;
           SELECT;
           WHEN *IN09 = *ON ;
             DOW *IN12 = *OFF;
               EXFMT ADDREC;
               EXSR ADDRECORD;
             ENDDO;
             *IN12 = *OFF;
             EXSR CLRSFL;
             EXSR LOADSFL;
           OTHER;
             READC SFLDATA;
             DOW NOT %EOF;
               EXFMT UPDREC;
               EXSR $UPDDATA;
               OPTION = ' ';
               UPDATE SFLDATA;
               READC SFLDATA;
             ENDDO;
           ENDSL;
         ENDDO;
         *inlr = *on;
      /end-free
      *
      /free
        // CLEAR SUBFILE
       begsr CLRSFL;
           *IN50 = *OFF;
           WRITE SFLCTL;
           RRN = 0;
           *IN50 = *ON;
       endsr;
      /end-free
      *
      /free
        // LOAD SUBFILE
         Begsr loadsfl;
           USERID = 0;
           RRN = 1;
      *    CHAIN USERID USERS;
           SETLL USERID USERS;
           READ USERS;
           DOW NOT %EOF(USERS);
             WRITE SFLDATA;
             READ USERS;
             RRN = RRN + 1;
           ENDDO;
         endsr;
      /end-free
      *
      /free
         begsr ADDRECORD;
           IF USERID = 0;
              FLD001 = 'USERID Cannot be 0';
           elseif FIRSTNAME = *BLANKS;
              FLD001 = 'Enter FIRSTNAME';
           elseif LASTNAME = *BLANKS;
              FLD001 = 'Enter LASTNAME';
           elseif Age = 0;
              FLD001 = 'Age cannot be blank';
           else;
              WRITE USRFMT;
              FLD001 = 'Record added successfully';
              USERID = 0;
              FIRSTNAME = *BLANKS;
              LASTNAME = *BLANKS;
              AGE = 0;
           endif;
         ENDSR;
      /end-free
      *
       /free
          begsr $UPDDATA;
            IF *IN12 = *ON;
               *IN12 = *OFF;
               LEAVESR;
            ENDIF;
            TEMPID = USERID;
            TEMPFNAME = FIRSTNAME;
            TEMPLNAME = LASTNAME;
            TEMPAGE = AGE;
            CHAIN USERID USERS;
            If %Found;
              USERID = TEMPID;
              FIRSTNAME = TEMPFNAME;
              LASTNAME = TEMPLNAME;
              AGE = TEMPAGE;
              UPDATE USRFMT;
            endif;
          ENDSR;
       /end-free
      *
