% Program to check distributive property
% x(n): [ 1 2 3 4 5 6 7 8 9 10], starting position: -2
% y(n): [ 10 9 8 7 6 5 4 3 2 1], starting position: 5
% z(n): [ 8 4 8 4 8 4 8 4], starting position: 1
% a*(b+c) = a*b + a*c
xn=input('enter sequence of x(n) :');
xs=input('enter starting point of x(n) :');
xe=(xs + length(xn)-1);
yn=input('enter sequence of y(n) :');
ys=input('enter starting point of y(n) :');
ye=(ys + length(yn)-1);
zn=input('enter sequence of z(n) :');
zs=input('enter starting point of z(n) :');
ze=(zs + length(zn)-1);
s=min(xs, ys);
s=min(s, zs);
e=max(xe, ye);
e=max(e, ze);
xn=[zeros(1,xs-s),xn,zeros(1,e-xe)]
yn=[zeros(1,ys-s),yn,zeros(1,e-ye)]
zn=[zeros(1,zs-s),zn,zeros(1,e-ze)]
t=(s:e);
subplot(5,1,1);
stem(t,xn);
title('X(n): Signal 1');
xlabel('n');
ylabel('x(n)');
subplot(5,1,2);
stem(t,yn);
title('Y(n): Signal 2');
xlabel('n');
ylabel('y(n)');
subplot(5,1,3);
stem(t,zn);
title('Z(n): Signal 3');
xlabel('n');
ylabel('z(n)');
an=(conv(xn,yn+zn))
bn=(conv(xn, yn))+(conv(xn, zn))
as=(s+s);
ae=(e+e);
na=(as:ae);
subplot(5,1,4);
stem(na,an);
title('A(n): Signal 4: X*(Y+Z)');
xlabel('n');
ylabel('a(n)');
subplot(5,1,5);
stem(na,bn);
title('B(n): Signal 5: (X*Y)+(X*Z)');
xlabel('n');
ylabel('b(n)');
if (an==bn)
    fprintf("same");
else
    fprintf("not same");
end