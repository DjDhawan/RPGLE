     H                                                              
     D First_Name      S             10A                            
     D Last_Name       S             10A                            
     D Var1            S               *                            
     D Var2            S             10A                            
     D Full_name       S               *   INZ(*NULL)               
     D FinalString     S             20A   Based(Full_name)         
     D                                                              
     D JoinString      PR              *                            
     D                                 *   CONST Options(*STRING)   
     D                                 *   VALUE Options(*STRING)   
      *                                                             
      /free                                                         
        First_Name = 'Dheeraj';                                     
        Last_Name = ' Dhawan';                                      
                                                                    
        Var1 = %Addr(First_Name);                                   
        Var2 = Last_Name;                                           
                                                                    
        Full_Name = JoinString(Var1:Var2);   
        DSPLY FinalString;                   
        *Inlr = *on;                         
      /end-free                                                                                                  
