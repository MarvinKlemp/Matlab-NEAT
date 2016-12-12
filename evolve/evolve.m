function [networks_evolved] = evolve(networks, config_evo)
    networks_evolved = networks;
    
    % Elite
    elite = find_elite(networks);
    networks_evolved(:, 1) = elite;
    
    networks_evolved = tournament(networks);
    
    for i=1:size(networks, 2)
        % evolved_network = networks(:, i);
        % Tournament
        % Crossover
        % Mutate
        evolved_network = mutate(networks(:, i), config_evo);
        networks_evolved(:, i) = evolved_network;
    end
end

