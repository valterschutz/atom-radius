clearvars, clc
Z = 20;
e = 1.602176634e-19;

% From lecture 5, rho0 = 0.17nukleoner/fm^-3, a=1.2*A^1/3 fm, b=0.54 fm
% This is equivalent to rho0 = 0.085*e fm^-3 , a=4.1 fm, b=0.54
%x0 = [0.1*e,4,0.6];
%x0 = [0.1*e,2,0.8];
a = linspace(2.05,8.2,8);
b = linspace(0.27,1.08,8);
rho_0 = linspace(0.0425*e,0.17*e,8);

%Used to generate optimdata.mat
x = zeros(3,512);
guesses = zeros(3,512);
functionvalue = zeros(1,512);
counter = 1;
for i = 1:8
    for j=1:8
        for k=1:8
            x0 = [rho_0(i),a(j),b(k)];
            options = optimset('PlotFcns',@optimplotfval,'MaxIter',80);
            [Xhat,fval,exitflag,output]  = fminsearch(@(X) fun_to_minimize(X),x0, options);
            x(:,counter) = Xhat';
            guesses(:,counter) = x0';
            functionvalue(counter) = fval;
            counter = counter + 1;
        end
    end
end
save('optimdata1.mat','x','guesses','functionvalue')

%%
Xhat = x(:,15)'

fprintf("rho_0=%.2e, a=%.2e, b=%.2e\n",Xhat(1), Xhat(2), Xhat(3))

N = 100000; r_max = maximum_radius(Xhat); dr = r_max/N;
integrand = @(r) r.^4.*rho(r,Xhat);
R = 0:dr:r_max;
s = sum(integrand(R))*dr;
rms = 4*pi/(Z*e)*s;
fprintf("rms = %.2e\n", rms)

%plot(R,rho(R,x0),"b")
%hold on
%plot(R,rho(R,Xhat),"r")