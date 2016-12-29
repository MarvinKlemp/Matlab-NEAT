function [] = plot_approx(network, data)
    num_hidden = network{3}.num_hidden;
    num_outputs = network{3}.num_outputs;
    act = zeros(1, num_hidden+num_outputs);    
    W = network_to_mat(network);
    
    out = [];
    for i=1:size(data{12}, 1)
        input = data{12}(i, 3);
    
        act = tanh([input 1 act] * W);
        out = [out act(end)];
    end

    figure(5);
    plot(out);
    hold off;
end

