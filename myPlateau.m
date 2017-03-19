function y = myPlateau(t,restval,exerval)

if (0.25<t)&&(t<=0.75) || (2.25<t)&&(t<=2.75) || (4.25<t)&&(t<=4.75) || ...
   (6.25<t)&&(t<=6.75) || (8.25<t)&&(t<=8.75)
    y = exerval;
elseif (1.25<t)&&(t<=1.75) || (3.25<t)&&(t<=3.75) || (5.25<t)&&(t<=5.75) || ...
        (7.25<t)&&(t<=7.75) || (9.25<t)&&(t<=9.75)
    y = restval;
elseif (0.75<t)&&(t<=1.25) || (2.75<t)&&(t<=3.25) || (4.75<t)&&(t<=5.25) || ...
    (6.75<t)&&(t<=7.25) || (8.75<t)&&(t<=9.25)
    y = exerval - (exerval-restval)*mod(t-0.75,2)/0.5;
elseif (0<=t)&&(t<=0.25) || (1.75<t)&&(t<=2.25) || (3.75<t)&&(t<=4.25) || (5.75<t)&&(t<=6.25) || ...
    (7.75<t)&&(t<=8.25) || (9.75<t)&&(t<=10)
    y = restval + (exerval-restval)*mod(t-1.75,2)/0.5;
end