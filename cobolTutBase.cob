       >> SOURCE FREE FORMAT
       *> TUTORIAL PROGRESS: https://www.youtube.com/watch?v=TBs7HXI76yU
       *> 13:43 - variables/datatypes
       
       
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltut.
       AUTHOR. Aleksander Bogerød.
       DATE-WRITTEN. 15.04.2026.
       
       
       DATA DIVISION.
       FILE SECTION.
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
       *> 01 FullName PIC X(62).
       01 user-count PIC 9(10). *>THIS AINT FINISHED
       01 user-response PIC a(1).
       LINKAGE SECTION.
       PROCEDURE DIVISION.
             *>*> FORM INPUT + SET VARIABLES 
              DISPLAY "Create New Account". 
              DISPLAY "Enter full name (fisrtname, surname): " WITH NO ADVANCING
                  ACCEPT FullName.
              UNSTRING FullName delimited by ","
                  INTO FirstName SurName
              END-UNSTRING.
              DISPLAY "HELLO " SurName.
              
              DISPLAY "Create New Account". 
              DISPLAY "Enter full name (fisrtname surname): " WITH NO ADVANCING
                  ACCEPT FullName
              UNSTRING FullName delimited by ","
                  INTO FirstName SurName
              END-UNSTRING.
              DISPLAY "HELLO " SurName
              
              
             *>*> GENERATE USERNAME
              STRING user-prefix DELIMITED BY SIZE
                     user-count DELIMITED BY SIZE
                     INTO UserName 
              END-STRING.
              DISPLAY "your default username is: " UserName. 
              Default username
       
             
             *>*> IF STATEMENT
              DISPLAY "Would you like to change it? y/n"
                  ACCEPT user-response.
                  IF user-response = "y"
                      DISPLAY "Yes"
                      DISPLAY "Enter your new username: " WITH NO ADVANCING
                          ACCEPT UserName
                  END-IF.
              DISPLAY "Account created, welcome " UserName
       
             *>*> (RESET VALUE) MOVE VALUE INTO VARIABLE
              MOVE ZERO TO UserName
              DISPLAY "MOVE '0' into variable: " UserName
       
             *>*>MATH
              DISPLAY "Enter 2 values to sum "
              ACCEPT x
              ACCEPT y
              COMPUTE Total = x + y 
              DISPLAY "= " Total
       
       
              DISPLAY "Enter Social Security Number (SSN): "
              ACCEPT SSN
       
              display "Full SSN: " SSN
              display "Area: " SSArea
              display "Group: " SSGroup
              display "Serial: " SSSerial
                      
        
        
              STOP RUN.
       