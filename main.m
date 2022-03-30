clearvars, clf
Z = 20;
e = 1.602176634e-19;

theta = readvars("theta_data.txt");
sigma = readvars("sigma_data.txt");
error = readvars("error_data.txt");

prob = optimproblem("Description", "Match experimental data and theoretical calculation for charge radius");
rho_0 = optimvar("rho_0");
a = optimvar("a");
b = optimvar("b");
X = [rho_0,a,b];
prob.Objective = fun_to_minimize(X);

% Change this
initial_guess.rho_0 = 1;
initial_guess.a = 1;
initial_guess.b = 1;

[sol,optval] = solve(prob,initial_guess);
Xhat = [optval.rho_0, optval.a, optval.b];
fprintf("rho_0=%.2e, a=%.2e, b=%.2e\n",optval.rho_0, optval.a, optval.b)

N = 1000; r_max = maximum_radius(X); dr = r_max/N;
integrand = @(r) r^4*rho(r,Xhat);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;
rms = 4*pi/(Z*e)*s;
fprintf("rms = %.2e\n", rms)

