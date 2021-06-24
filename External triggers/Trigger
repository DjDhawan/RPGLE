      * Writing Trigger program in RPGLE                           
      *--------------------------------------------                
      * 1 - Define Trigger Buffer as DS                            
      * 2 - Define Trigger Buffer Length                           
      * 3 - Define old record and new record                       
      * 4 - Define old and new NULL maps                           
      * 5 - Define Input Parameters to program                     
      * 6 - Setting pointers using %ADDR inbuilt function          
      *------------------------------------------------------      
      * DS for TriggerBuffer                                       
     D TriggerBufferD  DS                                          
     D FileName                      10A                           
     D LibraryName                   10A                           
     D MemberName                    10A                           
     D TriggerEvent                   1A                           
     D TriggerTime                    1A                           
     D CommitLockLevel...                                          
     D                                1A                           
     D Filler1                        3A                           
     D CCSID                         10I 0                         
     D RRN                           10I 0             
     D Filler2                       10I 0             
     D OldRecordOffset...                              
     D                               10I 0             
     D OldRecordLength...                              
     D                               10I 0             
     D OldNullOffset                 10I 0             
     D OldNullLength                 10I 0             
     D NewRecordOffset...                              
     D                               10I 0             
     D NewRecordLength...                              
     D                               10I 0             
     D NewNullOffset                 10I 0             
     D NewNullLength                 10I 0             
                                                       
      * Trigger Buffer Length                          
     D TriggerBufferLengthD...                         
     D                 S             10I 0             
                                                       
      * Old Record                                                              
     D OldRecord     E DS                  EXTNAME(USERPF)                      
     D                                     Prefix(OLD)                          
     D                                     Based(OldRecPtr)                     
                                                                                
      * New Record                                                              
     D NewRecord     E DS                  EXTNAME(USERPF)                      
     D                                     Prefix(NEW)                          
     D                                     Based(NewRecPtr)                     
                                                                                
                                                                                
      * Null Maps contain a series of 1 byte flags                              
      * Number of Null Maps flags are equal to number of fields in that file    
      * DIM(3) --> File has 3 fields                                            
                                                                                
      * Old Null maps                                                           
     D OldNullMap      DS                  Based(OldNullPtr)                    
     D  oldNullField                  1    DIM(3)                               
                                                                                
      * New Null maps                                                           
     D NewNullMap      DS                  Based(NewNullPtr)                    
     D  newNullField                  1    DIM(3)                               
                                                                                
                                                                                
      * Replace entry parameter list as below                                   
      * Procedure prototype                                                     
     D MAIN            PR                  EXTPGM('TRIGGER')                    
     D TriggerBuffer                       LIKEDS(TriggerBufferD)               
     D TriggerBufferLength...                                                   
     D                                     LIKE(TriggerBufferLengthD)           
      * Procedure Input                                                         
     D MAIN            PI                                                       
     D TriggerBuffer                       LIKEDS(TriggerBufferD)               
     D TriggerBufferLength...                                                   
     D                                     LIKE(TriggerBufferLengthD)           
                                                                                
      /Free                                                                     
                                                                                
       //  Important Notes:                                                     
       //                                                                       
       //  1 - CommitLockLevel :  '0' --> *None                            
       //                         '1' --> *Chg                             
       //                         '2' --> *CS                              
       //                         '3' --> *ALL                             
       //                                                                  
       //  2 - New/Old Record Null Byte Map:                               
       //                          '0' --> Not Null                        
       //                          '1' --> Null                            
       //                                                                  
       //  3 - Trigger Event:      '1' --> INSERT operation                
       //                          '2' --> DELETE operation                
       //                          '3' --> UPDATE operation                
       //                          '4' --> READ operation                  
       //                                                                  
       //  4 - Trigget Time:                                               
       //           '1' --> After the event                                
       //           '2' --> Before the event                               
       //           '3' --> Instead of change operation (SQL operation)    
       //                                                                  
                                                                           
          TriggerBufferD = TriggerBuffer;                                   
          TriggerBufferLengthD = TriggerBufferLength;                       
                                                                            
       // Setting the pointers                                              
                                                                            
       // Providing values to the pointers defined above in the program     
       // Using pointers, the DS will get populated accordingly             
          OldRecPtr = %ADDR(TriggerBuffer) + OldRecordOffset;               
          NewRecPtr = %ADDR(TriggerBuffer) + NewRecordOffset;               
                                                                            
          OldNullPtr = %ADDR(TriggerBuffer) + OldNullOffset;                
          NewNullPtr = %ADDR(TriggerBuffer) + NewNullOffset;                
           // Now all the fields are populated, we can use them and code    
           // Program has pointer and DS populated                          
           // The program now has access to Old and New record              
                                                                            
                                                                            
         Select;                                                            
           when  TriggerEvent = '1';                                        
                 DSPLY 'Record inserted in file USERPF';                    
           when  TriggerEvent = '2';                                   
                 DSPLY 'Record deleted in file USERPF';                
           when  TriggerEvent = '3';                                   
                 DSPLY 'Record updated in file USERPF';                
           when  TriggerEvent = '4';                                   
                 DSPLY 'Record being read from the file USERPF';       
         Endsl;                                                        
                                                                       
        *Inlr = *on;                                                   
      /End-free                                                                         
