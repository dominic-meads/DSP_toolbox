function y = moving_avg(m,x)
% DESCRIPTION
%  calculates a moving average filter based
%  on length(m) and the input signal(x). Good for random noise and smoothing
%  ex. h = moving_avg(m,x)
%
% INPUT VARIABLES
%  m = desired length of filter 
%  x = array containing signal
% OUTPUT VARIABLES
%  y = output array of filtered signal
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  3/19/2020
%  filename: moving_avg.m

y = zeros(1,length(x));  % allocate memory
sum = 0;

for i = 1:length(x)-m  % so i+n doesnt exceed max number of elements
    sum = 0;  % zero sum each time through loop
    for n = 1:m-1
        sum = sum + x(i+n);
    end
    sum = sum + x(i);
    y(i) = sum/m;
end
    
    
    
    
    
