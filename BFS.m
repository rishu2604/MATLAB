clc;
clear all;
A=[2 3 -1 4;1 2 6 -7];
C=[2 3 4 7];
B=[8 ;-3];
n=size(A,2);
m=size(A,1);

if n>m
    nCm= nchoosek(n,m);
    p = nchoosek(1:n,m);
    sol=[];
    for i=1:nCm
        y=zeros(n,1);
        A1=A(:,p(i,:));
        X=inv(A1)*B;
        if all(X>=0 & X~=inf & X~=-inf)
            y(p(i,:)) = X;
            sol = [sol y]
        end
    end

    
end

z=C*sol;
[obj index]=max(z)
bfs=sol(:,index)
optval=[bfs' obj]
array2table(optval,'VariableNames',{'x1','x2','x3','x4','z'})


display(nCm)
display(A1)..
display(optval);
