clearvars, clc
Z = 20;
e = 1.602176634e-19;

theta = readvars("theta_data.txt");
sigma = readvars("sigma_data.txt");
error = readvars("error_data.txt");

% Radius is ~ 1 fm. This implies... 
x0 = [0.1*e,4,0.6];
options = optimset('PlotFcns',@optimplotfval);
[Xhat,fval,exitflag,output]  = fminsearch(@(X) fun_to_minimize(X),x0, options);
%output
fprintf("rho_0=%.2e, a=%.2e, b=%.2e\n",Xhat(1), Xhat(2), Xhat(3))

N = 100000; r_max = maximum_radius(Xhat); dr = r_max/N;
integrand = @(r) r.^4.*rho(r,Xhat);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;
rms = 4*pi/(Z*e)*s;
fprintf("rms = %.2e\n", rms)

