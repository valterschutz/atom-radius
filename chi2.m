function res = chi2(X)
%CHI2 Cost function given parameter X

% Experimental values for comparison
theta = readvars("theta_data.txt");
cross_section_exp = readvars("sigma_data.txt");
cross_section_exp = cross_section_exp * 10^(-31);
error = readvars("error_data.txt");
error = error * 10^(-31);

res = 0;
for k=1:length(theta)
    res = res + ((cross_section_theo(theta(k),X)*10-cross_section_exp(k))/(error(k)))^2;
end
end

