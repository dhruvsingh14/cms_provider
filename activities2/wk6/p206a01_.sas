***********************************************************;
*  Activity 6.01                                          *;
*  1) In the DATA step, add the following sum statement   *;
*     after the Savings sum statement to add 2% interest  *;
*     compounded monthly:                                 *;
*        Savings+(Savings*0.02/12);                       *;
*  2) Run the program. How much is in savings at month 12?*;
*  3) Delete the OUTPUT statement and run the program     *;
*     again.                                              *;
*  4) How many rows are created?                          *;
*  5) What is the value of Month?                         *;
*  6) What is the value of Savings?                       *;
***********************************************************;

libname pg2 'C:\Users\dsingh\Dropbox\Misc\Coursera\pg294_ue\EPG294\data';

data YearlySavings;
   Amount=200;
   do Month=1 to 12;
      Savings+Amount;
	  Savings+(Savings*0.02/12);
	  *output;
   end;
   format Savings 12.2;
run;
