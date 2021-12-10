     H DFTACTGRP(*NO)                                           
     D Currency        S             15  0 Inz(*Zeros)          
     D RtnWords        S           5000A   Inz(*Blanks)         
                                                                
     D Arr1            S             13    Dim(99) ctdata       
     D Arr2            S              8    Dim(5) ctdata        
                                                                
     DconvertNumericCurrencyToWords...                          
     D                 PR          5000A                        
     D Currency                      15  0                      
      /free                                                     
         Currency = 45;                                         
         RtnWords = convertNumericCurrencyToWords(currency);    
        *Inlr = *on;                                            
      /end-free                                                 
                                                                
     PconvertNumericCurrencyToWords...                          
     P                 B                                        
     DconvertNumericCurrencyToWords...                          
     D                 PI          5000A        
     D currency                      15  0                
                                                          
     D cur             S             15                   
     D extract         DS                                 
     D  first                  1      1                   
     D  midlast                2      3                   
     D  all3                   1      3                   
                                                          
     D loop            S              5I 0                
     D pos             S              5I 0                
     D i               S              5I 0                
     D rtnwords        S           5000A   Inz(*blank)    
      /free                                               
        if currency = *zero;                              
           rtnwords = 'zero';                             
           return rtnwords;                               
        endif;                                            
                                                          
        evalr cur = %char(currency);                      
        loop = 1;                       
        pos = 1;                                                         
        DOW (loop <=5);                                                  
          all3 = %subst(cur:pos:3);                                      
          If all3 <> '   '  and all3 <> '000';                           
            If First<> ' ' and first <> '0';                             
              clear i;                                                   
              i = %int(first);                                           
              rtnwords = %trimr(rtnwords) + ' ' + %trimr(arr1(i)) +      
                         ' ' + 'hundred';                                
            endif;                                                       
                                                                         
            If midlast <> '  ' and midlast <> '00';                      
              clear i;                                                   
              i = %int(midlast);                                         
              rtnwords = %trimr(rtnwords) + ' ' + %trimr(arr1(i));       
            endif;                                                       
            rtnwords = %trimr(rtnwords) + ' ' + %trimr(arr2(loop));      
          endif;                                                         
          pos = pos + 3;                                                 
          loop = loop + 1;                                                
        Enddo;                                         
        return rtnwords;                               
                                                       
      /end-free                                        
     PconvertNumericCurrencyToWords...                 
     P                 E                               
** CTDATA arr1                                         
One                                                    
Two                                                    
Three                                                  
Four                                                   
Five                                                   
Six                                                    
Seven                                                  
Eight                                                  
Nine                                                   
Ten                                                    
eleven                                                 
Twelve                                                 
Thirteen                                               
Fourteen       
Fifteen        
Sixteen        
Seventeen      
Eighteen       
Nineteen       
Twenty         
Twenty one     
Twenty Two     
Twenty Three   
Twenty Four    
Twenty Five    
Twenty Six     
Twenty Seven   
Twenty Eight   
Twenty Nine    
Thirty         
Thirty one     
Thirty Two     
Thirty Three   
Thirty Four    
Thirty Five    
Thirty Six     
Thirty Seven   
Thirty Eight   
Thirty Nine    
Fourty         
Fourty one     
Fourty Two     
Fourty Three   
Fourty Four    
Fourty Five    
Fourty Six     
Fourty Seven   
Fourty Eight   
Fourty Nine    
Fifty          
Fifty  one     
Fifty  Two     
Fifty  Three   
Fifty  Four   
Fifty  Five   
Fifty  Six    
Fifty  Seven  
Fifty  Eight  
Fifty  Nine   
Sixty         
Sixty one     
Sixty Two     
Sixty Three   
Sixty Four    
Sixty Five    
Sixty Six     
Sixty Seven   
Sixty Eight   
Sixty Nine    
Seventy       
Seventy one   
Seventy Two   
Seventy Three 
Seventy Four   
Seventy Five   
Seventy Six    
Seventy Seven  
Seventy Eight  
Seventy Nine   
Eighty         
Eighty one     
Eighty Two     
Eighty Three   
Eighty Four    
Eighty Five    
Eighty Six     
Eighty Seven   
Eighty Eight   
Eighty Nine    
Ninety         
Ninety one     
Ninety Two     
Ninety Three   
Ninety Four     
Ninety Five     
Ninety Six      
Ninety Seven    
Ninety Eight    
Ninety Nine     
** CTDATA arr2  
Trillion        
Billion         
Million         
Thousand        
