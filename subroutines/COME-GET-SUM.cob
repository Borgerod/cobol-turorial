       IDENTIFICATION DIVISION.
       PROGRAM-ID. COME-GET-SUM.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.
       
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       LINKAGE SECTION.
      *    NOTE: l stands for linked 
           01 l-num-1    PIC 9(1) VALUE 5.
           01 l-num-2    PIC 9(1) VALUE 4.
           01 l-sum    PIC 9(2).
       
      *this is the SUBROUTINE that routine will call
       PROCEDURE DIVISION USING l-num-1, l-num-2, l-sum.
           COMPUTE l-sum = l-num-1 + l-num-2.
      *    IMPORTANT -> EXIT PROGRAM instead of STOP RUN.
           EXIT PROGRAM.
       