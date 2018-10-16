function [range_bounds,range_val] = range_bounds(A,dim)
%RANGE_BOUNDS Summary of this function goes here

%% get dim that min/max operated on
if ~exist('dim','var') || isempty(dim) || sum(isnan(dim)) || isequal(dim,'')
    minA = min(A);
    maxA = max(A);
    cat_dim = find(size(minA) ~= size(A));
else
    minA = min(A, [], dim);
    maxA = max(A, [], dim);
    cat_dim = dim;
end
%% Find the actual returns
range_bounds = cat(cat_dim, minA, maxA);
range_val    = range(A(:, cat_dim));
end

