function [W] = network_to_mat(network)
    [num_inputs, num_hidden, num_outputs] = network_get_stats(network);

    W = zeros(num_inputs+num_hidden+num_outputs, num_hidden+num_outputs);
    for i=1:size(network{2},2)
        conn = network{2}(i);
        if conn.enabled == 1
           W(conn.in, conn.out - num_inputs) = conn.weight;
        end
    end
end

