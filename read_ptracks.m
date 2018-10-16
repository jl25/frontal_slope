%% load data
filenames = {'ptracks-2018-10-03-15-04-51.txt','ptracks-2018-10-10-15-52-02.txt'};
%filenames = {'ptracks-2018-10-03-15-04-51.txt'};
N_read = 6;  % the number of columns for each section read
N_keep = 3;  % the number we're keepin in output
H = 3;   % the number of header lines (note added in the trailer here
tracks = cell(length(filenames),1); % one column for each file
for i = 1:length(filenames)
    filename = filenames{i};
    fid=fopen(filename);
    j = 1; % start at 1, which is not of size [0 N] since N > 0, and then go from there appending to next spot
    while ~isequal(size(tracks{i,j}),[0 N_keep]) % once we get to end last thing will have size [0 N]
        j = j+1; % if the last thing checks out we get to move on
        fmt=repmat('%f',1,N_read);  % build the format string for the number columns
        data = textscan(fid,fmt,'headerlines',H,'collectoutput',1); % read section, append to end
        if ~isequal(size(data{1}),[0 N_keep])
            tracks{i,j}(:,1) = data{1}(:,5);                                % x
            tracks{i,j}(:,2) = data{1}(:,6);                                % y
            tracks{i,j}(:,3) = data{1}(:,1:4)* [3600; 60; 1; .001];         % t (absolute time)
        end
    end
    tracks(i,j) = {[]}; %reset the last one which is now of size [0,N] to be of size [0,0] again
    fid=fclose(fid);
end
tracks = tracks(:,2:end-1); % remove the leading empty cell we used as a placeholder, and trailing empty space from our ending condtion from while loop
%% save
save('tracks.mat','tracks')

    