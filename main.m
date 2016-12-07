clear();
% Konfiguration
num_networks = 10;
num_input = 1;
num_output = 1;
bias = 1;
num_generations = 50;

networks = init(num_networks, num_input, bias, num_output);

% Experiment Data
data = experiment_heartbeat();

% Main Algorithm
test = [];
for i=1:num_generations
    for j=1:num_networks
        % Evaluate Network
        [fitness, error] = evaluate(networks(:, j), data);
        test = [test fitness];
        
        % EVO
        networks(:, j) = evolve(networks(:, j));
    end
end
