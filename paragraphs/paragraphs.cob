       IDENTIFICATION DIVISION.
       PROGRAM-ID. paragraphs.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 test-variable    PIC X(10).
           
       PROCEDURE DIVISION.
           sub-one.
      *        closed paragraphs do not have "." at the end. 
               DISPLAY "In paragraph 1 (CLOSED PARAGRAPH)"
               PERFORM sub-two 
               DISPLAY "Returned to paragraph 1"
               PERFORM sub-four 2 TIMES
               STOP RUN.
           sub-three.
            DISPLAY "      In paragraph 3 (CLOSED PARAGRAPH)".

           sub-two.
               DISPLAY "   In paragraph 2 (CLOSED PARAGRAPH)"
               PERFORM sub-three
               DISPLAY "   Returned to paragraph 2".

           sub-four.
           DISPLAY "   In paragraph 4 (OPEN PARAGRAPH)"
      *        note: you cannot define new paragraphs after a open one.
      *        open paragraphs do not have "." at the end. 
               DISPLAY "       Repeat"
               