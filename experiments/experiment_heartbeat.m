function [tdata] = experiment_heartbeat()
    load trainingData.mat
    
    max_in = 0;
    max_out = 0;
    for i=1:size(tdata,2)
        in = max(tdata{i}(:,3));
        out = max(tdata{i}(:,2));

        if in > max_in
            max_in = in;
        end

        if out > max_out
            max_out = out;
        end
    end

    for i=1:size(tdata,2)
        tdata{i}(:,3) = tdata{i}(:,3)./max_in;
        tdata{i}(:,2) = tdata{i}(:,2)./max_out;
    end
end

