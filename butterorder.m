function n = butterorder(f,fc,M)
% DESCRIPTION
%  Provides the order of a LP butterworth filter given cuttoff frequency, 
%  stopband frequency, and magnitude at stopband frequency (in dB)
%
%  ex. n = butterorder(f,fc,M)
%
% INPUT VARIABLES
%  f : stopband frequency
%  fc : cutoff frequency
%  M : magnitude at stopband frequency (in dB)
%
% OUTPUT VARIABLES
%  n : filter order
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  9/6/2020
%  filename: butterorder.m

% all calculations derived from the magnitude response equation for LP
% Butterworth filter

logbase = @(X,base) log(X)/log(base);  % generating a log with an arbitrary base

x = (1/(10^(M/10))-1);  % the quantity to take the log of
b = f/fc;  % finding the base of the logrithm

n = logbase(x,b)/2;

end
