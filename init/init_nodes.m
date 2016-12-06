function [nodes] = init_nodes(num_input, bias, num_output)
    nodes = [];
    node_counter = 1;
    
    for i=1:num_input
        nodes = [nodes init_node(node_counter, 1)];
        node_counter = node_counter + 1;
    end
    
    if bias == 1
        nodes = [nodes init_node(node_counter, 2)];
        node_counter = node_counter + 1;
    end
    
    for j=1:num_output 
        nodes = [nodes init_node(node_counter, 4)];
        node_counter = node_counter + 1;
    end
end

