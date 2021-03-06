function[y,n] = sigfold(x, nb)
y=fliplr(x);
n=-flip(nb:nb+length(x)-1);
end