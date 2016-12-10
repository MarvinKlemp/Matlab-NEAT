function [network] = mutate_weight(network, mut_weight_strenght)
    num_connections = size(network{2},2);
    num_connection = randi(num_connections);
    mutation = (randn() * mut_weight_strenght);
    network{2}(num_connection).weight = network{2}(num_connection).weight + mutation; 
end

