clear();

% General Config
num_networks = 200;
num_input = 1;
num_output = 1;
bias = 1;
num_generations = 100;

% EVO Config
mut_rate_weight = 0.6;
mut_weight_strenght = 0.1;
mut_rate_add_node = 0.2;
mut_rate_add_connection = 0.2;
rate_crossover = 0.4;
config_evo = struct('num_networks', num_networks, 'mut_rate_weight', mut_rate_weight, 'mut_rate_add_node', mut_rate_add_node, 'mut_rate_add_connection', mut_rate_add_connection, 'mut_weight_strenght', mut_weight_strenght, 'rate_crossover', rate_crossover);

networks = init(num_networks, num_input, bias, num_output);

% Experiment Data
data = experiment_heartbeat();

% Main Algorithm
err_min = [];
err_mean = [];
for i=1:num_generations
    err = [];
    for j=1:num_networks
        % Evaluate Network
        [fitness, error] = evaluate(networks(:, j), data);
        err = [err error];
        networks{3, j}.fitness = fitness;
        networks{3, j}.error = error;
    end

    % Plot
    [err_min, err_mean] = plot_generation(err, err_min, err_mean);
    
    % EVO
    networks = evolve(networks, config_evo);
end
