



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
%disp(s);
ans=y(n);
for i = 2:n
    temp=1;
    %fprintf("i=%d, ",i);
    for j = 0:i-2
        %fprintf("%d ",j);
        temp = temp*(s+j);
    end
    fact=1;
    for j = 1:i-1
        fact = fact*j;
    end
    %fprintf("     %d", fact);
    %fprintf("\n");
    ans = ans + (temp/fact)*z(n,i);
end
fprintf("The result is:   %.4f  ", ans); 
fprintf("\n");