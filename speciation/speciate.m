function [speciations_new] = speciate(speciations, representatives, config_evo)
    speciations_new = {};
    for i=1:size(speciations, 2)
        speciations_new{i} = [representatives(:, i)];
    end
    
    for i=1:size(speciations, 2)
        networks = speciations{i};
        for j=1:size(speciations{i}, 2)
            min_delta = 9999;
            ind_speciation = 1;
            
            network = networks(:, j);
            
            % Find Best Delta
            for k=1:size(representatives, 2)
                delta = calculate_delta(network, representatives(:, k), config_evo);
                
                if delta < min_delta
                    min_delta = delta;
                    ind_speciation = k;
                end
            end
            
            % Add to Speciation Or Create New Speciation
            if min_delta < config_evo.speciation_threshold
                speciations_new{ind_speciation} = [speciations_new{ind_speciation} network];
            else
                ind_new = size(speciations_new, 2) + 1;
                speciations_new{ind_new} = [network];
                representatives = [representatives network];
            end
        end
    end
    
end

