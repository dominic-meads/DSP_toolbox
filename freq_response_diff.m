function H = freq_response_diff(a,b,K)
% DESCRIPTION
%  Calculates the frequency response (magnitude and phase) of a difference
%  equation. Useful for IIR filters
%
%  Form:        summation: m=0 to M of b_sub_m * exp(-j*w_sub_k*m)
%             ------------------------------------------------------
%             1 + summation: l=1 to N of a_sub_l * exp(-j*w_sub_k*l)
%  
%                       *see pg 78 for a better visual
%
% INPUT VARIABLES
%  a = array containing coefficients of y(n-t) 
%  b = array containing coefficients of x(n-t)
%  K = evenly spaced divisions of omega (frequency) over [0,pi]
%
% OUTPUT VARIABLES
%  H = the frequency response (DTFT of impulse response)
%  Various graphs of signal aspects
%
% REFERENCES
%  Adapted from "Digital Signal Processing Using MATLAB 3rd ed." - Ingle, V.,
%  Proakis, J. (pg. 79). 
%
% DOCUMENTATION
%  ver 1.0 by Dominic Meads  5/12/2020
%  filename: freq_response_diff.m
%

k = 0:K;  % create "k" array

w = pi*k/K;  % calculate sampled omega array

m = 0:length(b)-1;  % summation boundaries for denominator
l = 0:length(a);  % summation boundaries for numerator
                    %{ 
                       l goes from 0:length(a) instead of 0:length(a)-1
                       like the definition above. The added index here is
                       for the one seen in denominator 
                    %}

% this next section adds the one into the denominator array
%**********************************************************************
a1 = zeros(1,length(a)+1);  % adds an extra space for the one

% loop to right shift all indecies to the right to make room for one
for i = 2:length(a)+1
    a1(i) = a(i-1);
end 
a1(1) = 1; % adds the one to the first index of coefficient array
%**********************************************************************

% now need to multiply with the complex exponential
% l and m are transposed to comply with matrix operation rules

numerator = b * exp(-j*m'*w);  
denominator = a1 * exp(-j*l'*w);

% calculation of frequency response
H = numerator ./ denominator;  % element by element division used for w

% assignment for separate phase and magnitude responses
magH = abs(H);    
angH = angle(H); 

% graphs
subplot(2,1,1); plot(w/pi,magH); grid % w/pi used for x axis for convenience
title('Magnitude Part'); xlabel('Frequency in pi units'); ylabel('|H|');
subplot(2,1,2); plot(w/pi,angH/pi); grid 
title('Phase Part'); xlabel('Frequency in pi units'); ylabel('Phase in pi radians');







