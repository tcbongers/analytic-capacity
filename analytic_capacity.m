% Compute the upper and lower bounds
% Report the error between them

function cap = analytic_capacity(centers, radius, poles, t)
if nargin < 3
    poles = centers;
end

up = upper_bound(centers, radius, poles);
low = lower_bound(centers, radius, poles);

cap = [low, up];

if nargin == 4
    disp(['Lower bound = ', num2str(low, 16)])
    disp(['Upper bound = ', num2str(up, 16)])
    disp(['Error bound = ', num2str(up - low, 16)])
end