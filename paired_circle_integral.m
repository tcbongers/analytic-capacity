% This program computes the integral of 
% (2pi)^(-1) (z - a_1)^(-1) (z^* - a_2^*)^(-1)
% with respect to arclength over the circle centered at z_0 with radius r.
% The computation was done with the residue theorem.

% center = complex number
% r = positive real
% pole1 = complex number
% pole2 = complex number

function value = paired_circle_integral(center, r, pole1, pole2)
% Start by testing where the poles lie
value = 0;

if abs(pole1 - center) < r && abs(pole2 - center) < r
    value = r / (r*r - (pole1 - center)*(pole2 - center)');    
end

if abs(pole1 - center) > r && abs(pole2 - center) > r
    value = r / ((pole1 - center)*(pole2 - center)' - r*r);    
%    value = r / ((pole1 - center)*(pole2 - center)');    
%    value = r / (abs(pole1 - center)*abs(pole2 - center));
end

end
