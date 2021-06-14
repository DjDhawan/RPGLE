     HDebug(*yes)                                                         
     HOption(*NoDebugio)                                                  
      *                                                                   
      * Declaring local SQL variables                                     
     D l_sqlstmt       S            500A   Inz(*Blanks)                   
     D name            S             10A   Inz(*Blanks)                   
      *                                                                   
      /free                                                               
                                                                          
         l_sqlstmt = 'Delete from djdhawan1/userpf where Uname = ? ';     
         Exec Sql                                                         
           Prepare SQL_Statement from: l_sqlstmt;                         
                                                                          
         name = 'Dheeraj';                                                
                                                                          
      // Now executing SQL statment using parameter pointer               
         Exec Sql                                                         
           Execute SQL_Statement USING: name;                             
                                                                          
         If SQLCOD = 0;                      
            DSPLY 'Record deleted';          
         Elseif SQLCODE = 100;               
            DSPLY 'Record not found';        
         Else;                               
            DSPLY 'Error';                   
         endif;                              
                                             
         *Inlr = *on;                        
      /end-free                                                                                                        
