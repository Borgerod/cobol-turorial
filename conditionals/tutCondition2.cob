       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN-PROGRAM.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS passingScore1    IS "B" THRU "C", "D".
           CLASS passingScore2    IS "A", "B", "C", "D", "E", "F".
           CLASS passingScoreOther IS "F" THRU "C", "D".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 answer      PIC X(6) VALUE "Other ".
       01 answer-trim PIC X(1).

       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE "B     " TO answer
           CALL "GET-SCORE-MODEL" USING answer
           STOP RUN.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. GET-SCORE-MODEL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-FIRST-CHAR PIC X(1).

       LINKAGE SECTION.
       01 LS-ANSWER PIC X(6).

       PROCEDURE DIVISION USING LS-ANSWER.
       GET-SCORE-MODEL-PARA.
           MOVE LS-ANSWER(1:1) TO WS-FIRST-CHAR
           EVALUATE TRUE
               WHEN WS-FIRST-CHAR IS passingScore1
                   DISPLAY "Score Class: passingScore1"
               WHEN WS-FIRST-CHAR IS passingScore2
                   DISPLAY "Score Class: passingScore2"
               WHEN WS-FIRST-CHAR IS passingScoreOther
                   DISPLAY "Score Class: passingScoreOther"
               WHEN OTHER
                   DISPLAY "Score Class: Unknown"
           END-EVALUATE
           GOBACK.

       END PROGRAM GET-SCORE-MODEL.
       END PROGRAM MAIN-PROGRAM.
       