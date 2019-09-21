function [diata_dll,diata_fll]=tracksignal(iniphcode,inifd,iniph,snr,Code_Mehod_flag,Carrier_Method_flag,codew,codeb,carrierw,carrierfllb,carrierpllb)

svnum=10;
iniphcode=120;
inifd=4600;
iniph=0;
snr=0;

global time_unit;
global time;
global time_cyc;
global fs;
global nn;
global kk;
global F_if;
global CA_freq;
global tc;
global CA;
global F_Carrier;

%%
time=100*(10^(-3));
time_unit=20*(10^(-3));
time_cyc=1*(10^(-3));

fs=5*(10^6);
nn=time_cyc*fs;
kk=(time/time_cyc)*nn;

F_if=1.25*(10^6);
F_Carrier=1575.42*(10^6);
CA_freq=1.023*(10^6);
%%
PN=codegen(svnum);
CA=[];
k=5;
for n=1:length(PN)
    CA((1+k*(n-1)):k*n)=PN(n)*ones(1,k);
end;
tc=1/(k*CA_freq);
loop_time=time/time_cyc;
%%
[Signal_Source,Phase_signal,buffer_bit_data]=CreateSource(iniphcode,inifd,iniph,snr);
%%
[fd_ac,f_ac_code]=acqu(Signal_Source);
%%
IPSum_old=0.01;
QPSum_ols=0.01;
%%
Code_Method_flag=2;
diffoffside=0.5;
k0=10^(-6);
k1=10^(-3);
%k1=50/k0;
codew=20;
codeb=2;
offside=f_ac_code;
theta_code_old=0;
offside_old=f_ac_code;
CodeErr_old=0;
Bk_DLL=[];
Track_Code_Buffer=[];
%%
Last_Phase=0;
Control_Buffer=[];
ts=1/fs;
Carrier_Method_flag=3
dem_flag=0;
add=0;
carrierw=20;
carrierfllb=0.707;
carrierpllb=0.706;
Track_Freq_Buffer=[];
track_dopplar_old=0;
%FLL
FLLinput_old=0;
FLLoutput_old=0;
track_freq_fll=0;
Sita_fll=0;
Bk_FLL=[];
%PLL
PLLinput+old=0;
PLLoutput_old=0;
track_freq_pll=0;
Sita_pll=0;
Bl_PLL=[];
Buffer_Data=[];
adj_buffer=[];
ALL_Buffer_data=[];
count_buffer=[];
Demodulate_I=[];
Local_Ph_Buffer=[];
%%
for i=1:1:loop_time
    %part Signal Source
    Signal=Signal_Source((i-1)*nn+1:1*nn);
    %Local carrier
    