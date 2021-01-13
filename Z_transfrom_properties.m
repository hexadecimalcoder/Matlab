clear all;
clc;
x1=[2 6 3 5 1];
x2=[1 2 3 4 5];
z1=ztseq(x1, -1);
z2=ztseq(x2, -1);
% Linearity property
y1=((2.*z1)+(3.*z2));
lhs=simplify(y1);
x=sigadd(2.*x1, -1, 3.*x2, -1);
y2=ztseq(x, -1);
rhs=simplify(y2);
if(lhs==rhs)
    disp("System is linear");
else
    disp("Systen is not linear");
end
% Time shifting property
syms z;
a=4;
y1=z1*z^(-a);
y1=simplify(y1);
% [y,n] = sigshift(x1, -1, 4);
y2=ztseq(x1,-1+a);
y2=simplify(y2);
if(y1==y2)
    disp("Obeying time shifting property");
else
    disp("Not obeying time shifting property");
end