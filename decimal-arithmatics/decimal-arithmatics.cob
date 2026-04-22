       IDENTIFICATION DIVISION.
       PROGRAM-ID. decimal-arithmatics.
       AUTHOR. Aleksander Borgerød
       DATE-WRITTEN. 21.04.2026.

      *timestamp: 54:18
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *rates
           01 rates.
      *        05 tax-rate    PIC V9(4) VALUE .075.
      *        05 tax-rate    PIC V9(4) VALUE .022.
               05 tax-rate    PIC V9(4) VALUE .22.
               05 VAT     PIC V9(4)  VALUE .25.
               05 VAT-conversion-rate PIC V9(15).
               05 TAX-conversion-rate PIC V9(15).
               05 markup PIC V9(4)  VALUE .40.
               05 profit-margin PIC V9(4)  VALUE .03.
      *    cost
           01 cost.
             05 prime-cost PIC 9(4)V9(2). *> innkjøpspris 
             05 COGS PIC 9(4)V9(2). *> direkte kostnader
             05 dir-cost PIC 9(4)V9(2). *> direkte kostnader
             05 indir-cost PIC 9(4)V9(2). *> indirekte kostnader / Driftskostnader
             05 tot-cost PIC 9(4)V9(2). *> totalkostnad / Selvkost

      *price stages
           01 price.
      *       05 ebit-price  PIC 9(4)V9(2). *>Operating Profit (EBIT) / before tax and VAT
      *       05 list-price PIC 9(4)V9(2). *> original price 
              05 op-price  PIC 9(4)V9(2). *>Operating Profit (EBIT) / BEFORE tax AND VAT
              05 net-price    PIC 9(4)V9(2). *> price after TAX, before VAT
              05 gross-price    PIC 9(4)V9(2). *> Final price after VAT
      *currency
           01 in-dollar    PIC $$,$$$,$$9.99.
      
       PROCEDURE DIVISION.
      *    other languages use floating point calculations. 
      *    -> can introduce errors: 0.00000000001
      *    Cobol uses something called; fixed-point-decimal-arithmatic
      *    allowing you to define how to round values.
      *    which is one of the reasons why it is so popular in fintech
           

           DISPLAY "Enter the Price: " WITH NO ADVANCING
           ACCEPT op-price
      *    using origianl rates
           COMPUTE net-price  ROUNDED = op-price*(1+tax-rate)
           DISPLAY "V1:"
      *    formatting price
           MOVE net-price to dollar

           DISPLAY "Net Price (price a. tax):" net-price.
           DISPLAY "Net Price (price a. tax):" in-dollar.
           DISPLAY SPACE
           
      *    using conversion rate.
           COMPUTE VAT-conversion-rate = 1-(VAT/(1+VAT))
           COMPUTE TAX-conversion-rate = 1-(tax-rate/(1+tax-rate))
           DISPLAY "V2:"
           DISPLAY "TAX-conversion-rate: " TAX-conversion-rate.
           COMPUTE net-price ROUNDED = op-price/TAX-conversion-rate
           


           DISPLAY "Net Price (price a. tax):" net-price.
           DISPLAY "Net Price (price a. tax):" in-dollar.
           DISPLAY SPACE
           


           
           
           STOP RUN.
       