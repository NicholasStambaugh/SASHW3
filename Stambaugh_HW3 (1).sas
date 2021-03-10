/* Nicholas Stambaugh, STA 216 04 */
/* Homework #3 */

/*Item #1 */
PROC IMPORT 
DATAFILE='/home/u56440190/STA 216/happyface.csv'
DBMS=CSV REPLACE OUT=HAPPYFACE;
GETNAMES=YES;
RUN;

/*Item #2 */
PROC MEANS data=happyface n min max mean std skewness kurtosis maxdec=3;
var Tip;
class Face;
title "Summary Statistics: Tips by Face";
title2 "Nicholas Stambaugh";
RUN;


PROC SGPLOT data=happyface;
vbox Tip /group=face;
title "Comparison Boxplot: Tip per Face";
title2 "Nicholas Stambaugh";
RUN;

PROC SGPLOT data=happyface;
vbox Tip /group=gender;
title "Comparison Boxplot: Tip per Gender";
title2 "Nicholas Stambaugh";
RUN;

/*Item #3 */
ods graphics on;
PROC GLM data=happyface plots=diagnostics;
class Face Gender;
model Tip = Face Gender Face*Gender ;
lsmeans Face*Gender / cl adjust=BON;
title 'ANOVA Model: Tips = Face + Gender + FaceGender';
RUN; QUIT;

