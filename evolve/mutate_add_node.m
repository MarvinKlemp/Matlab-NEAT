function [network] = mutate_add_node(network)
    % Create Node
    num_next = network{3}.num_next;
    network{1} = [network{1} init_node(num_next, node_types.hidden)];
    network{3}.num_hidden = network{3}.num_hidden + 1;
    network{3}.num_next = num_next + 1;

    num_connections = size(network{2}, 2);

    stmt = false;
    while stmt == false
        num_connection = randi(num_connections);
        connection = network{2}(num_connection);
        
        if connection.enabled == true
            new_connection_in = init_connection(connection.in, num_next, 1);
            new_connection_out = init_connection(num_next, connection.out, 0);
            new_connection_out.weight = connection.weight;
            % Update Network
            network{2}(num_connection).enabled = 0;
            network{2} = [network{2}, new_connection_in];
            network{2} = [network{2}, new_connection_out];
            
            stmt = true;
        end
    end
end

