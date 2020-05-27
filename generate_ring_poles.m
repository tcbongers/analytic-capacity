% Generate polar rings

% Generate poles within each disk, with four poles per ring
% at points c +/- r_j and c +/- i r_j with r_j equally distributed
% between 0 and r

% count = number of poles per disk

function poles = generate_ring_poles(centers, radius, num_rings)
    poles = zeros(1, length(centers)*(4*num_rings + 1));
    for c = 0:length(centers)-1
        poles(c*(4*num_rings + 1) + 1) = centers(c+1);
        
        for ring = 0:num_rings - 1
            for angle = 1:4
                              
                poles(c*(4*num_rings + 1) + 4*ring + angle + 1) = centers(c + 1) + ((ring + 1) / (num_rings + 1))*radius*(1i)^(angle - 1);
                
            end
        end
            
        
        
    end
    
    
end