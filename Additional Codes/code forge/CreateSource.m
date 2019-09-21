function [Signal_Source,Phase_signal,buffer_bit_data]=CreateSource(phcode,fd,ph,snr)
global time_unit;
global time;
global time_cyc;
global fs;
global nn;
global kk;
global F_if
global CA_Freq;

buffer_bit_data=[];
Tr_data=[];
data=[];
AWGNflag=1;
SNR=snr;
MBuffer=[];

data_change=time/time_unit;
for n=1:data_change
    bit_data=(ceil(rand-0.5)*(-2)+1);
    buffer_bit_data=[buffer_bit_data bit_data];
    Tr_data=[Tr_data bit_data*ones(1,time_unit/time_cyc)]; %ceil
end;
data=Tr_data;
for i=1:1:length(data)
    Md_f=data(i);
    Md_m=Modulated(Md_f,phcode,fd,i);
    MBuffer[MBuffer Md_m];
end;
MBuffer;
%Phase_signal=0;
t=[0:kk-1]/fs;
Phase_signal=2*pi*(F_if+fd)*t+ph;
Carr=cos(Phase_signal);
S_code=MBuffer.*Carr;
% S_Code=MBuffer;
if AWGNflag==1
    RxSignal=AWGN(S_Code,SNR);
else
    RxSignal=S_Code;
end;
Signal_Source=RxSignal;

