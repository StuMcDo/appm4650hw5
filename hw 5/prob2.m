A = [4 3 0; 3 4 -1; 0 -1 4];
b = [24;30;-24];
M = [A b];
Mr = rref(M);
Xsol = Mr(:,4);
omega = linspace(1.21,1.4,20);


E = zeros(1,3);
I = zeros(1,20);
for j = 1:20
    error = 1;
    Xguess = [b(1,1)/A(1,1) b(2,1)/A(2,2) b(3,1)/A(3,3)];
    while error > 1e-6
        
        for i = 1:3
            Usum = 0;
            if i > 1
                for k = 1:i-1
                
                    Usum = Usum + A(i,k).*Xguess(1,k);
                
                end
            end 
            Lsum = 0;
           if i < 3
            for l = i+1:3
                
                Lsum = Lsum + A(i,l).*Xguess(1,l); 
            end
            
           end
            Xguess(1,i) = (1-omega(1,j)).*Xguess(1,i)+omega(1,j)/A(i,i).*...
                (b(i,1)- Usum - Lsum);       
            
            
        end
        I(1,j) = I(1,j) + 1;
        E(1,1) = abs(Xsol(1,1)-Xguess(1,1));
        E(1,2) = abs(Xsol(2,1)-Xguess(1,2));
        E(1,3) = abs(Xsol(3,1)-Xguess(1,3));
     
        error = max(E);
    
    end
               
    
    
end

stem(omega, I) 
title('$1.19 \leq \omega \leq 1.40$','Interpreter','latex')
xlabel('$\omega $','Interpreter','latex')
ylabel('$Iterations$','Interpreter','latex')