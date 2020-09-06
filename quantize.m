function x = quantize(fs,n,ft)
% DESCRIPTION
%  Performs a quantization of a continuous time signal based 
%  on the sampling frequency, number of samples, and input function
%  ex. x = quantize(fs,n,ft) = quantize(200,20,sin(3*pi*t))
%
% INPUT VARIABLES
%  fs = sampling frequency in Hz 
%  n = desired number of samples
%  ft = continuous time function f(t)
%
% OUTPUT VARIABLES
%  x = array(double) containing the discrete time samples
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  3/21/2020
%  filename: quantize.m

Ts = 1/fs;         % Sampling Period 
n1 = 0:n-1;        % create the sample array
t = n1*Ts;         % sampling instances in time
x = ft;

end
