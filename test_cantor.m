centers = [1/8 + i/8, 1/8 + 7*i/8, 7/8 + i/8, 7/8 + 7*i/8];
radius = 1/8;

centers2 = [centers/4, centers/4 + 3/4, centers/4 + 3*i/4, centers/4 + 3/4 + 3*i/4];
radius2 = radius/4;

centers3 = [centers2/4, centers2/4 + 3/4, centers2/4 + 3*i/4, centers2/4 + 3/4 + 3*i/4];
radius3 = radius2/4;

centers4 = [centers3/4, centers3/4 + 3/4, centers3/4 + 3*i/4, centers3/4 + 3/4 + 3*i/4];
radius4 = radius3/4;

centers5 = [centers4/4, centers4/4 + 3/4, centers4/4 + 3*i/4, centers4/4 + 3/4 + 3*i/4];
radius5 = radius4/4;

centers6 = [centers5/4, centers5/4 + 3/4, centers5/4 + 3*i/4, centers5/4 + 3/4 + 3*i/4];
radius6 = radius5/4;

centers7 = [centers6/4, centers6/4 + 3/4, centers6/4 + 3*i/4, centers6/4 + 3/4 + 3*i/4];
radius7 = radius6/4;

current = centers4;
r = radius4;

A = zeros(length(current), length(current));
%length(current)
for k = 1:length(current)
    for l = 1:length(current)

        for j = 1:length(current)
            if j ~= k && j ~= l
%               A(k, l) = A(k, l) + 2*real(r / ((current(k) - current(j))*(current(l) - current(j))' - r^2));
               A(k, l) = A(k, l) + 2*real(r / ((current(k) - current(j))*(current(l) - current(j))' - r^2  ));
%                A(k, l) = A(k, l) + 2*abs(r / ((current(k) - current(j))*(current(l) - current(j))'));
                
            end
        end
        if k == l
           A(k, l) = A(k, l) + 2/r;
        end 
    end
end

B = A*r
sum(B) - diag(B)'

%col_sums = r*(sum(A) - diag(A)')
%max(col_sums)
%min(col_sums)