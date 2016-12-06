function [nodes] = init_nodes(num_input, num_output)
    nodes = [];
    
    for i=1:num_input
        nodes = [nodes init_node(i, 1)];
    end
    
    for j=1:num_output 
        nodes = [nodes init_node(i+j, 3)];
    end
end

