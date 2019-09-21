function [correlation_array,peak]= CAcorr(Sat1,Sat2);
%%AIM: To demonstrate the correlation properties of PRN codes.
%INPUTS: ID Numbers of PRN codes to be compared.
%OUTPUT: Correlation plot,max_value(correlation)=peak.
%cross-correlation
correlation_array=xcorr(CA(Sat1),CA(Sat2));
peak=max(correlation_array);
plot(correlation_array);
assignin('base','peak',peak);
end

