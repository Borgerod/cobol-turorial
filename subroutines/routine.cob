       IDENTIFICATION DIVISION.
       PROGRAM-ID. routine.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 num-1    PIC 9(1) VALUE 5.
           01 num-2    PIC 9(1) VALUE 4.
           01 sum-1      PIC 9(2).
           
       PROCEDURE DIVISION.
      *    calling the subroutine COME-GET-SUM
           CALL 'COME-GET-SUM' USING num-1, num-2, sum-1
           DISPLAY num-1 " + " num-2 " = " sum-1.
      *    IMPORTANT -> compile with "-m" instead of "-x" 
       STOP RUN.
