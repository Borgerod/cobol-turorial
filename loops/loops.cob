       IDENTIFICATION DIVISION.
       PROGRAM-ID. loops.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 i    PIC 9(1).
       
       PROCEDURE DIVISION.
           DISPLAY "while loop:"
           PERFORM WhileLoopOutput WITH TEST AFTER UNTIL i > 5
               GO TO ForLoop.
           STOP RUN.
       

           WhileLoopOutput.    
               DISPLAY "   " i.
               ADD 1 TO i.

           ForLoop.
               DISPLAY "for loop: "
               PERFORM ForLoopOutput VARYING i FROM 1 BY 1 UNTIL i=5
               STOP RUN.

           ForLoopOutput.
               DISPLAY "   " i.

           