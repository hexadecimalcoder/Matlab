function [zT] = sigadd(x1, n1b, x2, n2b)
l1=length(x1);
l2=length(x2);
n1e=n1b+l1-1;
n2e=n2b+l2-1;
y1=x1;
y2=x2;
n=min(n1b, n2b):max(n1e, n2e);
if(n1b<n2b)
    y2=[zeros(1, n2b-n1b) y2];
else
    y1=[zeros(1, n1b-n2b) y1];
end
if(n1e<n2e)
    y1=[y1 zeros(1, n2e-n1e)];
else
    y2=[y2 zeros(1, n1e-n2e)];
end
y1;
y2;
zT = y1+y2;
end