clear();

% General Config
num_networks = 10;
num_input = 1;
num_output = 1;
bias = 1;
num_generations = 200;

% EVO Config
mut_rate_weight = 0.8;
mut_weight_strenght = 0.1;
mut_rate_add_node = 0.2;
mut_rate_add_connection = 0.1;
rate_crossover = 0.3;
speciation_ed = 2;
speciation_weight = 0.1;
speciation_threshold = 8;
config_evo = struct('num_networks', num_networks, 'mut_rate_weight', mut_rate_weight, 'mut_rate_add_node', mut_rate_add_node, 'mut_rate_add_connection', mut_rate_add_connection, 'mut_weight_strenght', mut_weight_strenght, 'rate_crossover', rate_crossover, 'speciation_ed', speciation_ed, 'speciation_weight', speciation_weight, 'speciation_threshold', speciation_threshold);

networks = init(num_networks, num_input, bias, num_output);
speciations = {networks};

% Experiment Data
data = experiment_heartbeat();

% Main Algorithm
best_network = networks(:, 1);
best_network{3}.fitness = 100;
err_mean = [];
err_min = [];
gen_node_min = [];
gen_node_avg = [];
gen_node_max = [];
gen_conn_min = [];
gen_conn_avg = [];
gen_conn_max = [];

for i=1:num_generations
    for k=1:size(speciations, 2)
        networks = speciations{k};
        for j=1:size(networks, 2)
            % Evaluate Network
            [fitness, error] = evaluate(networks(:, j), data);
            networks{3, j}.fitness = fitness;
            networks{3, j}.error = error;

            if networks{3, j}.fitness < best_network{3}.fitness
                best_network = networks(:, j);
            end
        end
        speciations{k} = networks;
    end
    
    % Speciation Get Representatives
    representatives = speciate_representatives(speciations);
    
    % Plot
    [err_min, err_mean] = plot_generation(err_min, err_mean, speciations);
    plot_elite(best_network);
    [gen_node_min, gen_node_avg, gen_node_max] = plot_node_num(gen_node_min, gen_node_avg, gen_node_max, speciations);
    [gen_conn_min, gen_conn_avg, gen_conn_max] = plot_conn_num(gen_conn_min, gen_conn_avg, gen_conn_max, speciations);
    plot_approx(best_network, data);
    
    % EVO
    for k=1:size(speciations, 2)
        speciations{k} = evolve(speciations{k}, config_evo); 
    end
    
    % Speciation Shuffle Ind. In Speciations
    speciations = speciate(speciations, representatives, config_evo);
end
