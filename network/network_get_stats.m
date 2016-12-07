function [num_input, num_hidden, num_output] = network_get_stats(network)
    num_input = 0;
    num_hidden = 0;
    num_output = 0;

    for i=1:size(network{1},2)
        node = network{1}(i);
        if node.type == node_types.input || node.type == node_types.bias
            num_input = num_input + 1;
        end
        
        if node.type == node_types.hidden
            num_hidden = num_hidden +1;
        end
        
        if node.type == node_types.output
            num_output = num_output + 1;
        end
    end
end

