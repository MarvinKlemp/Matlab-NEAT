function [selected_networks] = tournament(networks)
    selected_networks = networks;
    num_networks = size(networks,2);
    
    for i=2:num_networks
        t1_p1_p2_index = randi(num_networks, 1, 2);
        t1_p1 = networks{3, t1_p1_p2_index(1)};
        t1_p2 = networks{3, t1_p1_p2_index(2)};
        [t1_fit, t1_par] = min([t1_p1.fitness, t1_p2.fitness]);
        t1_parent = networks(:, t1_p1_p2_index(t1_par));

        t2_p1_p2_index = randi(num_networks, 1, 2);
        t2_p1 = networks{3, t2_p1_p2_index(1)};
        t2_p2 = networks{3, t2_p1_p2_index(2)};
        [t2_fit, t2_par] = min([t2_p1.fitness, t2_p2.fitness]);
        t2_parent = networks(:, t2_p1_p2_index(t2_par));
        
        % Crossover 
        selected_networks(:, i) = crossover_neat(t1_parent, t2_parent);
    end
end

