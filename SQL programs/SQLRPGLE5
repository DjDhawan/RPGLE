     D sql             S          16322A                                                             
     D                                                                                               
      * Procedure prototype to call external API program QSQCHKS                                     
     D QSQCHKS         PR                  EXTPGM('QSQCHKS')                                         
     D sqlQuery                   16322A                                        * sql query          
     D length                        10I 0                                      * len of sql query   
     D NumRecords                    10I 0                                      * No of stmt to scan 
     D Language                      10A                                        * Language           
     D QSQ_options                         LIKEDS(QSQ_options)                  * Options            
     D QSQ_stmt                            LIKEDS(QSQ_stmt)                     * Statement Info     
     D InSize                        10I 0                                      * Length of stmt inf 
     D nRecords                      10I 0                                      * No of records prc  
     D Error_Code                          LIKEDS(Error_Code)                   * Error code         
                                                                                                     
                                                                                                     
     D Stmt            DS                  QUALIFIED                                                 
     D  length                       10I 0                                      * sql query Length   
     D  NumRecords                   10I 0 INZ(1)                               * 1 when lang *NONE  
     D  Language                     10A   INZ('*NONE')                                              
     D  InSize                       10I 0 INZ(%size(QSQ_Stmt))                                      
     D  nRecords                     10I 0                                                           
                                                                                                     
                                                                                                     
     D QSQ_options     DS                  QUALIFIED                                                 
     D  NumKeys                      10I 0 INZ(1)                               * Num of Keys        
     D  Key01                        10I 0 INZ(1)                               * Key                
     D  Key01length                  10I 0 INZ(10)                              * Length of data     
     D  Key01data                    10A   INZ('*SYS')                          * data (*none, *SQL) 
                                                                                                     
                                                                                                     
     D QSQ_stmt        DS                  QUALIFIED                                                 
     D  MsgfName               1     10                                         * Msg file           
     D  MsgfLib               11     20                                         * Msg file lib       
     D  NumStmts              21     24B 0                                      * No of stmt prcsd   
     D  StmtInfo                           LikeDS(StmtProcessed)                * stmt info return   
                                                                                * by stmt processed  
                                                                                                     
     DStmtProcessed    DS                  QUALIFIED                                                 
     D lengthStmt              1      4B 0                                      * length if info rtn 
     D rowStart                5      8B 0                                      * rcd num of 1st byt 
     D colStart                9     12B 0                                      * col num of 1st byt 
     D rowLast                13     16B 0                                      * rcd num of Lastbyt 
     D colLast                17     20B 0                                      * Col num of Lastbyt 
     D rowErrorSyntax         21     24B 0                                      * rcd num of syn.err 
     D colErrorSyntax         25     28B 0                                      * Col num of syn.err 
     D SqlMessageID           29     35                                         * SQL msg ID         
     D SqlState               36     40                                         * SQL state          
     D lenReplaceMsg          41     44B 0                                      * Len of msg replTXT 
     D msgReplaceData         45    145A                                        * Msg ReplacementTXT 
                                                                                                     
                                                                                                     
     DError_Code       DS           116                                                              
     D BytesProvided           1      4B 0                                      * Bytes provided     
     D BytesAvailable          5      8B 0                                      * Bytes available    
     D ExceptionID             9     15                                         * Exception ID       
     D Reserved               16     16                                         * reserved           
     D MessageData            17    116                                         * Message Data       
     D                                                                                                    
     
      /free                                                                    
       Clear SQL;                                                              
       sql = 'SELECT * FRPM CASE3PF';                                          
       stmt.length = %len(%trim(sql));    //calculate length of sql query      
                                                                               
       IF stmt.length <= 0;      // check if sql query is blank                
          return;                                                              
       endif;                                                                  
                                                                               
       QSQCHKS (Sql:                                                           
                stmt.length:                                                   
                stmt.NumRecords:                                               
                stmt.Language:                                                 
                Qsq_Options:                                                   
                Qsq_Stmt:            // output                                 
                stmt.inSize:                                                   
                stmt.nRecords:       // output                                 
                Error_Code);         // output                                 
                                                                               
                                                                                   
       If ExceptionID <> ' ';                                                      
                                                                                   
       Else;                                                                       
          If QSQ_Stmt.stmtInfo.SqLMessageID <> ' ';                                
                                                                                   
             //retrive error from message file QSQLMSG using                       
             // QSQ_Stmt.StmtInfo.SQLMessageID and QSQ_Stmt.Stmtinfo.MessageData   
                                                                                   
           If QSQ_Stmt.StmtInfo.colErrorSyntax > 0;                                
              DSPLY 'Error in SQL Query';                                          
           endif;                                                                  
          endif;                                                                   
       endif;                                                                      
                                                                                   
        *inlr = *on;                                                               
      /end-free                                                                                                                                                   
