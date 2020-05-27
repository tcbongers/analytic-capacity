function [cap_estimate, coords] = random_non_dual_three();
 
a1 = 1;
b1 = 1;

scale = 3;

%a2 = (2*(rand - 1) + 2*(rand - 1)*i) / scale;
%a3 = (2*(rand - 1) + 2*(rand - 1)*i) / scale^2;
%a4 = (2*(rand - 1) + 2*(rand - 1)*i) / scale^3;
%a5 = (2*(rand - 1) + 2*(rand - 1)*i) / scale^4;

a2 = .05*(2*(rand - 1) + 2*(rand - 1)*i);
a3 = .05*(2*(rand - 1) + 2*(rand - 1)*i) / scale;
a4 = .05*(2*(rand - 1) + 2*(rand - 1)*i) / scale^2;
a5 = .05*(2*(rand - 1) + 2*(rand - 1)*i) / scale^3;
a6 = .05*(2*(rand - 1) + 2*(rand - 1)*i) / scale^4;

%b2 = (2*(rand - 1) + 2*(rand - 1)*i)/10;
%b3 = (2*(rand - 1) + 2*(rand - 1)*i)/100;
%b4 = (2*(rand - 1) + 2*(rand - 1)*i)/1000;

b2 = a2;
b3 = a3;
b4 = a4;
b5 = a5;
b6 = a6;

c1 = 1*a1;
c2 = 1*a2;
c3 = 1*a3;
c4 = 1*a4;
c5 = 1*a5;
c6 = 1*a6;

%a1 = 1;
%b1 = 1;
%a2 = 0;
%b2 = 0;
%a3 = 0;
%b3 = 0;

t = 0:.01:2*pi;
z = [2 + exp(i*t), exp(i*t), -2 + exp(i*t)];

pole = 1.84;

g = abs(a1 ./ (z - pole) + a2 ./ (z - pole).^2 + a3 ./ (z - pole).^3 + a4 ./ (z - pole).^4 + a5 ./ (z - pole).^5 + a6 ./ (z - pole).^6 + b1 ./ (z + pole) + b2 ./ (z + pole).^2 + b3 ./ (z + pole).^3 + b4 ./ (z + pole).^4 + b5 ./ (z + pole).^5 + b6 ./ (z + pole).^6 + c1 ./ z + c2 ./ z.^2 + c3 ./ z.^3 + c4 ./ z.^4 + c5 ./ z.^5 + c6 ./ z.^6);
cap_estimate = abs(a1 + b1 + c1) / max(g);
coords = [a1, a2, a3, a4, a5, a6];