%% C/A sequence generation
close all;clear all;clc;
shift_G1_reg=ones(1,10);
shift_G2_reg=ones(1,10);
G1=zeros(1,1023);
G2=zeros(1,1023);
L1_CA_code=zeros(1,1023);

for k1=1:1:1023
    G1(k1)=shift_G1_reg(10);
    G2(k1)=mod(shift_G2_reg(2)+shift_G2_reg(6),2);
    L1_CA_code(k1)=mod(G1(k1)+G2(k1),2);
    feedback_G1=mod(shift_G1_reg(3)+shift_G1_reg(10),2);
    feedback_G2=mod(shift_G2_reg(2)+shift_G2_reg(3)+shift_G2_reg(6)+shift_G2_reg(8)+shift_G2_reg(9)+shift_G2_reg(10),2);
    for k2=10:-1:2
        shift_G1_reg(k2)=shift_G1_reg(k2-1);
        shift_G2_reg(k2)=shift_G2_reg(k2-1);
    end;
    shift_G1_reg(1)=feedback_G1;
    shift_G2_reg(1)=feedback_G2;
end;
L1_CA_code=(L1_CA_code-0.5)*2;
k1=1:1:1023;
%L1_CA_code is an (1x1023) array with +1 and -1 Values.
figure,subplot(1,1,1),plot(k1,L1_CA_code),title('C/A 1023chip sequence');
%%GPS_sig_gen.m
L1_CA_code_half=zeros(1,length(L1_CA_code)*2);
for kk1=1:length(L1_CA_code)
    L1_CA_code_half((2*kk1-1):(2*kk1))=L1_CA_code(kk1)*ones(1,2);
end;
for kk2 =1:length(L1_CA_code)
    L1_CA_code_samp((4*kk2-3):(4*kk2))=L1_CA_code(kk2)*ones(1,4);
end;
Fs=4.092e6;
Fc=1.023e6;
Fd=2.5e3;
Cr=1.023e6;
Sn=Fs/Cr;
C_NO=70;
SNR=C_NO-10*log10(Fs);
t=1/Fs:1/Fs:(1023*4)/Fs;
cos_data=cos(2*pi*Fc*t);
sig_pure=L1_CA_code_samp.*cos_data;
signal=awgn(sig_pure,SNR);
k=1/Fs:1/Fs:(1023*4)/Fs;
figure,subplot(3,1,1),plot(k,L1_CA_code_samp),title('L5CA code samp');
subplot(3,1,2),plot(k,cos_data),title('cos Carrier');
subplot(3,1,3),plot(k,signal),title('Modulated BPSK signal');
figure,plot(k,abs(fftshift(fft(signal)))),title('Signal FFT Search');
%%GPS_PNcode_acquisition.m
fdop=linspace(0,5e3,100);
L1_CA_code_local=[L1_CA_code_samp(4042:4092),L1_CA_code_samp(1:4041)]
peak_out=zeros(100,100);
for dd1=1:100;
    t=1/Fs:1/Fs:4092/Fs;
    I_cos=cos(2*pi*(Fc+fdop(dd1))*t);
    cos_data=cos(2*pi*(Fc+fdop(dd1))*t);
    deal_fd_data=signal.*I_cos;
    for dd2=1:100
        L1_CA_code_local_kk=[L1_CA_code_local(dd2:4092),L1_CA_code_local(1:(dd2-1))];
        deal_xor_data=L1_CA_code_local_kk.*deal_fd_data;
        peak_out(dd1,dd2)=sum(deal_xor_data);
    end;
end;
mesh(peak_out);
    