H DFTACTGRP(*NO)                                                        
D rtnval          S             10I 0                                   
D cmd             S           1000A                                     
                                                                        
D system          PR            10I 0 extproc('system')                 
D cmd1                            *   VALUE Options(*string: *trim)     
                                                                        
 /free                                                                  
  cmd = 'CALL DSPLYMSG';                                                
  RTNVAL = system(cmd);                                                 
  If RTNVAL <> 0;                                                       
     DSPLY 'Error Found';                                               
  else;                                                                 
     DSPLY 'C API ''SYSTEM'' is successful';                            
  Endif;                                                                
                                                                        
  *inlr = *on;                                                          
 /end-free                                                              
