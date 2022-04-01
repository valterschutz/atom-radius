function res = cross_section_theo(theta,X)
% E and theta are scalars, X is a vector
Zp = 1; Zt = 20;
m_e = 9.109381881e-31;
c = 299792458; e = 1.602176634e-19; alpha = 0.0072973525693; hbar = 1.054571817e-34;
E = 250*1e6*e;  % Energy of incoming electrons

% p = E/c;  % Unsure about this... Relativistic?
p = sqrt(E^2-m_e^2*c^4)/c;
% v = p/m_e;
v = p/sqrt(m_e^2+p^2/c^2);
q2 = 4*p^2*sind(theta/2)^2;

beta = v/c;

mott = Zp^2*Zt^2*alpha^2*c^2*(1-beta^2*sin(theta/2)^2)/(4*beta^4*E^2*sin(theta/2)^4);
res = mott*abs(F(q2,X))^2;
end

