function res = maximum_radius(X)
%MAXIMUM_RADIUS Calculates an upper limit for integrals with rho as an
%integrand, given X parameters

% Should not depend on rho_0, only a & b. We want (r-a)/b >> 1.
a = X(2); b = X(3);

res = 100*b+a;  % Seems ok, check with Desmos
end

