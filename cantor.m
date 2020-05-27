format long

centers = [1/8 + i/8, 1/8 + 7*i/8, 7/8 + i/8, 7/8 + 7*i/8];
radius = 1/8;

centers2 = [centers/4, centers/4 + 3/4, centers/4 + 3*i/4, centers/4 + 3/4 + 3*i/4];
radius2 = radius/4;

centers3 = [centers2/4, centers2/4 + 3/4, centers2/4 + 3*i/4, centers2/4 + 3/4 + 3*i/4];
radius3 = radius2/4;

centers4 = [centers3/4, centers3/4 + 3/4, centers3/4 + 3*i/4, centers3/4 + 3/4 + 3*i/4];
radius4 = radius3/4;

tic

disp('Generation 0')
analytic_capacity([1/2 + i/2], 1/2, generate_ring_poles([1/2 + i/2], 1/2, 0), 1)
%toc

disp('Generation 1')
analytic_capacity(centers, radius, generate_ring_poles(centers, radius, 0), 1)
%toc

disp('Generation 2')
analytic_capacity(centers2, radius2, generate_ring_poles(centers2, radius2, 0), 1)
%toc

%disp('Generation 3')
%analytic_capacity(centers3, radius3, generate_ring_poles(centers3, radius3, 0), 1)
%toc

%disp('Generation 4')
%analytic_capacity(centers4, radius4, generate_ring_poles(centers4, radius4, 0), 1)
%toc