function [err_min, err_mean] = plot_generation(err, err_min, err_mean)
    err_min = [err_min min(err)];
    err_mean = [err_mean mean(err)];
    
    figure(1)
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

