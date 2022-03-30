function res = cross_section_theo(E,theta,X)
% E and theta are scalars, X is a vector
Zp = 1; Zt = 20;

v = ?;
c = 299792458; hbar = 1.054571817e-34;
beta = v/c;
p = ?;  % Relativistiskt?
q2 = 4*p^2*sin(theta/2)^2;
mott = Zp^2*Zt^2*alpha^2*c^2*(1-beta^2*sin(theta/2)^2)/(4*beta^4*E^2*sin(theta/2)^4);
res = mott*abs(F(q2,X))^2;
end

