     HDebug(*yes)                                          
     HOption(*NoDebugio)                                   
      *                                                    
     D Name            S             22A   INZ(*Blanks)    
     D Password        S             10A   INZ(*Blanks)    
      *                                                    
      /free                                                
                                                           
         Exec Sql                                          
             WHENEVER SQLERROR GO TO END;                  
                                                           
         Exec Sql                                          
             WHENEVER SQLWARNING CONTINUE;                 
                                                           
         Exec Sql                                          
             WHENEVER NOT FOUND  GO TO END;                
                                                           
         Exec Sql                                          
           SELECT UNAME, UPSW INTO :NAME, :Password        
                    FROM DJDHAWAN1/USERPF WHERE UID = 102;   
                                                             
         If NAME  <> ' '  ;                                  
            DSPLY Name;                                      
            DSPLY Password;                                  
         endif;                                              
                                                             
      /end-free                                              
     C     END           Tag                                 
      /free                                                  
         *Inlr = *on;                                        
      /end-free                                                         
