       IDENTIFICATION DIVISION.
       PROGRAM-ID. write-file.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 22.04.2026.
      * timestamp: 1:10:55

       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CustomerFile ASSIGN TO "Customer.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               *> means: each piece OF DATA uses one LINE.
               ACCESS IS SEQUENTIAL.
               
       DATA DIVISION.
       FILE SECTION.
           FD CustomerFile.  *> FD = file description
           01 CustomerData. *> make customer RECORD:
               05 ID-num PIC 9(5).
               05 customer-name.
                   10 first-name PIC a(8).
                   10 last-name PIC a(15).
                   
       WORKING-STORAGE SECTION.
           01 WS-CustomerData. *> make customer RECORD:
               05 WS-ID-num PIC 9(5).
               05 WS-customer-name.
                   10 WS-first-name PIC a(8).
                   10 WS-last-name PIC a(15).
           01 WS-last-id-num PIC 9(5) VALUE 00000.
       PROCEDURE DIVISION.
      *    will do: 
      *             - look FOR FILE: OPEN file or create file.
      *             - add all of our fields, write file.
      *             - CLOSE FILE.
      

      *    (1) FROM STATIC DATA
      *    OPEN OUTPUT CustomerFile. *> destructive - will overwrite
           OPEN EXTEND CustomerFile. *> destructive - will extend
               MOVE 00001 TO ID-num. 
               MOVE "Doug" TO first-name. 
               MOVE "Thomas" TO last-name.
               WRITE CustomerData
               END-WRITE.
           CLOSE CustomerFile.
           DISPLAY SPACE
           

      *    seperating FOR now
           OPEN INPUT CustomerFile.
            READ CustomerFile
             AT END
               DISPLAY "End of file"
             NOT AT END
               DISPLAY "reading: " ID-num " " first-name " " last-name
               MOVE ID-num TO WS-last-id-num
            END-READ.
           CLOSE CustomerFile.
           
      *    (2) FROM INPUT
           OPEN OUTPUT CustomerFile.
               DISPLAY "Register new customer "
               DISPLAY SPACE
               
               *> idea: REPLACE WITH increment generator
      *        Increment ID-num FROM WS-last-id-num
               COMPUTE ID-num = WS-last-id-num + 1
      *        ADD 1 TO WS-last-id-num GIVING ID-num
               DISPLAY "Customer ID :" ID-num
      *        DISPLAY "Customer ID :" WITH NO ADVANCING
      *        ACCEPT ID-num
               
               DISPLAY "first name :" WITH NO ADVANCING
               ACCEPT first-name
               
               DISPLAY "last name :" WITH NO ADVANCING
               ACCEPT last-name

               DISPLAY "Adding new customer: " CustomerData
               WRITE CustomerData
               END-WRITE.
           CLOSE CustomerFile.
           DISPLAY SPACE
           
           STOP RUN.
       