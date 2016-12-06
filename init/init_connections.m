function [connections] = init_connections(nodes)
    connections = [];
    num_nodes = size(nodes, 2);
    
    for i=1:num_nodes
        for j=1:num_nodes
            if (nodes(i).type == 1 && nodes(j).type == 3) 
                connections = [connections init_connection(nodes(i).num, nodes(j).num)];
            end
        end
    end
end

