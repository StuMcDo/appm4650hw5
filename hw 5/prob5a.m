A = [2 -1 1; -1 3 2; 1 2 3 ];
[V,D] =eig(A);
X0 = [1; 1; 1];
X = [];
X(:,1) = X0;
n = 14;
for i=1:n
    X(:,i+1)=A*X(:,i);
    %if abs(max(X(:,i+1))) > max(X(:,i+1))
    %X(:,i+1)=-1/abs(max(X(:,i+1))).*X(:,i+1);
    %else
     %   X(:,i+1)=1/max(X(:,i+1)).*X(:,i+1);
    %end
    
end
a = max(X(:,n));
b = max(X(:,n-1));
lambdaC = a/b;
lambda = dot(X(:,n),X(:,n-1))/dot(X(:,n-1),X(:,n-1));