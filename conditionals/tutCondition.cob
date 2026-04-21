       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutCondition.
       AUTHOR. Aleksander Borgerød.
       DATE-WRITTEN. 16.04.20.
      *https://www.youtube.com/watch?v=TBs7HXI76yU
      *time: 33:20     

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
      * NOTE 
      *    Not in use, wanted to set esignated-score-test to
      *    a specific passingScore class based on Ethinicty results 
      *    to make it more dynamic, but that is not allowed apparently.
      *    CLASS passingScoreAsian IS "A" THRU "C", "D".*> just to show
      *    CLASS passingScore IS "A" THRU passing-score-end.
           CLASS passingScoreAsian IS "A".
           CLASS passingScore IS "A" THRU "E".
           
       DATA DIVISION.
       WORKING-STORAGE SECTION.
 
      * not in use (used to show my original idea)
       01 designated-score-test  PIC X(1).
       01 allowedGrades PIC X(6).
       01 ethnicity PIC X(6) VALUE "Other ".
       
       01 test-length PIC 99 VALUE 0.
           88 is-single VALUE 1.
       01 test-number PIC X(10).
           88 is-prime VALUE "1","3","5","7".
           88 is-composite VALUE "4","6","8","9".
           88 is-odd VALUE "1","3","5","7","9".
           88 is-even VALUE "2","4","6","8".
           88 is-less-than-5 VALUE "0" THRU "4".
           88 is-number VALUE "0" THRU "9".
           88 is-x VALUE "X".
           88 is-empty VALUE SPACE.
       01 Student.
           05 Age    PIC 9(3) VALUE 000.
     
           05 Can-vote-flag PIC 9(1) VALUE 0.
               88 can-vote VALUE 1.
               88 can-not-vote VALUE 0.
           
           05  Grade   PIC X.
           05  Grade-Sub   REDEFINES Grade PIC 9.
           05  Score-Table.
               10  A   PIC 9(1) VALUE 6.
               10  B   PIC 9(1) VALUE 5.
               10  C   PIC 9(1) VALUE 4.
               10  D   PIC 9(1) VALUE 3.
               10  E   PIC 9(1) VALUE 2.
               10  F   PIC 9(1) VALUE 1.
           05  Score-Array REDEFINES Score-Table.
               10  Score-Entry   PIC 9 OCCURS 6 TIMES.
           05  Score             PIC 9.
           05 MatchCount PIC 9 VALUE 0.
               88 has-passed VALUE 1.
       PROCEDURE DIVISION.
           DISPLAY "Enter Age : " WITH NO ADVANCING

           ACCEPT Age
           DISPLAY "Enter Grade : " WITH NO ADVANCING
           ACCEPT Grade
           MOVE Score-Entry(Grade-Sub) TO Score

           DISPLAY "Grade: " Grade " Score: " Score

      *    ! IF/ELSE is available but discouraged.
           IF Age >= 18 THEN
               DISPLAY "You can vote"
           ELSE
               DISPLAY "You cannot vote"
           END-IF
           
      *    Preferred method: (only IF) -> ELSE IS usually "built-in"
      *    better for multiple options when not using a switch          
           IF Age LESS THAN 5 THEN
               DISPLAY "Stay Home"
           END-IF
           
           IF Age = 5 THEN
               DISPLAY "Go to kindergarden"   
           END-IF
           
           IF Age > 5 AND Age < 18 
               DISPLAY "Go to Grade " Grade
           END-IF

           IF Age >= 18
               IF Score <= 3
               DISPLAY "Go to Collage"
               END-IF

               IF Score >= 4
               DISPLAY "Go to Uni"
               END-IF
               
           END-IF
           
      *    AsianClause ALT 1
      *    uses a higher expectation if you are of asian background. 
           DISPLAY "Enter your ethnicity" WITH NO ADVANCING
           ACCEPT ethnicity

      *    ALT 1
      *    EVALUATE ethnicity
      *        WHEN "Asian"
      *            MOVE "A" TO allowedGrades
      *        WHEN OTHER
      *            MOVE "ABCDE" TO allowedGrades
      *    END-EVALUATE
      *   
      *    INSPECT allowedGrades TALLYING MatchCount FOR ALL Grade
      *    IF MatchCount > 0
      *        DISPLAY "You Passed"
      *    ELSE
      *        DISPLAY "You Failed"
      *    END-IF

      *    ALT 2
           EVALUATE ethnicity
               WHEN "Asian"
                   IF Grade passingScoreAsian
                       DISPLAY "You Passed"
                   ELSE
                       DISPLAY "You Failed"
                   END-IF
               WHEN OTHER
                   IF Grade passingScore
                       DISPLAY "You Passed"
                   ELSE
                       DISPLAY "You Failed"
                   END-IF
           END-EVALUATE

      *NUMERIC ALPHABETIC ALPHABETIC-UPPER
           IF Score IS NOT NUMERIC THEN
               DISPLAY "Not a number"
           END-IF       

           IF Age > 18 THEN 
                   SET can-vote TO TRUE
               ELSE 
                   SET can-not-vote TO TRUE
               DISPLAY "User is old enough to Vote :" Can-vote-flag
           END-IF 


      *    EVALUATE NUMBER
           PERFORM UNTIL is-x
           MOVE 0 TO test-length
           MOVE SPACES TO test-number
           DISPLAY "Enter Single Number [press 'X' to Exit]:" 
               WITH NO ADVANCING
           ACCEPT test-number
           INSPECT FUNCTION TRIM(test-number) TALLYING test-length 
               FOR ALL CHARACTERS
      
           IF test-number(1:1) = "X"
               EXIT PERFORM
           END-IF
           IF NOT is-number OR NOT is-single OR is-empty
               IF is-empty
                   DISPLAY "Error: is empty"
               ELSE
                   IF NOT is-number
                        DISPLAY "Error: not a number"
                   END-IF
                   IF NOT is-single
                       DISPLAY "Error: not a single"
                   END-IF
               END-IF
           ELSE
               DISPLAY "=> Your number is " WITH NO ADVANCING
               EVALUATE TRUE
                   WHEN is-prime DISPLAY "Prime"
                   WHEN is-odd DISPLAY "Odd"
                   WHEN is-even DISPLAY "Even"
                   WHEN is-composite DISPLAY "Composite"
                   WHEN is-less-than-5 DISPLAY "Less than 5"
               END-EVALUATE
           END-PERFORM.

           STOP RUN.
           END PROGRAM tutCondition.

      