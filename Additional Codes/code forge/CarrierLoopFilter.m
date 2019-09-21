function[FLLoutput]=CarrierLoopFilter(w,a,FLLinput,FLLinput_old,FLLoutput_old)
t=1*(10^9-3));
%w=20;
%a=0.707;
%CodeDamp=1;
FLLoutput= FLLoutput_old+(T*(w^2)+a*w)*FLLinput-(a*w)*FLLinput_old;
%offside=offside_old+T*CodeErr;
