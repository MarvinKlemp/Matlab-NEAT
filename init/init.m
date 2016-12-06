function [networks] = init(network_num, num_input, num_output)
    networks = {};
    for i=1:network_num
        nodes = init_nodes(num_input, num_output);
        connections = init_connections(nodes);
        
        networks{1, i} = nodes;
        networks{2, i} = connections;
    end
end

