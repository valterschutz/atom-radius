clearvars, clc
Z = 20;
e = 1.602176634e-19;

% Radius is ~ 1 fm. This implies... 
x0 = [0.1*e*10^45,4e-15,6e-16];

options = optimoptions("fminunc","MaxIterations",1000,"StepTolerance",1e-20,"OptimalityTolerance",1e-20);
Xhat = fminunc(@(X) fun_to_minimize(X),x0,options);

fprintf("rho_0=%.2e, a=%.2e, b=%.2e\n",Xhat(1), Xhat(2), Xhat(3))

N = 1000; r_max = maximum_radius(Xhat); dr = r_max/N;
integrand = @(r) r.^4.*rho(r,Xhat);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;
rms = 4*pi/(Z*e)*s;
fprintf("rms = %.2e\n", rms)

