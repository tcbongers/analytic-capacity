% Plot the upper and lower bounds on the quotient gamma(E u F) / (gamma(E) + gamma(F))
% Report the maximum difference

% But now specify the range of min_radius to max_radius explicitly

function max_error = plot_capacity_quotient(centers_left, centers_right, min_radius, max_radius, num_rings, num_scales)

centers = [centers_left, centers_right];

ups_union = zeros(1, num_scales+1);
lows_union = zeros(1, num_scales+1);

ups_left = zeros(1, num_scales+1);
lows_left = zeros(1, num_scales+1);

ups_right = zeros(1, num_scales+1);
lows_right = zeros(1, num_scales+1);


for k = 1:num_scales+1
	k
	radius = min_radius + (max_radius - min_radius)*(k - 1) / num_scales;

	poles_union = generate_ring_poles(centers, radius, num_rings);
	poles_left = generate_ring_poles(centers_left, radius, num_rings);
	poles_right = generate_ring_poles(centers_right, radius, num_rings);

	ups_union(k) = upper_bound(centers, radius, poles_union);
	lows_union(k) = lower_bound(centers, radius, poles_union);

	ups_left(k) = upper_bound(centers_left, radius, poles_left);
	lows_left(k) = lower_bound(centers_left, radius, poles_left);

	ups_right(k) = upper_bound(centers_right, radius, poles_right);
	lows_right(k) = lower_bound(centers_right, radius, poles_right);
end

upper_bound_quotient = zeros(1, num_scales);
lower_bound_quotient = zeros(1, num_scales);
scales = zeros(1, num_scales);

for k = 1:num_scales
	scales(k) = max_radius * k / num_scales;
	upper_bound_quotient(k) = ups_union(k) / (lows_left(k) + lows_right(k));
	lower_bound_quotient(k) = lows_union(k) / (ups_left(k) + ups_right(k));
end

%scales = [0, scales];
%upper_bound_quotient = [1, upper_bound_quotient];
%lower_bound_quotient = [1, lower_bound_quotient];

plot(scales, upper_bound_quotient, scales, lower_bound_quotient)

max_error = max(upper_bound_quotient - lower_bound_quotient);

