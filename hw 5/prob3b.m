
A = [3 0 1;0 5 0; -1 1 -1]
X0 = [0.5 -0.1 0.4;0 0.2 0; -0.4 0.3 -1.5]

X1 = X0*(2.*eye(3)-A*X0)