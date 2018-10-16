%% 
qc_data = load('qc_tracks.mat','qc_tracks','qc_ranges'); qc_tracks = qc_data.qc_tracks; qc_ranges = qc_data.qc_ranges;
%% we plot the velocities vs radius
for i = 1:2
    ranges  = qc_ranges{i};
    valid   = ~cellfun('isempty', qc_tracks(i,:));
    data    = qc_tracks(i,:);
    data    = data(valid);
    [v,rm,rm_p,rc,rc_p,t] = cellfun(@v_vs_r, data,'UniformOutput',false);
    v    = cell2mat(v');
    rm   = cell2mat(rm');
    rm_p = cell2mat(rm_p');
    rc   = cell2mat(rc');
    rc_p = cell2mat(rc_p');
    t    = cell2mat(t');
    save(['v_empirical_' num2str(i) '.mat'],'v','rm','rm_p','rc','rc_p','t');
end

%% we plot the velocities vs radius but here we take the mean of each track
for i = 1:2
    ranges  = qc_ranges{i};
    valid   = ~cellfun('isempty', qc_tracks(i,:));
    data    = qc_tracks(i,:);
    data    = data(valid);
    [v,rm,rm_p,rc,rc_p,t] = cellfun(@mean_v_vs_r, data,'UniformOutput',false);
    m_v    = cell2mat(v');
    m_rm   = cell2mat(rm');
    m_rm_p = cell2mat(rm_p');
    m_rc   = cell2mat(rc');
    m_rc_p = cell2mat(rc_p');
    m_t    = cell2mat(t');
    save(['mean_v_empirical_' num2str(i) '.mat'],'m_v','m_rm','m_rm_p','m_rc','m_rc_p','m_t');
end

%% Helper
function [v, rm,rm_p,rc,rc_p,t] = v_vs_r(data) % data is a cell array with all the data
    distance_fcn = @(x1,y1, x2,y2) ((x2-x1).^2 + (y2-y1).^2).^(1/2);
    t    = (data(1:end-1,3) + data(2:end,3)).*(1/2); %avg adjacent
    rm   = (data(1:end-1,4) + data(2:end,4)).*(1/2); %avg adjacent
    rm_p = (data(1:end-1,5) + data(2:end,5)).*(1/2); %avg adjacent
    rc   = (data(1:end-1,6) + data(2:end,6)).*(1/2); %avg adjacent
    rc_p = (data(1:end-1,7) + data(2:end,7)).*(1/2); %avg adjacent
    v    = distance_fcn(data(1:end-1,1),data(1:end-1,2),data(2:end,1),data(2:end,2))./ diff(data(:,3)); % dx/dt
end
function [v, rm,rm_p,rc,rc_p,t] = mean_v_vs_r(data) % data is a cell array with all the data
    distance_fcn = @(x1,y1, x2,y2) ((x2-x1).^2 + (y2-y1).^2).^(1/2);
    t    = (data(1:end-1,3) + data(2:end,3)).*(1/2); %avg adjacent
    rm   = (data(1:end-1,4) + data(2:end,4)).*(1/2); %avg adjacent
    rm_p = (data(1:end-1,5) + data(2:end,5)).*(1/2); %avg adjacent
    rc   = (data(1:end-1,6) + data(2:end,6)).*(1/2); %avg adjacent
    rc_p = (data(1:end-1,7) + data(2:end,7)).*(1/2); %avg adjacent
    v    = distance_fcn(data(1:end-1,1),data(1:end-1,2),data(2:end,1),data(2:end,2))./ diff(data(:,3)); % dx/dt
    %
    valid = (v ~= 0);
    %
    t    = mean(t(valid),1);
    rm   = mean(rm(valid),1);
    rm_p = mean(rm_p(valid),1);
    rc   = mean(rc(valid),1);
    rc_p = mean(rc_p(valid),1);
    v    = mean(v(valid),1);
end

