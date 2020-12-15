xn=input('enter sequence of x(n) :');
xs=input('enter starting point of x(n) :');
xe=(xs + length(xn)-1);
nx=(xs:xe);
subplot(4,1,1);
stem(nx,xn);
title('X(n): Signal 1');
xlabel('n');
ylabel('x(n)');
hn=input('enter sequence of h(n) :');
hs=input('enter starting point of h(n) :');
he=(hs + length(hn)-1);
nh=(hs:he);
subplot(4,1,2);
stem(nh,hn);
title('H(n): Signal 2');
xlabel('n');
ylabel('h(n)');
yn=(conv(xn,hn))
ys=(xs+hs);
ye=(xe+he);
ny=(ys:ye);
subplot(4,1,3);
stem(ny,yn);
title('Y(n): Convolution Output');
xlabel('n');
ylabel('y(n)=x(n)*h(n)');
y2n=(conv(hn,xn))
y2s=(xs+hs);
y2e=(xe+he);
n2y=(ys:ye);
subplot(4,1,4);
stem(n2y,y2n);
title('Y2(n): Convolution Output');
xlabel('n');
ylabel('y(n)=h(n)*x(n)');
if(yn == y2n)
   fprintf("same");
else
   fprintf("not same");
end