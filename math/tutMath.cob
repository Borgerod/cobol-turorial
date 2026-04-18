       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutMath.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 18.04.2026.
       
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
           01 TestVaiable PIC S9(1)V9 VALUE 1.1.
           
           
       
       PROCEDURE DIVISION.
      *    MATH
           
           DISPLAY SPACE
           DISPLAY SPACE
           DISPLAY SPACE
           DISPLAY "MATH:"

      *    Basic math
           DISPLAY SPACE
           DISPLAY "   basic math:"

      *    add
           DISPLAY SPACE
           DISPLAY "       add:"
           ADD Num1 TO Num2 GIVING Ans                  *> alt 1
           COMPUTE Ans = Num1 + Num1                    *> alt 2
           DISPLAY "       add Num1 to Num2 = " Ans

      *    subtract
           DISPLAY SPACE
           DISPLAY "       subtract:"
           SUBTRACT Num1 FROM Num1 GIVING Ans           *> alt 1
           COMPUTE Ans = Num1 - Num1                    *> alt 2
           DISPLAY "       subtract Num1 to Num2 = " Ans

      *    divide
           DISPLAY SPACE
           DISPLAY "       divide:"
           DIVIDE Num1 BY num2 GIVING Ans REMAINDER Rem *> alt 1
           COMPUTE Ans = Num1 / Num1                    *> alt 2 (-Rem)
           DISPLAY "       divide Num1 by Num2 = " Ans " | remainder = " Rem

      *    multiply
           DISPLAY SPACE
           DISPLAY "       multiply:"
           MULTIPLY Num1 BY num2 GIVING Ans             *> alt 1
           COMPUTE Ans = Num1 * Num1                    *> alt 2
           DISPLAY "       multiply Num1 by Num2 = " Ans
           


      *    Basic math
           DISPLAY SPACE
           DISPLAY "   special math:"

      *    power of
           DISPLAY SPACE
           DISPLAY "       power of:"           
           COMPUTE Ans = 15 ** 2  
           DISPLAY "       15 ** 2 = " Ans

      *    with / without paranthesis
           DISPLAY SPACE
           DISPLAY "       with / without paranthesis:"
           COMPUTE Ans = 15 + 5 * 2
           DISPLAY "       15 + 5 * 2 = " Ans
           COMPUTE Ans = ( 15 + 5 ) * 2  
           DISPLAY "       ( 15 + 5 ) * 2 = " Ans

      *    rounded
           DISPLAY SPACE
           DISPLAY "       rounded:"
           COMPUTE Ans ROUNDED = 3.0 + 2.005
           DISPLAY "       ROUNDED = 3.0 + 2.005 = " Ans
       

           STOP RUN.
