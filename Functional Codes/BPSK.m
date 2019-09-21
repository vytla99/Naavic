%%BPSK Modulation
%chip rate= 1.023MHz.
function signal=BPSK(Satellite_PRN_ID,Power)
chip_rate=1.023*10^6;
%carrier Frequency=1176.45MHz
%For Computational Practicality, Carrier Frequency has been reduced to
%1.17645MHz.
fc=1.17645*10^6;
%Sampling Rate=100*Chip rate.
fs=100.*chip_rate;
CA_array=CA(Satellite_PRN_ID);CA_array(1,1024)=CA_array(1,1023);
%No. of Samples for 1023 Chips= 1023*100
BPSK_array=zeros(102300,1);
for i=1:1023
    for c=1:100
        BPSK_array(i*c,1)=CA_array(1,i);
    end;
end;
c=1;signal=zeros(102300,1);
for t=0:1/fc:10^-3
    signal(c,1)=BPSK_array(c,1)*sqrt(2*Power)*cos(2*3.14*fc*t);
    c=c+1;
end;
plot(t,signal);
end