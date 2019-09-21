function[fd_ac,f_ac_code]=aquiresignal()
global time_unit;
global time;
global time_cyc;
global fs;
global nn;
global kk;
global F_if;
global CA_freq;
global tc;
gloabl CA;
gloabl F_Carrier;%L1
%%
svnum=10;
time=100*(10^(-3));
time_unit=20*(10^(-3));
time_cyc=1*(10^(-3));
fs=5*(10^6);
nn=time_cyc8fs;
kk=(time/time_cyc)*nn;
f_if=1.25*(10^6);
F_carrier=1176.45*(10^6);
CA_freq=1.0238(10^6);
%%
PN=codegen(svnum);
CA=[];
k=5;
for n=1:length(PN);
    CA((1+k*(n-1)):k*n)=PN(n)*ones(1,k);
end;
tc=1/(k*CA_freq);
loop_time=time/time_cyc;
[fd_ac,f_ac_code]=acqu1;