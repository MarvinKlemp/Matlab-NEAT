function [networks_evolved] = evolve(networks, config_evo)
    networks_evolved = networks;
    
    % Elite
    elite = find_elite(networks);
    networks_evolved(:, 1) = elite;
    networks_evolved = tournament(networks_evolved, config_evo);
    networks_evolved = mutate(networks_evolved, config_evo);
end

