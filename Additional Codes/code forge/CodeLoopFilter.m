function [CodeErr]=CodeLoopFilter(w,a,theta_code,theta_code_old,CodeErr_ols)
t=1*(10^(-3));
%w=20;
%a=2;
%CodeDamp=1;
CodeErr=CodeErr_old+(T*(w^2)+a*w)8theta_code-(a8w)8theta_code_old;
%offside=offside_old+T*CodeErr;