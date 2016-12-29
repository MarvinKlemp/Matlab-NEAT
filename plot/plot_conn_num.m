function [gen_min, gen_avg, gen_max] = plot_conn_num(gen_min, gen_avg, gen_max, speciations)
    max = 0;
    min = 9999;
    avg = 0;
    network_count = 0;
    
    for j=1:size(speciations,2)
        for i=1:size(speciations{j},2)
            % TODO: Only enabled conns
            num_conns = size(speciations{j}{2, i}, 2);

            if max < num_conns
                max = num_conns;
            end

            if min > num_conns
                min = num_conns;
            end

            avg = avg + num_conns;
            network_count = network_count + 1;
        end
    end
    gen_min = [gen_min min];
    gen_avg = [gen_avg avg/network_count];
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