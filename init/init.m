function [networks] = init(network_num, num_inputs, bias, num_outputs)
    networks = {};
    for i=1:network_num
        nodes = init_nodes(num_inputs, bias, num_outputs);
        connections = init_connections(nodes);
        
        networks{1, i} = nodes;
        networks{2, i} = connections;
        networks{3, i} = struct('fitness', 0, 'error', 0, 'num_inputs', num_inputs+bias, 'num_hidden', 0, 'num_outputs', num_outputs, 'num_next', num_inputs+bias+num_outputs+1);
    end
end

