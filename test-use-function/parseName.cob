       IDENTIFICATION DIVISION.
       FUNCTION-ID. parseName.
       AUTHOR. Aleksander Bogerød.
       DATE-WRITTEN. 16.04.2026.
              
       
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       *> TEST
       01 FullNameBuffer     PIC X(61).
       01 SpacePos           PIC 99.
       01 I                  PIC 99.
       01 FoundFlag          PIC X VALUE 'N'.
              
       LINKAGE SECTION.
       01 FullName.
              05 FirstName PIC A(30).
              05 SurName PIC A(30).
       
       PROCEDURE DIVISION RETURNING FullName.
       
              DISPLAY "Enter full name (firstname surname): " WITH NO ADVANCING
              ACCEPT FullNameBuffer
              
             *>  loop through every character one by one, and stop as soon as you hit a space, remembering where it was.
              MOVE 0 TO SpacePos
              MOVE 'N' TO FoundFlag
              PERFORM VARYING I FROM 1 BY 1
                  UNTIL I > 61 OR FoundFlag = 'Y'
                  IF FullNameBuffer(I:1) = ' '
                      MOVE I TO SpacePos
                      MOVE 'Y' TO FoundFlag
                  END-IF
              END-PERFORM
              
             *>  if we found a space, use its position to cut the buffer into two pieces and store them in FirstName and SurName. Otherwise, complain to the user.
              IF SpacePos > 0
                  MOVE FullNameBuffer(1 : SpacePos - 1)      TO FirstName
                  MOVE FullNameBuffer(SpacePos + 1 : 30)     TO SurName
              ELSE
                  DISPLAY "Invalid input - please enter firstname and surname"
              END-IF
       
              GOBACK RETURNING FullName.
              END FUNCTION parseName.
       