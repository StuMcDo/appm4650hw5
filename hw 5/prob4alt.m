A = [2 -1 0 0; -1 2 -1 0; 0 -1 2 -1; 0 0 -1 2];
[V,D] = eig(A);
X= [];
X0 = [1;1;5;1];
X(:,1)=X0;
n = 8;

for i=1:n
    X(:,i+1)=A*X(:,i);
    %if abs(max(X(:,i+1))) > max(X(:,i+1))
    %X(:,i+1)=-1/abs(max(X(:,i+1))).*X(:,i+1);
    %else
     %   X(:,i+1)=1/max(X(:,i+1)).*X(:,i+1);
    %end
    
end

lambda = max(X(:,n))/max(X(:,n-1));
X1=[];
X0 = [1;1;1;1];
X1(:,1)=X0;
n = 8;

for i=1:n
    X1(:,i+1)=A*X1(:,i);
    %if abs(max(X(:,i+1))) > max(X(:,i+1))
    %X(:,i+1)=-1/abs(max(X(:,i+1))).*X(:,i+1);
    %else
     %   X(:,i+1)=1/max(X(:,i+1)).*X(:,i+1);
    %end
    
end

lambda1 = abs(max(X1(:,n)))/abs(max(X1(:,n-1)));