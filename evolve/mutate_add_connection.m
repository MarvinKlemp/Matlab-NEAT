function [network] = mutate_add_connection(network)
    num_nodes = size(network{1}, 2);
    num_inputs = network{3}.num_inputs;

    stmt = false;
    i = 0;
    while stmt == false && i <= 10
        % out, max muss größer als input sein
        in = randi(num_nodes);
        out = randi([num_inputs+1, num_nodes]);
        
        if network_has_connection(network, in, out)
            i = i + 1;
            continue;
        else
            network{2} = [network{2} init_connection(in, out, 0)];
            stmt = true;
        end
    end
end

