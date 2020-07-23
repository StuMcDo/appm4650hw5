A = [2 -1 0 0; -1 2 -1 0; 0 -1 2 -1; 0 0 -1 2];
[V,D] = eig(A);
X= [];
X0 = [1;1;5;1];
X(:,1)= X0/5;
%max(abs(X(:,1))) this is screwey have to think 
%about how to handle negatives
n = 1000000;
mu = zeros(n,1);
Y = zeros(4,n);

%lambda(:,1)=[0;0;0;0];

%yp(1,1) = 1;
for i =1:n
    Y(:,i) = A*X(:,i);
   
    
       if max(Y(:,i)) < max(abs(Y(:,i)))
             mu(i,1)  = -max(abs(Y(:,i)));
       else 
             mu(i,1) = max(Y(:,i));
       end
       X(:,i+1) =Y(:,i)./mu(i,1);
    
      % lambda(:,i) = X(:,i+1)./X(:,i);
 
end
     
        
    