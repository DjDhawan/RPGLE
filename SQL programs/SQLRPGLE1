     HDebug(*yes)                                                                  
     HOption(*NoDebugio)                                                           
      *                                                                            
      * Declaring local SQL variables                                              
     D l_sqlstmt       S            500A   Inz(*Blanks)                            
     D l_inpid         S              5P 0 Inz(0)                                  
     D l_inpname       S             10A   Inz(*Blanks)                            
      *                                                                            
      /free                                                                        
                                                                                   
         l_sqlstmt = 'Delete from djdhawan1/userpf where Uname = ''Dheeraj''';     
         Exec Sql                                                                  
           Execute immediate : l_sqlstmt;                                          
                                                                                   
         *Inlr = *on;                                                              
      /end-free                                                                    
