   
      *-----------------------
      * This code inspired by the code from lab 5 of IBMS' 
      * COBOL Programming Course
      *They use
      * SPDX-License-Identifier: CC-BY-4.0
      *-----------------------
       
       IDENTIFICATION DIVISION. 
       PROGRAM-ID.    LAB5
       AUTHOR.      HONNA 


       ENVIRONMENT DIVISION. 

       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT DOESNOTEXIST ASSIGN TO PRTLINE.
           SELECT NOACCTDATA   ASSIGN TO  ACCTREC.


       DATA DIVISION. 

       FILE SECTION. 
       FD DOESNOTEXIST RECORDING MODE F.

        01  PRINT-REC.
      *    This would print the word last name
           05  LAST-NAME-O    PIC X(20).
           05  FILLER         PIC X(02) VALUE SPACES.


      *      This adds the $ to the begining of the number 
           05  ACOUNT-LIMIT-O   PIC $$,$$$,$$9.99.
           05  FILLER         PIC X(02) VALUE SPACES.
        
       FD  NOACCTDATA RECORDING MODE F.
       01  ACOUNT-FIELDS.
           05  ACOUNT-LIMIT       PIC S9(7)V99 COMP-3.
           05  LAST-NAME          PIC X(20).
           05  RESERVED           PIC X(7).
           05  COMMENTS           PIC X(50).

       WORKING-STORAGE SECTION.
        01 FLAGS.
           05 LASTREC         PIC X VALUE SPACE.


        01 HEADER-1.
           05  FILLER         PIC X(20) VALUE 'Last Name '.
           05  FILLER         PIC X(15) VALUE SPACES.
           05  FILLER         PIC X(06) VALUE 'Limit '.
           05  FILLER         PIC X(06) VALUE SPACES.

         01  HEADER-2.
           05  FILLER         PIC X(20) VALUE '--------'.
           05  FILLER         PIC X(15) VALUE SPACES.
           05  FILLER         PIC X(10) VALUE '----------'.
           05  FILLER         PIC X(02) VALUE SPACES.

       PROCEDURE DIVISION.
       READ-NEXT-RECORD.
           PERFORM READ-RECORD
     
           PERFORM UNTIL LASTREC = 'Y'
      
               PERFORM WRITE-RECORD
               PERFORM READ-RECORD
           END-PERFORM
           .
      
       CLOSE-STOP.
           CLOSE NOACCTDATA.
           CLOSE NOACCTDATA.
           GOBACK.
      
       READ-RECORD.
           READ NOACCTDATA
               AT END MOVE 'Y' TO LASTREC
           END-READ.
      
       WRITE-RECORD.
           MOVE ACOUNT-LIMIT   TO  ACOUNT-LIMIT-O.
           MOVE LAST-NAME    TO  LAST-NAME-O.
           WRITE PRINT-REC.
