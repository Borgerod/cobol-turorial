       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutCondition.
       AUTHOR. Aleksander Borgerød.
       DATE-WRITTEN. 16.04.20.
      *https://www.youtube.com/watch?v=TBs7HXI76yU
      *time: 33:20     

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS passingScoreAsian IS "B" THRU "C", "D".
           CLASS passingScoreJewish IS "A", "B", "C", "D", "E", "F". 
           CLASS passingScoreOther IS "F" THRU "C", "D".
     
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
     
       01 allowedGrades PIC X(6).



       01  designated-score-test  PIC X(1).
       01 ethnicity PIC X(6) VALUE "Other ".
       01 test-number PIC X.
           88 is-prime VALUE "1","3","5","7".
           88 is-composite VALUE "4","6","8","9".
           88 is-odd VALUE "1","3","5","7","9".
           88 is-even VALUE "2","4","6","8".
           88 is-less-than-5 VALUE "0" THRU "4".
           88 is-number VALUE "0" THRU "9".
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
           
      * ethnicity
           DISPLAY "Ethnicity"
           ACCEPT ethnicity

      *    CALL "GET-SCORE-MODEL" USING ethnicity designated-score-test
      *    IF Score = designated-score-test THEN
      *        DISPLAY "You Passed"
      *    ELSE
      *        DISPLAY "You Failed"
      *    END-IF
      *    
           
           EVALUATE ethnicity
               WHEN "Asian"
                   MOVE "A" TO allowedGrades
               WHEN "Jewish"
                   MOVE "ABCDEF" TO allowedGrades
               WHEN OTHER
                   MOVE "ABCDE" TO allowedGrades
           END-EVALUATE
          
           
           INSPECT allowedGrades TALLYING MatchCount FOR ALL Score
           INSPECT allowedGrades TALLYING MatchCount FOR ALL Grade
           IF MatchCount > 0
      *    IF has-passed
               DISPLAY "You Passed"
           ELSE
               DISPLAY "You Failed"
           END-IF
           STOP RUN.

           DISPLAY "Allowed Grades: " allowedGrades
      *NUMERIC ALPHABETIC ALPHABETIC-UPPER
           IF Score IS NOT NUMERIC THEN
               DISPLAY "Not a number"
           END-IF
       
           IF Age > 18 THEN
               SET can-vote TO TRUE
           ELSE SET can-not-vote TO TRUE
           END-IF 
           DISPLAY "User is old enough to Vote :" Can-vote-flag


           STOP RUN.
           END PROGRAM tutCondition.

      