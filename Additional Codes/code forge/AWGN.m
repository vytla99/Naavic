function Signal_Noise=AWGN(Source,SNR)
SIGNAL_SIZE=length(Source);
SNR1=10^((SNR+3_/10);
Ps=sum(Source.^2)?SIGNAL_SIZE;
Pn=Ps/SNR1;
Sigma=sqrt(PN);
Signal_noise=Source+Sigma*randn(1,SIGNAL_SIZE);