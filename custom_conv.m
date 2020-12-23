function ans = custom_conv(x,h)
    rows = @(x) size(x,1); 
    cols = @(x) size(x,2);
    h=transpose(h);
    resultMatrix = x.*h;
    resultMatrix = [resultMatrix, zeros(rows(resultMatrix), rows(resultMatrix)-1)];
    resultMatrix = [resultMatrix; zeros(length(x)-1, cols(resultMatrix))];
    for index=[1: cols(resultMatrix)]
        value=0;
        for i=[1:index]
%             disp(i);
%             fprintf('%d %d %d\n',index-i,i, resultMatrix(index-i+1, i));
            value = value + resultMatrix(index-i+1,i);
        end
        ans(index)=value;
    end
end
