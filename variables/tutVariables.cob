       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutVariables.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 16.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 SampleData
              PIC X(10)   VALUE "Stuff".
           01 JustLetters  PIC AAA   VALUE "ABC".
           01 JustNums  PIC 9(4)   VALUE 1995.
           01 SignedInt  PIC S9(4)   VALUE -1995.
           01 PayCheck  PIC 9(4)V9(2)   VALUE ZEROES.
           01 Customer.
               05 Indent PIC 9(3).
               05 custName PIC X(20).
               05 DateOfBirth.
                   10 dd PIC 9(2).
                   10 mm PIC 9(2).
                   10 yyyy PIC 9(4).
           01 Num1 PIC 9(1) VALUE 5.
           01 Num2 PIC 9(1) VALUE 4.
           01 Num3 PIC 9(1) VALUE 3.
           01 Ans PIC S9(2)V9(2) VALUE 0.
           01 Rem PIC S9(1)V9(2).
           
           
       
       PROCEDURE DIVISION.
           MOVE "More stuff" TO SampleData
           MOVE "123" TO SampleData
           MOVE 123 TO SampleData
           DISPLAY "SampleData: " SampleData
           DISPLAY "PayCheck: " PayCheck
           
      *    Add more data to existing user
           MOVE "123Bob Smith           04121987" TO Customer
           DISPLAY "Customer: " custName
           DISPLAY "date of birth: " dd"/"mm"/"yyyy
           
           display " "
           display "(before) Reset SampleData -> " SampleData
      *    reset Sampledata - showing different types of resets
           MOVE ZERO TO SampleData
           display "reset (w/zero) SampleData -> " SampleData

           MOVE SPACE TO SampleData
           display "reset (w/spaces) to SampleData -> " SampleData

           MOVE HIGH-VALUE TO SampleData
           display "reset (w/high-value) to SampleData -> " SampleData

           MOVE LOW-VALUE TO SampleData
           display "reset (w/low-value) to SampleData -> " SampleData

           MOVE QUOTE TO SampleData
           display "reset (w/quote) to SampleData -> " SampleData

           MOVE "2x" TO SampleData
           display "reset (w/custom-str) to SampleData -> " SampleData

      *    math
           add Num1 to Num2 giving Ans
           display "ans: " Ans
      *    subtract Num1 to Num1 giving Ans
      *    divide Num1 TO num2 GIVING Ans REMAINDER Rem
           display "remainder: " Rem
           
           
                      
           
           
           STOP RUN.
