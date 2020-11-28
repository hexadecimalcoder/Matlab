% PROGRAM FOR CALCULATING POWER OF INTEGER FROM 1 TO 10
% WRIITEN BY SOUHARDHYA PAUL
% UNIV ROLL: 10900318032

x=1:10;
for i = 1:10
    a(i)=x(i)^2;
    b(i)=x(i)^3;
    c(i)=x(i)^4;
end
fprintf("Integer from 1 to 10: ");
disp(x);
fprintf("Second power of 1 to 10: ");
disp(a);
fprintf("Third power of 1 to 10: ");
disp(b);
fprintf("Fourth power of 1 to 10: ");
disp(c);