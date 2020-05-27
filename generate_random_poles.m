% Generate a bunch of random poles contained inside each disk

% count = number of poles per disk

function poles = generate_random_poles(centers, radius, count)
    poles = zeros(1, length(centers)*count);
    for c = 1:length(centers)
        for k = 1:count
            poles((c - 1)*count + k) = centers(c) + radius*rand*exp(2*pi*1i*rand);
        end
        %poles
    end
    
end