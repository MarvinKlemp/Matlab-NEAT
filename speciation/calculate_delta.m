function [delta] = calculate_delta(induvidual, representative, config_evo)
    genes_weight_diff = 0;
    genes_disjoined_excess = 0;
    
    % So Ugly, I'm Sorry...
    connections_ind = induvidual{2};
    connections_rep = representative{2};
    for i=1:size(induvidual{2}, 2)
        matching = false;
        for j=1:size(representative{2}, 2)
            conn_ind = connections_ind(i);
            conn_rep = connections_rep(j);
            % If Connection Genes are the same
            if  conn_ind.innovation == conn_rep.innovation 
                genes_weight_diff = genes_weight_diff + abs(conn_ind.weight - conn_rep.weight);
                matching = true;
                break;
            end
        end
        
        if matching == false
            genes_disjoined_excess = genes_disjoined_excess + 1;
        end
    end
    
    delta = config_evo.speciation_ed * genes_disjoined_excess + config_evo.speciation_weight * genes_weight_diff;
end

