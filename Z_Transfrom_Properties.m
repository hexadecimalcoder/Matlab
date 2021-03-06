clc;
x1=[2 6 3 5 1]
x2=[1 2 3 4 5]
x1s=-1
x2s=-1
z1=ztseq(x1, x1s)
z2=ztseq(x2, x2s)
% Linearity property
y1=((2.*z1)+(3.*z2));
lhs=simplify(y1);
x=sigadd(2.*x1, x1s, 3.*x2, x2s);
y2=ztseq(x, -1);
rhs=simplify(y2);
if(lhs==rhs)
    disp("System is linear");
else
    disp("Systen is not linear");
end
% Time shifting property
% x(n-a)=X(z)Z^-a
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
% Time reversal property
% x(n)==X(z) then x(-n)==X(z^-1)
n=-2:-2+length(x1)-1;
[y1,n1]=sigfold(x1,n(1));
lhs=ztseq(y1,n1(1));
lhs=simplify(lhs);
rhs=sum(x1.*z.^n); %Inverse z transform
rhs=simplify(rhs);
if(lhs==rhs)
    disp("Obeying the time reversal property");
else
    disp("Not obeying time reversal preperty");
end
% Differentiation property
% n.x(n)=-Z.(dX(z)/dz)
x1s=-2;
Xz=ztseq(x1, x1s);
yn=n.*x1;
Yz=simplify(ztseq(yn,x1s));
dXz=diff(Xz);
YdXz=simplify((-z).*dXz);
if(Yz==YdXz)
    disp("Obeying the differentiation property");
else
    disp("Not obeying the differentiation property");
end

% Convolution property
% x1(n)*x2(n)=X1(z).X2(z)
x1s=-1;
x2s=-1;
% x1e=(x1s + length(x1)-1);
% x2e=(x2s + length(x2)-1);
% ys=(x1s+x2s);
% ye=(x1e+x2e);
% ny=(ys:ye);
% y1=conv(x1,x2);
[y1,ny]=sigconv(x1, x1s, x2, x2s);
Yz=ztseq(y1, ny(1));
lhs=simplify(Yz);
X1=ztseq(x1, x1s);
X2=ztseq(x2, x2s);
rhs=simplify(X1.*X2);
if(lhs==rhs)
    disp("Obeying the convolution property");
else
    disp("Not obeying the convolution property");
end