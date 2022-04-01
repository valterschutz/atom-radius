clearvars, clc
Z = 20;
e = 1.602176634e-19;

N = 20;
a = linspace(0e-15,20e-15,N);
b = linspace(0e-16,20e-16,N);
[A,B] = meshgrid(a,b);
rho = 0.1*e*10^45 * ones(size(A));

f = @(rho,a,b) fun_to_minimize([rho a b]);

Y = zeros(size(A));

for k=1:size(A,1)
    for j=1:size(A,2)
        Y(k,j) = f(rho(k,j),A(k,j),B(k,j));
        fprintf("k=%d, j=%d\n",k,j)
    end
end
surf(A,B,Y);
xlabel("a"), ylabel("b")

