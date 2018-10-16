function [c] = draw_circle(x,y,r, options)
%DRAW_CIRCLE Draws a circle in the current figure
% option are typical rectangle options, just put into a cell array
if ~exist('options','var') || isempty(options); options = {}; end


c = rectangle('position',[x-r,y-r,r*2,r*2],'curvature',[1,1], options{:}); % curvature makes it a square, position is [x,y,w,h]
end

