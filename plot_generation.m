function [err_min, err_mean] = plot_generation(err_min, err_mean, networks)
    err = [];
    for i=1:size(networks,2)
        err = [err networks{3, i}.error];
    end

    err_min = [err_min min(err)];
    err_mean = [err_mean mean(err)];
    
    figure(1)
    plot(err_min);
    hold on;
    plot(err_mean);
    hold off;
    legend('Min Error', 'Mean Error'),
    xlabel('Generation');
    ylabel('Error');
    drawnow
end

