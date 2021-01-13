function [zT] = ztseq(x, nb)
n=nb:nb+length(x)-1;
syms z;
zT=sum(x./z.^n);
end