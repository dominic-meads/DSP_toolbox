function h_out = spectral_inv(h_in);
% DESCRIPTION
%  performs the spectral inversion of a filter kernel. Can
%  be used with LPF to create HPF, etc...
%
%  ex. y = spectral_inv(h_in); -- where h_in is a filter kernel --
%
% INPUT VARIABLES
%  h_in : array containing original kernel
%
% OUTPUT VARIABLES
%  h_out: array containing spectral inversion of kernel
%
% REFERENCES
%  adapted from Dr. Steven W. Smith, Ph.D., author of 
%  "The Scientist and Engineer's Guide to Digital Signal Processing" (p.295)
%  can be accessed: http://www.dspguide.com/
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  3/10/2020
%  filename: spectral_inv.m

m = 1+(length(h_in)-1)/2;  % center point of kernel
h_out = zeros(1,length(h_in)); % pre-allocate memory

for i = 1:length(h_in)
    h_out(i) = -h_in(i); % invert
end

h_out(m) = h_out(m)+1; % add 1 to center point
    


    
    
    
    
