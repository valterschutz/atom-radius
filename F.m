function res = F(q2,X)
%F Form factor. q2 is a vector p-p', X is a vector containing rho_0, a and
%b.
hbar = 1.054571817e-34;
Z = 20; q = sqrt(norm(q2));

% Choose r_max depending on X
N = 1000; r_max = maximum_radius(X); dr = r_max/N;
integrand = @(r) r*rho(r,X)*sin(q*r/hbar);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;

res = 4*pi/(Z*e*q)*s;
end

