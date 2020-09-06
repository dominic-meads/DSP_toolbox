function xbr = bit_reversal(x)
% DESCRIPTION
%  performs a bit reversal of the index values in an array
%  Useful for FFTs
%
%  ex. b = bit_reversal(x)
%
% INPUT VARIABLES
%  x : array (base 2 number)
%
% OUTPUT VARIABLES
%  xbr : array containing the bit-reversed indecies of x
%
% NOTES
%  MATLAB doesn't allow negative/zero indecies. 
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  4/4/2020
%  filename: bit_reversal.m

m = length(x);
r = log2(m);

xbr = zeros(1,m);

for i = 0:m-1
    a = bin2dec(fliplr(dec2bin(i,r)));
    xbr(i+1) = x(a+1); % input the value at the bit reversed index of x to xbr
end











    
