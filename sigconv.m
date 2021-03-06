function[y,n]= sigconv(x1, n1b, x2, n2b)
y=conv(x1, x2);
n= (n1b+n2b):(n1b+n2b+length(x1)+length(x2)-2);
end