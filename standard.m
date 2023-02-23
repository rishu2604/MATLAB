ineq=[1 0 0]
A=[4 2 0; 4 0 7;-2 -2 -3]
B=[2; 7; 3]
C=[2 3 0 0 0 0]
s= eye(size(A,1))
index=find(ineq>0)
s(index,:)=-s(index,:)
A=[A s]
n=size(A,2)
m=size(A,1)
if n>m
sols=nchoosek(n,m)
pair=nchoosek(1:n,m)
solution=[]
for i = 1:sols
    y=zeros(n,1)
    a1=A(:,pair(i,:))
    x=inv(a1)*B
if all(x>=0 & x~=inf)
    y(pair(i,:))=x
    solution=[solution, y]
end
 
end
%dims(solution)
z=C*solution
optval=[solution.' z.']
array2table(optval,'VariableNames',{'x1','x2','x3','s1','s2','s3','z'})
 
else
error('number of variables not greater than constraints')
end
