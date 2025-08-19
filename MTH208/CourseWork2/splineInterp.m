function P = splineInterp(x, y, xx)
% P = splineInterp(x,y,xx)
% 自然三次样条插值：用 MATLAB 自带 spline + ppval
% x, y: 插值节点
% xx: 待求点
pp = spline(x, y);    % MATLAB 自带，自然边界
P  = ppval(pp, xx);
end
