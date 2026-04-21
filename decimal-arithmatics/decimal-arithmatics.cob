       IDENTIFICATION DIVISION.
       PROGRAM-ID. decimal-arithmatics.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.

      *timestamp: 54:18
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 gross-price    PIC 9(4)V9(2).
           01 tax-rate    PIC V9(3) VALUE .075.
           01 net-price    PIC 9(4)V9(2).
       
       PROCEDURE DIVISION.
      *    other languages use floating point calculations. 
      *    -> can introduce errors: 0.00000000001
      *    Cobol uses something called; fixed-point-decimal-arithmatic
      *    allowing you to define how to round values.
      *    which is one of the reasons why it is so popular in fintech
           
           STOP RUN.
       