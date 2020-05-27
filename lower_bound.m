% This program uses the centers and the poles to generate the
% matrix A and vector b and value c that come up in our problem
% and then compute the minimum value of the integral.

function maximum_integral = lower_bound(centers, radius, poles)

% Specify number of disks and poles
if nargin < 3
    poles = centers;
end

num_disks = length(centers);
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

%for k = 1:num_poles
%    bdry_integral = 0;
%    for c = 1:num_disks
%        bdry_integral = bdry_integral + single_circle_integral(centers(c), radius, poles(k));
%    end
    
%    b(k) = 2*real(bdry_integral);
%    b(k + num_poles) = 2*imag(bdry_integral);
%end

%c = num_disks*radius;

% New code: the vector b is much simpler in this case.

for c = 1:num_poles
    b(c) = -2;
end

x = (-b/A)';
maximum_integral = -(0.5 * (x')*(A*x) + b*x);

end