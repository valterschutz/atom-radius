function res = F(q2,X)
%F Form factor. q2 is a vector (p-p')^2, X is a vector containing rho_0, a and
%b.
%works in units of femtometers -> hbar is multiplied by 10^30
hbar = 1.054571817e-34*10^30; e = 1.602176634e-19;
Z = 20; q = sqrt(q2);

% Choose r_max depending on X
N = 1000; r_max = maximum_radius(X); dr = r_max/N;

integrand = @(r) r.*rho(r,X).*sin(q.*r/hbar);
R = 0:dr:r_max;
s = sum((integrand(R)')*dr)';
res = 4*pi*hbar./(Z*e*q).*s;
end

