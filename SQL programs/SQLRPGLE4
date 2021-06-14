     HDebug(*yes)                                          
     HOption(*NoDebugio)                                   
      *                                                    
     D Name            S             10A   INZ(*Blanks)    
     D Ind             S              5I 0                 
      *                                                    
      /free                                                
                                                           
         Exec Sql                                          
             WHENEVER SQLERROR GO TO END;                  
                                                           
         Exec Sql                                          
             WHENEVER SQLWARNING CONTINUE;                 
                                                           
         Exec Sql                                          
             WHENEVER NOT FOUND  GO TO END;                
                                                           
         Exec Sql                                          
           SELECT UNAME INTO :NAME:Ind                     
                                                               
         Exec Sql                                              
           SELECT UNAME INTO :NAME:Ind                         
                    FROM DJDHAWAN1/USERPF WHERE UID = 102;     
                                                               
         If Ind > 0 ;                                          
            DSPLY Name;                                        
            DSPLY 'Name value is truncated';                   
         endif;                                                
                                                               
      /end-free                                                
     C     END           Tag                                   
      /free                                                    
         *Inlr = *on;                                          
      /end-free                                                           
