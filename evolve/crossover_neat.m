function [child] = crossover_neat(parent1, parent2)
    if parent1{3}.fitness > parent2{3}.fitness
        % Switch parent1 and parent2
        tmp = parent1;
        parent1 = parent2;
        parent2 = tmp;
    end

    num_genes_parent1 = size(parent1{2}, 2);
    num_genes_parent2 = size(parent2{2}, 2);
    connections = [];
    for i=1:num_genes_parent1
        matching = false;
        for j=1:num_genes_parent2
            % If Connection Genes are the same
            if parent1{2}(i).innovation == parent2{2}(j).innovation
                if randi(2) == 1
                    connections = [connections parent1{2}(i)];
                else
                    connections = [connections parent2{2}(j)];
                end
                
                matching = true;
                break;
            end
        end
        
        if matching == false
            connections = [connections parent1{2}(i)];
        end
    end
    
    nodes = [];
    nodes_found = zeros(100);
    for i=1:size(connections,2)
        node_in_ind = connections(i).in;
        node_out_ind = connections(i).out;
        
        
        if nodes_found(node_in_ind) == 0
            for j=1:size(parent1{1},2)
                if parent1{1}(j).num == node_in_ind
                    nodes = [nodes parent1{1}(j)];
                    nodes_found(node_in_ind) = 1;
                end
            end
        end
        
        if nodes_found(node_out_ind) == 0
            for j=1:size(parent1{1},2)
                if parent1{1}(j).num == node_out_ind
                    nodes = [nodes parent1{1}(j)];
                    nodes_found(node_out_ind) = 1;
                end
            end
        end
    end
    
    child{1,1} = nodes;
    child{2,1} = connections;
    num_nodes = size(nodes,2);
    % TODO: Dynamic
    child{3,1} = struct('fitness', 0, 'error', 0, 'num_inputs', 2, 'num_hidden', num_nodes-3, 'num_outputs', 1, 'num_next', num_nodes+1);
end

