% manually edit tracks.mat to get qc_tracks.mat
% 'remainder' generally means --> end
%#ok<*NOSEM> % suppress
%#ok<*NASGU> 
%#ok<*NBRAK> 
%% Load old data
data = load('tracks.mat','tracks'); qc_tracks = data.tracks;
%% File 1
f = 18; i = 1;
c =[1,01]; split_inds = [144]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:144,:)}       ;   % discard remainder
c =[1,02]; split_inds = [   ]         ;                                                                                         ;   % done
c =[1,03]; split_inds = [   ]         ;                                                                                         ;   % done
c =[1,04]; split_inds = [046]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:046,:)}       ;   % keep 1 and remainder (2)
                              C=[1,f] ; inds = num2cell(C);                       ;qc_tracks(inds{:}) = {d{1}(047:end,:)}       ;   f = f+1; % 16 (deleted 3 added 2, started w/17)
c =[1,05]; split_inds = [139]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:139,:)}       ;   % discard remainder
c =[1,06]; split_inds = [042,138]     ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:042,:)}       ;   % discard remainder
                              C=[1,f] ; inds = num2cell(C);                       ;qc_tracks(inds{:}) = {d{1}(043:138,:)}       ;   f = f+1; % 17
c =[1,07]; split_inds = [073]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:073,:)}       ;   % discard remainder
c =[1,08]; split_inds = [   ]         ;                                                                                         ;   % done  
c =[1,09]; split_inds = [003]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(004:end,:)}       ;   % keep remainder
c =[1,10]; split_inds = [064]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:064,:)}       ;   % discard remainder
c =[1,11]; split_inds = [   ]         ;                                                                                         ;   % done
c =[1,12]; split_inds = [   ]         ;                                                                                         ;   % done
c =[1,13]; split_inds = [065,074]     ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:065,:)}       ;   % keep 1 and remainder(3)
                              C=[1,f] ; inds = num2cell(C);                       ;qc_tracks(inds{:}) = {d{1}(075:end,:)}       ;   f = f+1; %18
c =[1,14]; split_inds = [   ]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}       ;   % is repeat of [1,13], delete
c =[1,15]; split_inds = [   ]         ;                                                                                         ;   % done
c =[1,16]; split_inds = [   ]         ;                                                                                         ;   % done
c =[1,17]; split_inds = [   ]         ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}       ;   % is repeat of [1,17], delete
% c =[1,18-24]; split_inds = [   ]         ;    % exceeds bounds

%remove emptys
xx = qc_tracks(i,:); xx = xx(~cellfun('isempty', xx)); xx(length(xx)+1:size(qc_tracks,2)) = {[]}; qc_tracks(i,:) = xx;
%% File 2
f=25; i = 2;
c =[2,01]; split_inds = [100]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:125,:)}      ; % discard remainder
c =[2,02]; split_inds = [   ]          ;                                                                                        ; % done
c =[2,03]; split_inds = [010,145]      ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(011:145,:)}      ; % keep 2
c =[2,04]; split_inds = [220]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:220,:)}      ; % discard remainder
c =[2,05]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % is repeat of [2,03], delete
c =[2,06]; split_inds = [015]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(016:end,:)}      ; % keep remainder
c =[2,07]; split_inds = [010]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:010,:)}      ; % discard remainder
c =[2,08]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % too messy, delete
c =[2,09]; split_inds = [014,026]      ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(015:026,:)}      ; % keep 2
c =[2,10]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % too messy, delete
c =[2,11]; split_inds = [012]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:012,:)}      ; % discard remainder       
c =[2,12]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % too messy, delete
c =[2,13]; split_inds = [010]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:010,:)}      ; % discard remainder   
c =[2,14]; split_inds = [002]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(003:end,:)}      ; % keep remainder
c =[2,15]; split_inds = [011]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(012:end,:)}      ; % keep remainder
c =[2,16]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % is repeat of [2,14], delete
c =[2,17]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % is repeat of [2,15], delete
c =[2,18]; split_inds = [   ]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:000,:)}      ; % is repeat of [2,14], delete
c =[2,19]; split_inds = [   ]          ;                                                                                        ; % done
c =[2,20]; split_inds = [200]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(001:200,:)}      ; % keep 1 and remainder (2)
                               C=[2,f] ; inds = num2cell(C);                       ;qc_tracks(inds{:}) = {d{1}(201:end,:)}      ;   f = f+1; % 18(deleted 7 added 1, started w/ 24)
c =[2,21]; split_inds = [005]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(006:end,:)}      ; % keep remainder
c =[2,22]; split_inds = [025,40]       ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(026:040,:)}      ; % keep 2
c =[2,23]; split_inds = [011]          ; inds = num2cell(c); d = qc_tracks(inds{:});qc_tracks(inds{:}) = {d{1}(012:end,:)}      ; % keep remainder                                                                                         
c =[2,24]; split_inds = [   ]          ;                                                                                        ; % done

%remove emptys
xx = qc_tracks(i,:); xx = xx(~cellfun('isempty', xx)); xx(length(xx)+1:size(qc_tracks,2)) = {[]}; qc_tracks(i,:) = xx;
%% save
save('qc_tracks.mat','qc_tracks')

%% Circle fits
x = tracks{c(1),c(2)}(:,1); y = tracks{c(1),c(2)}(:,2); 
disp(length(x))
[xc,yc,rc] = circle_fit(x,y); [xc_p,yc_p,rc_p] = pratt_circle_fit(x,y);
figure();
hold on;
p1 = 1;
for ind = [split_inds(:)',Inf]
    if isinf(ind)
        scatter(x(p1:end),y(p1:end),'linewidth',1,'markeredgecolor',rand(1,3)); p1 = ind+1; %plot based on the separations you said      
    else
        scatter(x(p1:ind),y(p1:ind),'linewidth',1,'markeredgecolor',rand(1,3)); p1 = ind+1; %plot based on the separations you said
    end
end
%qcx = qc_tracks{c(1),c(2)}(:,1); qcy = qc_tracks{c(1),c(2)}(:,2); 
%scatter(qcx,qcy,20,'Marker','+','linewidth',1,'markerfacecolor',rand(1,3)); %plot data youre keeping
draw_circle(xc  ,yc  ,rc  ,{'linestyle','-','edgecolor','b','linewidth',2});
draw_circle(xc_p,yc_p,rc_p,{'linestyle',':','edgecolor','r','linewidth',2});
hold off