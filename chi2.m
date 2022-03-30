function res = chi2(X)
%CHI2 Cost function given parameter X

% Experimental values for comparison
theta = readvars("theta_data.txt");
cross_section_exp = readvars("sigma_data.txt");
error = readvars("error_data.txt");

res = 0;
for k=1:length(theta)
    res = res + ((cross_section_theo(X)-cross_section_exp(k))/error(k))^2;
end
end

