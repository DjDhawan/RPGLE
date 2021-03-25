H DftActGrp(*no) ActGrp('MyJava')                                         
 *                                                                        
D bdClass         C                   'java.math.BigDecimal'              
D strClass        C                   'java.lang.String'                  
 *                                                                        
D newBDI          PR              O   ExtProc(*JAVA:bdClass:Contructor)   
D                               10I 0 Value                               
 *                                                                        
D Bg1             S               O   Class(*Java:bdClass)                
D Bg2             S               O   Class(*Java:bdClass)                
D s               S               O   Class(*Java:strClass)               
D output          S          10000A                                       
 *                                                                        
D BdPow           PR              O   Class(*Java:bdClass)                
D                                     ExpProc(*JAVA:bdClass:'pow')        
D                               10I 0 Value                               
 *                                                                        
D toString        PR              O   Class(*Java:strClass)               
D                                     ExpProc(*JAVA:strclass:'toString')  
D Bg2             S               O   Class(*Java:bdClass)                  
D s               S               O   Class(*Java:strClass)                 
D output          S          10000A                                         
 *                                                                          
D BdPow           PR              O   Class(*Java:bdClass)                  
D                                     ExpProc(*JAVA:bdClass:'pow')          
D                               10I 0 Value                                 
 *                                                                          
D toString        PR              O   Class(*Java:strClass)                 
D                                     ExpProc(*JAVA:strclass:'toString')    
 *                                                                          
D getBytes        PR         65535A   Varying                               
D                                     ExpProc(*JAVA:strclass:'getBytes')    
 *                                                                          
 /free                                                                      
   //java code - BigDecimal BG1 = new BigDecimal(2);                        
       Bg1 = newBDI(2);                                                     
                                                                            
   // Bigdecimal Bg2 = Bg1.pow(1000)                                        
       Bg2 =  bdPow(Bg1:1000);                                              
 *                                                                             
D getBytes        PR         65535A   Varying                                  
D                                     ExpProc(*JAVA:strclass:'getBytes')       
 *                                                                             
 /free                                                                         
   //java code - BigDecimal BG1 = new BigDecimal(2);                           
       Bg1 = newBDI(2);                                                        
                                                                               
   // Bigdecimal Bg2 = Bg1.pow(1000)                                           
       Bg2 =  bdPow(Bg1:1000);                                                 
                                                                               
   // String s = Bg2.toString()                                                
       s = tostring(bg2);                                                      
   *inlr = *on;                                                                
 /end-free                                                                     
