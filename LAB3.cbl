      *-----------------------
      *Code inspired by:
      * Copyright Contributors to the COBOL Programming Course
      * SPDX-License-Identifier: CC-BY-4.0
      *----------------------- 
      
      
      IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      ****** Variables for the report
       77  WHO        PIC X(20).
       77  WHERE      PIC X(25).
       77  WHY        PIC X(30).
       77  RATE       PIC 9(5).
       77  HOURS      PIC 9(5).
       77  GROSS-PAY  PIC 9(6).

       PROCEDURE DIVISION.
      ****** COBOL MOVE statements - Literal Text to Variables
           MOVE  "Sammons" TO WHO.
           MOVE "Charlotte, North Carolina" TO WHERE.
           MOVE "I Am learning COBOL" TO WHY.
           MOVE 20 TO HOURS.
           MOVE 0 TO RATE.
      ****** Calculation using COMPUTE reserved word verb
           COMPUTE GROSS-PAY = HOURS * RATE.
      ****** DISPLAY statements
           DISPLAY "Name: " WHO.
           DISPLAY "Location: " WHERE
           DISPLAY "What are doing: " WHY
           DISPLAY "Hours Worked: " HOURS.
           DISPLAY "Hourly pay: " RATE.
           DISPLAY "Gross Pay: " GROSS-PAY.
           DISPLAY WHO "- " WHERE "-- " WHY.
           GOBACK.
