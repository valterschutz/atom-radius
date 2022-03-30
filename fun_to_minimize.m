function res = fun_to_minimize(X)
%FUN_TO_MINIMIZE chi2 but with constraint
e = 1.602176634e-19;
Zt = 20; eps = 1e-6;

% Choose r_max depending on X
N = 1000; r_max = maximum_radius(X); dr = r_max/N;
integrand = @(r) r^2*rho(r,X);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;

res = chi2(X) + ((Zt - 4*pi/e*s)/eps)^2;
end

