IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltut.
       AUTHOR. Aleksander Bogerød.
       DATE-WRITTEN. 16.04.2026.
       
ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION parseName.
       
DATA DIVISION.
       WORKING-STORAGE SECTION.
              01 user-prefix PIC X(5) VALUE "user_".
              01 UserName PIC X(30).
              01 TravelScore PIC 9999 VALUE ZEROS.
              01 YearsActive PIC 999 VALUE ZEROS.
              01 TotalScore PIC 9999999 VALUE 0.
              01 x PIC 9(5) VALUE ZERO.
              01 y PIC 9(5) VALUE ZERO.
              01 Total PIC 9(10) VALUE ZERO.
              *> 01 FullName PIC X(62).
              01 FullName.
                     05 FirstName PIC A(30).
                     05 SurName PIC A(30).
              01 SSN.
                     05 SSArea PIC 999.
                     05 SSGroup PIC 99.
                     05 SSSerial PIC 9999.
              01 PIVALUE CONSTANT AS 3.14.
       
       LOCAL-STORAGE SECTION.
              01 user-count PIC 9(10). *>THIS AINT FINISHED
              01 user-response PIC a(1).
       
       LINKAGE SECTION.

PROCEDURE DIVISION.

      *> CALL 'parseName' RETURNING FullName
       MOVE FUNCTION parseName() TO FullName
       display "Firstname: " FirstName
       display "Surname: " SurName

      *> DISPLAY "HELLO " FUNCTION TRIM(SurName)

        
       STOP RUN.
