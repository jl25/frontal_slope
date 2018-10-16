%% load data
qc_data = load('qc_tracks.mat','qc_tracks'); qc_tracks = qc_data.qc_tracks;
%% Column 4 is regular radius, 5 is pratt_radius
radii_fcn = @(x,y,xc,yc) ((x-xc).^2 + (y-yc).^2).^(1/2);
for i = 1:2
    for j = 1:length(qc_tracks(1,:))
        data = qc_tracks{i,j};
        if ~isempty(data)
            x = data(:,1); y = data(:,2); 
            [xc  ,yc  ,rc  ] = circle_fit(x,y);
            [xc_p,yc_p,rc_p] = pratt_circle_fit(x,y);
            data(:,4)        = radii_fcn(x,y,xc,yc)    ; % radius from regular center
            data(:,5)        = radii_fcn(x,y,xc_p,yc_p); % radius from pratt   center
            data(:,6)        = rc                      ; % regular radius
            data(:,7)        = rc_p                    ; % pratt   radius
            qc_tracks{i,j}   = data;
        end
    end
end
%% add ranges
qc_ranges = cell(size(qc_tracks,1),1);
for i = 1:size(qc_tracks,1)
    data = qc_tracks(i,:); data = data(~cellfun('isempty', data)); data = cell2mat(data');
    qc_ranges{i} = range_bounds(data,1);
end
%%
save('qc_tracks.mat','qc_tracks','qc_ranges');

