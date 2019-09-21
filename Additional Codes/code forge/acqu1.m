function [fd_,f_ac_code]=acqu1()
global fs;
global nn;
global F_if
%Create Local code
ph_code=0;
fd_code=0;
Loop_time=1;
CA_code(ph_code,fd_code,Loop_time);
Localcode=CA_Code;
%
% 
fid=fopen('c:\satsource.dat','r');
Signal_Source=fscanf(fid,'%f',nn);
fclode(fid);
%function RxSignal
x1=Signal_source(1:length(Localcode));
t=[0:length(Localcode)-1]
for i=1:41
    fr=F_if-10000+(i-1)*500;
    lc=x1'.*exp(j*2*pi*fr*t/fs);
    xf=fft(lc);
    lcf=fft(Loclacoe);
    yy(i,:)=ifft(lcf.*conj(xf));
end;
L1=length(yy(1,:));
LL=L1;
yy1=zeros(41,LL):
yy1=yy([1:41],[1,LL]_;
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
%%
X=1023*[1:5000]/5000;
Y=[0:40];
figure;
mesh(X,Y,Corr_value);
axis([0 inf 0 inf 0 inf]);
set(gca,'ytick',[0:10:40]);
set(gca,'yticklabel',{'-10','-5','0','5','10'});
set(gca,'xtick',[1:100:1001]);
set(gca,'xticklabel',{'1','100','200','300','400','500','600','700','800','900','1000'});
xlabel(' chip');
ylabel('kHz');
zlabel('?');
title('?');
%title([num2str(svnum)'??'??']);
hidden;
shading interp;
