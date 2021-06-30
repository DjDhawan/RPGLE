D cmd             S          32702A                               
D QCMDEXC         PR                  EXTPGM('QCMDEXC')           
D cmd                        32702A   Options(*varsize) CONST     
D len                           15P 5 CONST                       
D IGC                            3A   Options(*nopass) CONST      
 /free                                                            
    cmd = 'CALL DSPLYMSG';                                        
    QCMDEXC(cmd:%len(cmd));                                       
  *inlr = *on;                                                    
 /end-free                                                        
