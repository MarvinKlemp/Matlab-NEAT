function [gen_min, gen_avg, gen_max] = plot_conn_num(gen_min, gen_avg, gen_max, networks)
    max = 0;
    min = 9999;
    avg = 0;
    
    for i=1:size(networks,2)
        % TODO: Only enabled conns
        num_conns = size(networks{2, i}, 2);
        
        if max < num_conns
            max = num_conns;
        end
        
        if min > num_conns
            min = num_conns;
        end
        
        avg = avg + num_conns;
    end
    
    gen_min = [gen_min min];
    gen_avg = [gen_avg avg/size(networks,2)];
    gen_max = [gen_max max];
    
    figure(4)
    plot(gen_min);
    hold on;
    plot(gen_avg);
    hold on;
    plot(gen_max);
    hold off;
    legend('Min. Num. Conns.', 'Avg. Num. Conns.', 'Max. Num. Conns.'),
    xlabel('Generation');
    ylabel('Connectionanzahl');
    ylim([0 inf])
    drawnow
end