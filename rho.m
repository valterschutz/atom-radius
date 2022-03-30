function res = rho(r,X)
%RHO r is a scalar, X is a vector containing rho_0, a and b
rho_0 = X(1); a = X(2); b = X(3);
res = rho_0/(1+exp((r-a)/b));
end

