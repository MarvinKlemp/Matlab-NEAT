function [representatives] = speciate_representatives(speciations)
    num_speciations = size(speciations, 2);
    representatives = []
    
    % Get Representatives
    for i=1:num_speciations
        speciation_size = size(speciations{i}, 2);
        ind_representative = randi([1, speciation_size]);
        
        representatives = [representatives speciations{i}(:, ind_representative)];
    end
end

