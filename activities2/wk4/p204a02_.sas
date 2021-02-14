***********************************************************;
*  Activity 4.02                                          *;
*  1) In the PROC FORMAT step, modify the second VALUE    *;
*     statement to create a format named HRANGE that has  *;
*     the following criteria:                             *;
*     * A range of 50 - 57 has a formatted value of       *;
*       Below Average.                                    *;
*     * A range of 58 - 60 has a formatted value of       *;
*       Average.                                          *;
*     * A range of 61 - 70 has a formatted value of       *;
*       Above Average.                                    *;
*  2) In the PROC PRINT step, modify the FORMAT statement *;
*     to format Height with the HRANGE format.            *;
*  3) Run the program and verify the formatted values in  *;
*     the PRINT output.                                   *;
*  4) Why is the Height value for the first row not       *;
*     formatted?                                          *;
***********************************************************;

libname pg2 'C:\Users\dsingh\Dropbox\Misc\Coursera\pg294_ue\EPG294\data';

proc format;
    value $genfmt 'F'='Female'
                  'M'='Male';
    *modify the following VALUE statement;
    value Hrange 50-57 = 'Below Average'
                 58-60 = 'Average'
                 61-70 = 'Above Average';
run;

proc print data=pg2.class_birthdate noobs;
    where Age=12;
    var Name Gender Height;
    *add to the following FORMAT statement;
    format Gender $genfmt. Height Hrange.;
run;
