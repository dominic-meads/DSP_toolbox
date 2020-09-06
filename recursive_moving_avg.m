function y = recursive_moving_avg(m,x)
% DESCRIPTION
%  calculates a recursive moving average filter response based
%  on length(m) and the input signal(x). Good for random noise and smoothing
%  ex. h = recursive_moving_average(m,x)
%
% INPUT VARIABLES
%  m = desired length of filter (must be odd number for symmetry) 
%  x = array containing signal
% OUTPUT VARIABLES
%  y = output array of filtered signal
%
% REFERENCES
%  adapted from Dr. Steven W. Smith, Ph.D., author of 
%  "The Scientist and Engineer's Guide to Digital Signal Processing" (p.278)
%  can be accessed: http://www.dspguide.com/
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  3/17/2020
%  filename: recursive_moving_avg.m

p = (m-1)/2;  % calculate filter constants
q = p + 1;

y = zeros(1,m);  % allocate memory

sum = 0; % sum variable for finding the first average

for i = 1:m   % find y(p) by averaging points x(1) through x(m)
    sum = sum + x(i);
end
y(p) = sum/m;


for i = (p + 2):(length(x)-p) % find the rest of the points
    y(i) = y(i-1) + x(i+p) - x(i-q);
    
    if (i-q) <= 0    % pad zeros for non-positive indecies
        x(i-q) = 0;
    end
    y(i) = y(i)/m;
end
    
    
   


