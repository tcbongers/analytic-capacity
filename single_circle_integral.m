% This program computes the integral of 
% (2pi)^(-1) (z - a_1)^(-1) 
% with respect to arclength over the circle centered at z_0 with radius r.
% The computation was done with the residue theorem.

% center = complex number
% r = positive real
% pole1 = complex number

function value = single_circle_integral(center, r, pole1)
% Start by testing where the poles lie
value = 0;

if abs(pole1 - center) > r
    value = r / (center - pole1);    
end

end
