       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutVariables.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 16.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 SampleData
              PIC X(10)   VALUE SPACES.
           01 JustLetters  PIC AAA   VALUE "ABC".
           01 JustNums  PIC 9(4)   VALUE 1995.
           01 SignedInt  PIC S9(4)   VALUE -1995.
           01 Customer.
               05 id-num PIC 9(3).
               05 custName PIC X(20).
               05 DateOfBirth.
                   10 dd PIC 9(2).
                   10 mm PIC 9(2).
                   10 yyyy PIC 9(4).
               05 PayCheck  PIC 9(4)V9(2)   VALUE ZEROES.
           01 Num1 PIC 9(1) VALUE 5.
           01 Num2 PIC 9(1) VALUE 4.
           01 Num3 PIC 9(1) VALUE 3.
           01 Ans PIC S9(2)V9(2) VALUE 0.
           01 Rem PIC S9(1)V9(2).
           01 TestVaiable PIC S9(1)V9 VALUE 1.1.
           
           
       
       PROCEDURE DIVISION.
      *    VARIABLES
           DISPLAY "VARIABLES"
           DISPLAY SPACE
           DISPLAY SPACE
           
           DISPLAY "   setting data variables"
           DISPLAY "       SampleData (before): " SampleData
           MOVE "More stuff" TO SampleData *> _some examples_
           MOVE "123" TO SampleData        *> _some examples_
           MOVE 123 TO SampleData          *> _some examples_
           DISPLAY "       SampleData (after): " SampleData
           DISPLAY SPACE
           DISPLAY SPACE

      *    Add more data to existing user
           DISPLAY "   adding data to grouped variables"
           DISPLAY "    -> adding to Customer => adding to its children"
           MOVE "123Bob Smith           04121987036729" TO Customer
           DISPLAY "       ID number: " id-num
           DISPLAY "       Customer: " custName
           DISPLAY "       date of birth: " dd"/"mm"/"yyyy
           DISPLAY "       PayCheck: " PayCheck
           DISPLAY SPACE
           DISPLAY SPACE

           
      *    reset Sampledata - showing different types of resets
           DISPLAY "   ways of - reseting data"
           DISPLAY "       (before) Reset SampleData:" 
           DISPLAY "         -> " SampleData
           
           MOVE ZERO TO SampleData
           DISPLAY "       reset (w/zero) SampleData:" 
           DISPLAY "         -> " SampleData

           MOVE SPACE TO SampleData
           DISPLAY "       reset (w/spaces) to SampleData:" 
           DISPLAY "         -> " SampleData

           MOVE HIGH-VALUE TO SampleData
           DISPLAY "       reset (w/high-value) to SampleData:" 
           DISPLAY "         -> " SampleData


           MOVE LOW-VALUE TO SampleData
           DISPLAY "       reset (w/low-value) to SampleData:" 
           DISPLAY "         -> " SampleData

           MOVE QUOTE TO SampleData
           DISPLAY "       reset (w/quote) to SampleData:" 
           DISPLAY "         -> " SampleData

           MOVE "2x" TO SampleData
           DISPLAY "       reset (w/custom-str) to SampleData:" 
           DISPLAY "         -> " SampleData

           STOP RUN.
