n=input('Enter signal length  :');
f=input('Enter frequency of sinusoid : ');
fprintf("Enter values for exponential sequence\n");
a1=input('Enter value of a(>1)            : ');
a2=input('Enter value of a(0<a<1)         : ');
a3=input('Enter value of a(<-1)           : ');
a4=input('Enter value of a(0>a>-1)        : ');
t=0:1:(n-1);
x1=[1,zeros(1,(n-1))];
subplot(2,4,1);
stem(t,x1);
xlabel('n');
ylabel('x(n)');
title('Unit Impulse')                               %UNIT IMPULSE
x2=[1,ones(1,(n-1))];
subplot(2,4,2);
stem(t,x2);
xlabel('n');
ylabel('x(n)');
title('Unit Step')                                  %UNIT STEP
x3=t;
subplot(2,4,3);
stem(t,x3);
xlabel('n');
ylabel('x(n)');
title('Unit Ramp')                                  %UNIT RAMP
t1=0:0.5:(n-1);
x4=sin(2*pi*f*t1);
subplot(2,4,4);
stem(t1,x4);
xlabel('n');
ylabel('x(n)');
title('Sinusoidal Sequence')                        %SINUSOIDAL SEQUNCE
x1=a1.^t;
subplot(2,4,5);
stem(t,x1);
xlabel('n'); 
ylabel('x(n)');
title('Exponential seqence with value of a(>1)')    %EXPONENTIAL SEQUENCE
x2=a2.^t;
subplot(2,4,6);
stem(t,x2);
xlabel('n'); 
ylabel('x(n)');
title('Exponential seqence with value of a(0<a<1)')
x3=a3.^t;
subplot(2,4,7);
stem(t,x3);
xlabel('n'); 
ylabel('x(n)');
title('Exponential seqence with value of a(<-1)')
x4=a4.^t;
subplot(2,4,8);
stem(t,x4);
xlabel('n');
ylabel('x(n)');
title('Exponential seqence with value of a(0>a>-1)')