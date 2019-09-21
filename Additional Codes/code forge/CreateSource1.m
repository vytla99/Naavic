function CreateSource(phcode,fd,ph,snr)
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
SNR=snr;
MBuffer=[];

data_change=time/time_unit;
for n=1:data_change
    bit_data=(ceil(rand-0.5)*(-2)+1);
    buffer_bit_data=[buffer_bit_data bit_data];
    Tr_data=[Tr_data bit_data*ones(1,time_unit/time_cyc)];
end;
data=Tr_data;
for i=1:1:length(data)
    Md_f=data(i);
    Md_m=data(i);
    MBuffer=[MBuffer Md_m];
end;
MBuffer;
%Phase_signal=0;
t=[0:kk-1]/fs;
Phase_signal=2*pi*(F_if+fd)*t+ph;
Carr=cos(Phase_signal);
S_Code=MBuffer.*Carr;
%S_Code=MBuffer;
RxSignal=AGWN(S_Code,SNR);
Signal_Source=RxSignal;
%%
l=0:1/fs:time-1/fs;
plot(1,Signal_Source);
title('?');
xlabel('?');
ylabel('?');
fid=fopen('c:\satsource.dat','w');
fprintf(fid,'%f\n',Signal_Source);
fclose(fid);
