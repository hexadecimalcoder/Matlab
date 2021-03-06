N=input('Enter the no. of points: ');
W=exp((-1i*2*pi)/N);
K=2;
LHS_Sym=W^(N/2+K)
RHS_Sym=-W^K
if (abs(real(LHS_Sym)-real(RHS_Sym))<0.01 && abs(imag(LHS_Sym)-imag(RHS_Sym))<0.01)
    disp('LHS=RHS, Symmetry property proved');
end
LHS_Periodicity=W^(K+N)
RHS_Periodicity=W^K
if (abs(real(LHS_Periodicity)-real(RHS_Periodicity))<0.01 && abs(imag(LHS_Periodicity)-imag(RHS_Periodicity))<0.01)
    disp('LHS=RHS, Periodicity property proved');
end