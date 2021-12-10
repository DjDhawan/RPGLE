     H DFTACTGRP(*NO)                                                                             
      * Few points to remember:                                                                   
      * "Iconv" API is used to convert one character set to another character set                 
      * Windows system uses ASCII encoding                                                        
      * IBMi system uses EBCDIC encoding                                                          
      * UNICODE is the encoding technique that keeps the unique hex value for every character so  
      *   when we transfer data from one UNICODE system to another, the data value remain same.   
      * CCSID (0 - 65535) --> Identifies the codepage and character set.                          
      * For US, Canada etc - CCSID 37 and code page -697                                          
      * For Japanese system - CCSID 290 and Code page -1172                                       
      * Data Integrity problem (ccsid -65535)                                                     
      * HEX - 5B - $ on EBCDIC 37                                                                 
      * HEX - 5B - $ on EBCDIC 290                                                                
      *                                                                                           
      * srvpgm  QTQICONV in QSYS library                                                          
      **************************************************                                          
      * Perform init for converting character encoding from source CCSID                          
      * to "TO" CCSID                                                                             
      * Return a conversion descriptor.(Single byte shift state)                                  
      * iconv_Open()                                                                                 
                                                                                                     
     D OpenPROC        PR            52A   extproc('QtqIconvOpen')                                   
     D ToCode                          *   value                                                     
     D FromCode                        *   value                                                     
                                                                                                     
                                                                                                     
      * CCSID - 1 through 65535 (special value - 0 when 65535 then job CCSID is used)                
      * Conversion alternative - 0(IBM Default), 57, 102                                             
      * Substitution alternative - 0 (Number of substitution character not returned)                 
      *                          - 1 (Number of substitution character returned)                     
      * Shift-state alternative  - 0 ( Conversion descriptor not returned to initial shift state)    
      *                          - 1 ( Conversion descriptor always return to initial shift state)   
      * Input length option      - 0 (Conversion descriptor creates so that iconv does not know      
      *                               no of byes. so valid values must be passed in InputBytesLeft)  
      *                          - 1 (Null character at the end of Inpur Buffer) - InputBytesLeft -0 
      * Error option for mixed data - 0(Error not returned)  1(Error returned)                       
                                                                                                     
     DToCode           DS                                                                            
     D ToCCSID                       10I 0                                                           
     D ToconversionAlternative...                             
     D                               10I 0 Inz(0)             
     D ToSubstitutionAlternative...                           
     D                               10I 0 Inz(0)             
     D ToShiftStateAlternative...                             
     D                               10I 0 Inz(0)             
     D ToInputLengthOption...                                 
     D                               10I 0 Inz(0)             
     D ToErrorOptionforMixedData...                           
     D                               10I 0 Inz(0)             
     D ToReserved                     8    Inz(*allx'00')     
                                                              
     DFromCode         DS                                     
     D FromCCSID                     10I 0                    
     D FromConversionAlternative...                           
     D                               10I 0 Inz(0)             
     D FromSubstitutionAlternative...                         
     D                               10I 0 Inz(0)             
     D FromShiftStateAlternative...                           
     D                               10I 0 Inz(0)             
     D FromInputLengthOption...                                              
     D                               10I 0 Inz(0)                            
     D FromErrorOptionforMixedData...                                        
     D                               10I 0 Inz(0)                            
     D FromReserved                   8    Inz(*allx'00')                    
                                                                             
     D ConversionDescriptor...                                               
     D                 DS                                                    
     D returnVal                     10i 0                                   
     D returnArr                     10i 0 dim(12)                           
      ************************************************************           
                                                                             
     D iconv           PR            10I 0 extproc('iconv')                  
     D ConversionDescriptor...                                               
     D                                     value like(ConversionDescriptor)  
     D InputBuffer                     *   value                             
     D InputBytesLeft                  *   value                             
     D OutputBuffer                    *   Value                             
     DOutputbytesLeft                  *   value                             
                                                                             
     DOutputBufferptr  S               *                                       
     DInputBytesLeft   S             10I 0                                     
     DOutputBytesLeft  S             10I 0                                     
                                                                               
     DInput_Value      S             50    Inz('Hello')                        
     D ptr1            S               *   Inz(%addr(Input_Value))             
     D ptrtoptr1       S               *   Inz(%addr(ptr1))                    
     DReturnCode       S             10I 0                                     
                                                                               
      ************************************************************             
     D CloseProc       PR            10I 0 extproc('iconv_close')              
     D ConversionDescriptor...                                                 
     D                                     value like (ConversionDescriptor)   
      ************************************************************             
                                                                               
                                                                               
      /free                                                                    
         FromCCSID = 0;               // (job CCSID is used);                  
         ToCCSID = 1200;                                                       
         ConversionDescriptor = OpenPROC(%addr(ToCode):%addr(FromCode));       
         If returnVal = -1;                                
            DSPLY 'Error in Open';                         
         else;                                             
            // If Opened                                   
           InputBytesLeft = %len(%TRIMR(Input_Value));     
           OutputBytesLeft = %SIZE(Input_Value);           
                                                           
           ReturnCode = iconv(ConversionDescriptor:        
                             ptrtoptr1:                    
                             %addr(InputBytesLeft):        
                             ptrtoptr1:                    
                             %addr(OutputBytesLeft));      
                                                           
           If ReturnCode = -1;                             
              DSPLY 'Conversion error';                    
           endif;                                          
                                                           
           ReturnCode = CloseProc(ConversionDescriptor);   
                                                           
         Endif;                                            
                          
         *inlr = *on;     
       /end-free                   
