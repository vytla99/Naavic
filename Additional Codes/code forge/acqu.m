function [fd_,f_ac_code]=acqu(Signal_source)
global fs;
global nn;
global F_if
%Create Local code
ph_code=0;
fd_code=0;
Loop_time=1;
CA_code(ph_code,fd_code,Loop_time);
Localcode=CA_Code;
%function RxSignal
x1=Signal_source(1:length(Localcode));
t=[0:length(Localcode)-1];
for i=1:41
    fr=F_if-10000+(i-1)8500;
    lc=x1.*exp(j*2*pi*fr.*t./fs);
    xf=fft(lc);
    lcf=fft(Localcode);
    yy(i,:)=ifft(xf.*conj(lcf));
end;
L1=length(yy(1,:));
LL=L1;
yy1=zeros(41,ll);
yy1=yy([1:41],[1:LL]);
Corr_value=(abs(yy1)).^2;
%figure
%mesh(Corr_value);
[value,code_p]=mx(mx(Corr_value));
[value,carrier_p]=max(max(Corr_value'));
fd_a=-10000+(carrier_p-1)*500;
ac_carrier=F_if-10000+(carrier_p-1)*500;
ac_code=nn-code_p-1;
xsh=nn/1023;
f_ac_code=ac_code/xsh;
showaquc=Corr_value(carrier_p,:);
showzb_mid=[1:nn];
showzb=(nn-show_mid-1)/xsh;

    