       IDENTIFICATION DIVISION.
       PROGRAM-ID. string-functions.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 22.04.2026.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

           01 samp-str     PIC X(18) VALUE 'eerie beef sneezed'.
           01 num-chars    PIC 99 VALUE 0.
           01 e-count       PIC 99 VALUE 0.

           01 user-name.
               05 f-name   PIC X(6) VALUE 'Martin'.
               05 m-name   PIC X(11) VALUE 'Luther'. 
               *>note: value is too small
               05 l-name   PIC X(4) VALUE 'King'.
               
           01 fl-name      PIC X(11).
           01 fml-name     PIC X(20). *> should be 18 why is it not working
      *    01 fml-name     PIC X(25).
           
      *    sample strngs
           01 sample-string.
                05 s-str-0 PIC X(18) VALUE 'eerie beef sneezed'.
                05 s-str-1 PIC X(7) VALUE 'The egg'.
                05 s-str-2 PIC X(9) VALUE 'is #1 and'.
                05 s-str-3 PIC X(3). 
                05 s-str-4 PIC X(3).

           01 dest         PIC X(33) VALUE 'is the big chicken'.
           01 dest-2         PIC X(33).
           01 ptr          PIC 9 VALUE 1.
       
       PROCEDURE DIVISION.
           DISPLAY "STRING MANIPULATION:"
           DISPLAY SPACE
           DISPLAY SPACE
          
           DISPLAY "   [0] sample string: " s-str-0
           DISPLAY SPACE

      *    iteration - count chars
           DISPLAY "     iteration - count chars"
           INSPECT s-str-0 TALLYING num-chars FOR CHARACTERS.
           DISPLAY "       num of characters: " num-chars
           
           INSPECT s-str-0 TALLYING e-count FOR ALL "e".
           DISPLAY "       num of characters: " e-count
           DISPLAY SPACE

      *    change case
           DISPLAY "     change case"                       
           DISPLAY "       uppercase: "FUNCTION UPPER-CASE(s-str-0)
           DISPLAY "       lowercase: "FUNCTION LOWER-CASE(s-str-0)
           DISPLAY SPACE
           
           
           
           
      *_________________________________________________________________
           DISPLAY "     join strings"                       
           STRING f-name DELIMITED BY SIZE *>start of point
           SPACE *> dictating that youll put a space between the strings
           l-name DELIMITED BY SIZE *> joining with this string
           INTO fl-name. *> end-point
           DISPLAY "       First+last name : " fl-name
           DISPLAY SPACE


           DISPLAY "     insert strings between (w/o overflow saftey)"                       
      *    string insert + overflow
           STRING f-name DELIMITED BY SIZE 
      *    USING fl-name BY SPACE, JUST TO show alt way OF doing it.
      *    split by space => Martin
           SPACE 
      *    m-name DELIMITED BY SIZE *> this will include all leftover spaces
           m-name DELIMITED BY SPACE *> this will exclude all leftover spaces
      *    insert space+m-name after split => Marting Luther
           SPACE
      *    re-insert space+l-name after split => Marting Luther King
           l-name DELIMITED BY SIZE
           INTO fml-name
           ON OVERFLOW DISPLAY "         error: string overflow".
           DISPLAY "         first+{middle}+last : " fml-name
           DISPLAY SPACE


           DISPLAY "     insert strings between (w/ overflow saftey)"                       
           STRING FUNCTION TRIM(f-name) DELIMITED BY SIZE 
                  SPACE
                  FUNCTION TRIM(m-name) DELIMITED BY SIZE
                  SPACE
                  FUNCTION TRIM(l-name) DELIMITED BY SIZE
           INTO fml-name
           DISPLAY "       First+last name : " fml-name 
           DISPLAY SPACE


      *_________________________________________________________________
               
      *    insert string by pointer
           DISPLAY "     insert string by pointer"  
           STRING s-str-1 DELIMITED BY SIZE
           SPACE
      *    want to grab the string from s-str-2 up to "#" -> "is "
           s-str-2 DELIMITED BY "#"
      *    then insert grabbed-str, starting at index=1 defined by ptr
           INTO dest-2 *> insert here
           WITH POINTER ptr
      *    inserting s-str-1 + "is " -> "is the big chicken" 
      *               AT i=1 : ^  
      *    "The egg IS " is taking UP the spaces "is the big " in dest.
      *    insert works like insert ON keyboard => it will REPLACE chars
      *    explaination: 
      *        'The egg'.
      *        'is #1 and'.
      *        'is the big chicken'.

      *        s-str-1 + s-str-2[:#] 
      *        = "The egg "+"is " 
      *        = "The egg is "
      *        '[is the big ]chicken'.
      *        '[The egg is ]chicken'.    
           ON OVERFLOW DISPLAY "       error: string overflow".
           DISPLAY "       dest : " dest-2
           DISPLAY "       dest : " dest
           DISPLAY SPACE
           
       
      *    UNSTRING
      *    splitting UP the STRING BY SPACE THEN INSERT the VALUES(2):
      *        val 1 = "The"
      *        val 2 = "egg "
      *    into empty string variables:  s-str-3, s-str-4
           UNSTRING s-str-1 DELIMITED BY SPACE
           INTO s-str-3, s-str-4
           END-UNSTRING
           DISPLAY "s-str-4 : " s-str-4
           DISPLAY SPACE

           STOP RUN.
       