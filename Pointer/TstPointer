D Var1            S            100A                                 
D i               S              2S 0                               
D Ptr_data        S             10A   Based(Ptr)                    
                                                                    
 /free                                                              
      Var1 = 'This is some big text with character and numbers' +   
             ' 123456789';                                          
      Ptr = %Addr(Var1);                                            
      For i = 1 to 9;                                               
         Dsply Ptr_data;                                            
         Ptr = Ptr + %Size(Ptr_data);                               
      endfor;                                                       
   *inlr = *on;                                                     
 /end-free                                                          
