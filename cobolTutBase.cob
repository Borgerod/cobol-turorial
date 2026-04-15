*> TUTORIAL PROGRESS: https://www.youtube.com/watch?v=TBs7HXI76yU
*> 10:57



IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
AUTHOR. Aleksander Bogerød.
DATE-WRITTEN. 15.04.2026.


DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 user-prefix PIC X(5) VALUE "user_".
01 UserName PIC X(30).
01 FirstName PIC A(30) VALUE " ".
01 SurName PIC A(30) VALUE " ".
01 TravelScore PIC 9999 VALUE ZEROS.
01 YearsActive PIC 999 VALUE ZEROS.
01 TotalScore PIC 9999999 VALUE 0.
01 SSN.
       05 SSArea PIC 999.
       05 SSGroup PIC 99.
       05 SSSerieal PIC 9999.
01 PIVALUE CONSTANT AS 3.14.

LOCAL-STORAGE SECTION.
01 fullname PIC X(62).
01 user-count PIC 9(10). *>THIS AINT FINISHED
01 user-response PIC a(1).
LINKAGE SECTION.
PROCEDURE DIVISION.
       DISPLAY "Create New Account". 
       DISPLAY "Enter full name (fisrtname, surname): " WITH NO ADVANCING
      *>     ACCEPT FirstName SurName DELIMITED BY ","
           ACCEPT fullname.

       UNSTRING fullname delimited by ","
           INTO FirstName SurName
       END-UNSTRING.
       DISPLAY "HELLO " SurName.
       
      *> creating username
       STRING user-prefix DELIMITED BY SIZE
              user-count DELIMITED BY SIZE
              INTO UserName 
       END-STRING.
       DISPLAY "your default username is: " UserName. *>Default username
       DISPLAY "Would you like to change it? y/n"
           ACCEPT user-response.
           IF user-response = "y"
               DISPLAY "Yes"
               DISPLAY "Enter your new username: " WITH NO ADVANCING
                   ACCEPT UserName
           END-IF.
       DISPLAY "Account created, welcome " UserName
       STOP RUN.
