function Md_m=Modulate(Md_f,phcode,fd,i)
global nn;
global fs;
global F_if;
phcode=phcode;
fd=fd;
Loop_time=1;
CA_Code=CAcode(phcode,fd,Loop_time);
%t=[(i-1)**nn:i*nn-1]/fs;
%Phase_signal=2*pi*(F_if+fd)*;
%Carr=cos(phase_signal);
CA_Mapping = CA_Code;
if Md_f==1
    Md_m=CA_Mapping;
else
    Md_m=-CA_Mapping;
end;
