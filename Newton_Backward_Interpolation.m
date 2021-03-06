% PROGRAM FOR NEWTON'S BACKWARD INTERPOLATION
% WRIITEN BY SOUHARDHYA PAUL
% UNIV ROLL: 10900318032

x=[0 3 6 9 12 15];
y=[1 2 7 12 17 22];
n=length(x);
z=zeros(n,n);
z(:,1)=y;
fprintf("X: ");
disp(x);
fprintf("Y: ");
disp(y);
x=transpose(x);
y=transpose(y);
for i = 2:n
    for j = i:n
        z(j,i)=z(j,i-1)-z(j-1,i-1);
    end
end
fprintf("     x     y");
for i = 1:n-1
    fprintf("   %s^%d",char(8711), i);
end
fprintf("\n");
disp([x z]);
h=x(2)-x(1);
%disp(h);
fx = input('Enter value of x: ');
s=(fx-x(n))/h;
ans=y(n);
for i = 2:n
    temp=1;
    for j = 0:i-2
        temp = temp*(s+j);
    end
    fact=1;
    for j = 1:i-1
        fact = fact*j;
    end
    ans = ans + (temp/fact)*z(n,i);
end
fprintf("The result is:   %.4f  ", ans); 
fprintf("\n");