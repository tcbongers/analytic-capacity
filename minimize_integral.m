% This program uses the centers and the poles to generate the
% matrix A and vector b and value c that come up in our problem
% and then compute the minimum value of the integral.

function minimum_value = minimize_integral(centers, radius, poles)
% Specify number of disks
num_disks = length(centers);

% Specify centers and common radius
%centers = [2, -2];
%radius = .1;

% Specify the poles of the testing functions
% poles = [2, -2];
num_poles = length(poles);

% Set up the outputs
A = zeros(2*num_poles);
b = zeros(1, 2*num_poles);

for k = 1:num_poles
    for l = 1:num_poles
        bdry_integral = 0;
        for c = 1:num_disks
            % Vectorize this later!
            bdry_integral = bdry_integral + paired_circle_integral(centers(c), radius, poles(k), poles(l));
        end
        A(k, l) = real(bdry_integral);
        A(k + num_poles, l + num_poles) = real(bdry_integral);
        
        % Check this part later
        A(k + num_poles, l) = imag(bdry_integral);
        A(k, l + num_poles) = -imag(bdry_integral);
    end
end

% Rescaling to fit into the 1/2 x^T A x situation
A = 2*A;

for k = 1:num_poles
    bdry_integral = 0;
    for c = 1:num_disks
        bdry_integral = bdry_integral + single_circle_integral(centers(c), radius, poles(k));
    end
    
    b(k) = 2*real(bdry_integral);
    b(k + num_poles) = 2*imag(bdry_integral);
end

c = num_disks*radius;

x = (-b/A)';
minimum_value = 0.5 * (x')*(A*x) + b*x + c;

end