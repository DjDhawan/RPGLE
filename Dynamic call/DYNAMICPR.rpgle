     H DFTACTGRP(*NO)                                    
                                                         
     D NUM1            S             10P 0               
     D NUM2            S             10P 0               
     D RESULT          S             10P 0               
                                                         
     D DYNAMICPR       PR                                
     D                                1A                 
     D DYNAMICPR       PI                                
     D Operation                      1A                 
                                                         
     D ADD             PR                                
     D                               10P 0 VALUE         
     D                               10P 0 VALUE         
     D SUBTRACT        PR                                
     D                               10P 0 VALUE         
     D                               10P 0 VALUE         
     D MULTIPLY        PR                                
     D                               10P 0 VALUE         
     D                               10P 0 VALUE         
     D DIVIDE          PR                                             
     D                               10P 0 VALUE                      
     D                               10P 0 VALUE                      
     D General         PR                  Extproc(PrPointer)         
     D                               10P 0 VALUE                      
     D                               10P 0 VALUE                      
     D PrPointer       S               *   Procptr                    
                                                                      
      /free                                                           
        Num1 = 14;                                                    
        Num2 = 7;                                                     
        If Operation = 'A';      // Addition                          
          Prpointer = %Paddr(ADD);                                    
          General(Num1:Num2);                                         
        elseif Operation = 'S';      // Subtraction                   
          Prpointer = %Paddr(SUBTRACT);                               
          General(Num1:Num2);                                         
        elseif Operation = 'M';      // Multiplication                
          Prpointer = %Paddr(MULTIPLY);                               
          General(Num1:Num2);                                         
        elseif Operation = 'D';      // Division                   
          Prpointer = %Paddr(DIVIDE);                              
          General(Num1:Num2);                                      
        else;                                                      
          Dsply 'Valid values are ''A'' ''S'' ''M'' ''D''';        
        endif;                                                     
        *inlr = *on;                                               
      /end-free                                                    
                                                                   
     P ADD             B                                           
     D ADD             PI                                          
     D VAR1                          10P 0 VALUE                   
     D VAR2                          10P 0 VALUE                   
      /free                                                        
       Result = Var1 + Var2;                                       
       Dsply ('Sum of two numbers is ' + %char(result));           
      /end-free                                                    
     P ADD             E                                           
                                                                   
     P Subtract        B                                           
     D Subtract        PI                                                  
     D VAR1                          10P 0 VALUE                           
     D VAR2                          10P 0 VALUE                           
      /free                                                                
       Result = Var1 - Var2;                                               
       Dsply ('Difference of two numbers is ' + %char(result));            
      /end-free                                                            
     P Subtract        E                                                   
                                                                           
     P Multiply        B                                                   
     D Multiply        PI                                                  
     D VAR1                          10P 0 VALUE                           
     D VAR2                          10P 0 VALUE                           
      /free                                                                
       Result = Var1 * Var2;                                               
       Dsply ('Multiplication of two numbers is ' + %char(result));        
      /end-free                                                            
     P Multiply        E                                                   
                                                                           
     P Divide          B                                                   
     D Divide          PI                                          
     D VAR1                          10P 0 VALUE                   
     D VAR2                          10P 0 VALUE                   
      /free                                                        
       If Var2 <> 0;                                               
          Result = Var1 / Var2;                                    
          Dsply ('Division two numbers is ' + %char(result));      
       else;                                                       
          Dsply 'Division by zero is not possible';                
       endif;                                                      
      /end-free                                                    
     P Divide          E                                                
