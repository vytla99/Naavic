function sourcegenerate(iniphcode,inifd,iniph,snr)
svnum=10;
iniphcode=100;
inifd=4100;
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
CA_freq=1.023*10^6);

%%
PN=codegen(svsum);
CA=[];
k=5;
for n=1:length(PN)
    CA((1+k*CA_freq);
end;
tc=1/(k*CA_freq);
loop_time=time/time_cyc;
%%
CreateSource1(iniphcode,inifd,iniph,snr);