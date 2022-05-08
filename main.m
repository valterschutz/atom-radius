% Calculates an optimal value for Xhat
% Works in units of fermi
clearvars, clc
e = 1.602176634e-19;

% From lecture 5, rho0 = 0.17 nukleons/fm^-3, a=1.2*A^1/3 fm, b=0.54 fm
% This is equivalent to rho0 = 0.085*e fm^-3 , a=4.1 fm, b=0.54 fm
x0 = [0.085*e,4.1,0.54];

[Xhat,fval,exitflag,output]  = fminsearch(@(X) fun_to_minimize(X),x0);
fprintf("rho_0=%.2e, a=%.2e, b=%.2e\n",Xhat(1), Xhat(2), Xhat(3))

%%
% Calculates the rms radius and plots charge density as a function of
% radius based on optimal value of Xhat
Z = 20;

N = 1000; r_max = maximum_radius(Xhat); dr = r_max/N;
integrand = @(r) r.^4.*rho(r,Xhat);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;
rms = 4*pi/(Z*e)*s;
fprintf("rms = %.2e\n", rms)

plot(R,rho(R,Xhat)/e,"r")
xlabel('r [fm]')
ylabel('\rho [e/fm^3]')

%%
% Plots theoretical cross section next to experimental cross section from
% data
theta = readvars("theta_data.txt");
cross_section_exp = readvars("sigma_data.txt");

plot(theta,cross_section_exp,"x")
set(gca, 'YScale', 'log')
hold on

theta=(30:1:130)';
% Multiply by 10 to convert between mbarn and fm^2
plot(theta,10*cross_section_theo(theta,Xhat),"r")
xlabel('\theta [deg]')
ylabel('d\sigma/d\Omega [mb/sr]')
legend('Experimentell data','Anpassat teoretiskt tvärsnitt')
