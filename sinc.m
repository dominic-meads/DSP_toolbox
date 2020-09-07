function x1 = sinc(x)
% DESCRIPTION
%  Performs the sinc function. 
%  sinc(x) = sin(pi*x)/(pi*x)
%
% INPUT VARIABLES 
%  x = array containing time domain signal samples
%
% OUTPUT VARIABLES
%  x1 = output array 
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  5/25/2020
%  filename: sinc.m
%
% REFERENCES
%  I used a little help from David Goodmanson on the MATLAB forum
%  https://www.mathworks.com/matlabcentral/answers/532648-why-is-my-reconstructed-function-not-continuous
%
% ENGINEER'S COMMENTS
%  The signal processing toolbox has the sinc function in it but I dont 
%  have that toolbox so I created my own.


% define sinc function
x1 = sin(pi*x)./(pi*x);
x1(x==0) = 1;  % make the function = 1 at x = 0 to avoid NaN
