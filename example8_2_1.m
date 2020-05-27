% Code to recover example 8.2.1 of paper

centers_all = [1, 3, 5, 7, 2+1i, 4+1i, 6+1i, 8+1i, 1+2i, 3+2i, 5+2i, 7+2i, 2+3i, 4+3i, 6+3i, 8+3i, 1+4i, 3+4i, 5+4i, 7+4i,2, 4, 6, 8, 1+1i, 3+1i, 5+1i, 7+1i, 2+2i, 4+2i, 6+2i, 8+2i, 1+3i, 3+3i, 5+3i, 7+3i, 2+4i, 4+4i, 6+4i, 8+4i];
centers_E = [1, 3, 5, 7, 2+1i, 4+1i, 6+1i, 8+1i, 1+2i, 3+2i, 5+2i, 7+2i, 2+3i, 4+3i, 6+3i, 8+3i, 1+4i, 3+4i, 5+4i, 7+4i];
centers_F = [2, 4, 6, 8, 1+1i, 3+1i, 5+1i, 7+1i, 2+2i, 4+2i, 6+2i, 8+2i, 1+3i, 3+3i, 5+3i, 7+3i, 2+4i, 4+4i, 6+4i, 8+4i];

x = 0.01:0.01:.5;
y = zeros(1, length(x));
z = zeros(1, length(x));

tic
for k = 1:length(x)
disp(k)
y(k) = lower_bound(centers_all, x(k), centers_all) / (2*lower_bound(centers_E, x(k), centers_E));
z(k) = upper_bound(centers_all, x(k), centers_all) / (2*upper_bound(centers_E, x(k), centers_E));
toc
end

plot(x, y, x, z, x, (y + z)/2)