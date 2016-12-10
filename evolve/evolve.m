function [networks_evolved] = evolve(networks, config_evo)
    networks_evolved = {};

    for i=1:size(networks, 2)
        % evolved_network = networks(:, i);
        % Tournament
        % Crossover
        % Mutate
        evolved_network = mutate(networks(:, i), config_evo);
        networks_evolved{1, i} = evolved_network{1};
        networks_evolved{2, i} = evolved_network{2};
        networks_evolved{3, i} = evolved_network{3};
    end
end

