% Code to recover example 8.2.2 of paper

centers_all = 1:10;
centers_left = 1:2:9;

x = 0.01:0.01:.5;
y = zeros(1, length(x));

for k = 1:length(x)
disp(k)
y(k) = lower_bound(centers_all, x(k), generate_random_poles(centers_all, x(k), 10)) / (2*lower_bound(centers_left, x(k), generate_random_poles(centers_left, x(k), 10)));
end

plot(x, y)