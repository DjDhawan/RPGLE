     H DftActGrp(*no) ActGrp(*new)
      *
     D Open            PR            10I 0 Extproc('Open')
     D                                 *   Value options(*string)
     D                               10I 0 Value
     D                               10U 0 Value options(*nopass)
     D                               10U 0 Value options(*nopass)
      *
     D Write           PR            10I 0 Extproc('Write')
     D                               10I 0 Value
     D                                 *   Value
     D                               10U 0 Value
      *
     D Close           PR            10I 0 ExtProc('Close')
     D                               10I 0 Value
      *
     D IFS_Write       C                   2
     D IFS_Rdwrt       C                   4
     D IFS_Create      C                   8
     D IFS_Clear       C                   64
     D IFS_Append      C                   256
      *
     D fd              S             10I 0
     D data            S             50A
      /free
         fd = Open('home/test/file1.txt'   //Parameter 1- File name
                    :IFS_Create+IFS_Write+IFS_Clear  //File create options
                    :(6*64)+(6*8)+(4));              //File permissions
         if fd < 0;
            Dsply 'Error';
         else;
            Data = 'Testing...';
            Callp(E) Write(fd: %addr(data): %len(%trimr(data)));
             //Parameters(file pointer:address of data: length)
            If %Error();
               Dsply 'Error while calling write()';
            Endif;
            Callp(E) Close(fd);
            If %Error();
               Dsply 'Error while calling write()';
            Endif;
         endif;
            *inlr= *on;
      /end-free
