% Program to check associative property
% x(n): [ 1 2 3 4 5 6 7 8 9 10], starting position: -2
% y(n): [ 10 9 8 7 6 5 4 3 2 1], starting position: 5
% z(n): [ 2 6 8 10], starting position: 1
% a*(b*c) = (a*b)*c
xn=input('enter sequence of x(n) :');
xs=input('enter starting point of x(n) :');
xe=(xs + length(xn)-1);
nx=(xs:xe);
subplot(5,1,1);
stem(nx,xn);
title('X(n): Signal 1');
xlabel('n');
ylabel('x(n)');
yn=input('enter sequence of y(n) :');
ys=input('enter starting point of y(n) :');
ye=(ys + length(yn)-1);
ny=(ys:ye);
subplot(5,1,2);
stem(ny,yn);
title('Y(n): Signal 2');
xlabel('n');
ylabel('y(n)');
zn=input('enter sequence of z(n) :');
zs=input('enter starting point of z(n) :');
ze=(zs + length(zn)-1);
nz=(zs:ze);
subplot(5,1,3);
stem(nz,zn);
title('Z(n): Signal 3');
xlabel('n');
ylabel('z(n)');
an=(conv(xn,conv(yn, zn)));
as=(xs+ys+zs);
ae=(xe+ye+ze);
na=(as:ae);
subplot(5,1,4);
stem(na,an);
title('A(n): Convolution Output x*(y*z)');
xlabel('n');
ylabel('a(n)=x(n)*h(n)');
bn=(conv(conv(xn, yn),zn));
bs=(xs+ys+zs);
be=(xe+ye+ze);
nb=(as:ae);
subplot(5,1,5);
stem(nb,bn);
title('B(n): Convolution Output (x*y)*z');
xlabel('n');
ylabel('a(n)=x(n)*h(n)');
if(an == bn)
   fprintf("same");
else
   fprintf("not same");
end