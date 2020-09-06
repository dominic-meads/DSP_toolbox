function [xe, xo] = even_odd_decomp(x)
% DESCRIPTION
%  decomposes a signal into its even and odd components
%  Useful for FFTs
%
%  ex. [xe, xo] = even_odd_decomp(x)
%
% INPUT VARIABLES
%  x : array containing the values of the signal. 
%
% OUTPUT VARIABLES
%  xe : array containing even values of x
%  xo : array containing odd values of x 
%
% REFERENCES
%  DSP Using MATLAB, 3rd edition, Ingle, V. and Proakis, J. (pg. 34)
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  4/13/2020
%  filename: even_odd_decomp.m

n1 = length(x)-1;
n2 = -(length(x)-1);

m1 = n2:n1;
m2 = 1:length(x);

x1 = zeros(1,length(m1));
x1(m2+



tf = isreal(x);  % check to see if x is a real valued array
if (tf == 0)
    error('x is not a real sequence');
end





    


    

