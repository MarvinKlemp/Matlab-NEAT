clear();

% General Config
num_networks = 1;
num_input = 1;
num_output = 1;
bias = 1;
num_generations = 2;

% EVO Config
mut_rate_weight = 0.05;
mut_weight_strenght = 0.2;
mut_rate_add_node = 0.05;
mut_rate_add_connection = 0.05;
config_evo = struct('mut_rate_weight', mut_rate_weight, 'mut_rate_add_node', mut_rate_add_node, 'mut_rate_add_connection', mut_rate_add_connection, 'mut_weight_strenght', mut_weight_strenght);

networks = init(num_networks, num_input, bias, num_output);

% Experiment Data
data = experiment_heartbeat();

% Main Algorithm
err_plot = [];
for i=1:num_generations
    for j=1:num_networks
        % Evaluate Network
        [fitness, error] = evaluate(networks(:, j), data);
        err_plot = [err_plot error];
        networks{3, j}.fitness = fitness;
        networks{3, j}.error = error;
    end

    % EVO
    networks = evolve(networks, config_evo);
end

