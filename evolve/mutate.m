function [network] = mutate(network, config_evo)
    if rand() < config_evo.mut_rate_weight
        network = mutate_weight(network, config_evo.mut_weight_strenght);
    end

    if rand() < config_evo.mut_rate_add_node
        network = mutate_add_node(network);
    end

    if rand() < config_evo.mut_rate_add_connection
        network = mutate_add_connection(network);
    end
end

