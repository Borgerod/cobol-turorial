       IDENTIFICATION DIVISION.
       PROGRAM-ID. edit-data.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 start-num    PIC 9(8)V9(2) VALUE 00001123.55.
           01 no-zero    PIC Z(7)V9(2).
      *    unfortunetly my namingconvension does not work anymore.
      *    01 no-zero-plus-commas    PIC Z(2),Z(3),Z(3)V9(2).
           01 no-zero-plus-commas    PIC ZZ,ZZZ,ZZ9.99.
           01 dollar    PIC $$,$$$,$$9.99.
           01 b-day PIC 9(8) VALUE 12211974.
           01 a-date PIC 99/99/9999.
           01 date-format PIC 99/99/9999.
           
       PROCEDURE DIVISION.
      *    Edited Pictures.
           MOVE start-num TO no-zero
           DISPLAY "start-num as no-zero: " no-zero

           MOVE start-num TO no-zero-plus-commas
           DISPLAY "start-num as no-zero-plus-commas: " 
               no-zero-plus-commas
           
           MOVE start-num TO dollar
           DISPLAY "start-num as dollar: " dollar
           
           MOVE b-day TO date-format 
           DISPLAY "b-day as date-format: " date-format
           
           STOP RUN.
       