     H NOMAIN                                                      
      *                                                            
     D JoinString      PR              *                           
     D                                 *   CONST Options(*STRING)  
     D                                 *   VALUE Options(*STRING)  
                                                                   
     P JoinString      B                   EXPORT                  
     D JoinString      PI              *                           
     D Ptr1                            *   CONST Options(*STRING)  
     D Ptr2                            *   VALUE Options(*STRING)  
                                                                   
     D Var1            S             10A                           
     D Var2            S             10A                           
     D JoinedString    S             20A                           
                                                                   
      /Free                                                        
                                                                   
       JoinedString = %Trim(%Str(Ptr1)) + %Str(Ptr2);              
       Return %addr(JoinedString);                                 
                                                                   
      /end-free             
     P JoinString      E                                                                       
