function [fitness, err] = evaluate(network, data)
    % ERROR HIER
    num_hidden = network{3}.num_hidden;
    num_outputs = network{3}.num_outputs;
    act = zeros(1, num_hidden+num_outputs);
    
    % calculate fitness
    err = [];
    for i=1:1
        for j=1:size(data{i}, 1)
            in = data{i}(j, 3);
            target = data{i}(j, 2);
            
            [error, act] = network_run(network, act, in, target);
            err = [err error];
        end
    end
    
    fitness = sum(err) / size(err,2);
    err = fitness;
end

