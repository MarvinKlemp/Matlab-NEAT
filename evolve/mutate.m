function [networks] = mutate(networks, config_evo)
    for i=1:size(networks, 2)
        network = networks(:, i);
        if rand() < config_evo.mut_rate_weight
            network = mutate_weight(network, config_evo.mut_weight_strenght);
        end

        if rand() < config_evo.mut_rate_add_node
            network = mutate_add_node(network);
        end

        if rand() < config_evo.mut_rate_add_connection
            network = mutate_add_connection(network);
        end
        networks(:, i) = network;
    end
end

