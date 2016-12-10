function [network] = mutate_add_node(network)
    num_next = network{3}.num_next;
    network{1} = [network{1} init_node(num_next, node_types.hidden)];
    network{3}.num_next = num_next + 1;
end

