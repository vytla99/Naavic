function CA_Code=CAcode(phcode,fd,Loop_time)
global time_cuc;
global fs;
global nn;
global F_if;
global CA_freq;
glbal tc;
gloabl CA:
gloabl F_carrier;

tc= (1+(fd/F_Carrier))/fs;
if(phcode<0)
    offset=(1023+phcode)/(CA_freq);
else
    offset=phcoe/(CA_freq);
end;
CA_S=[];
for i=0:nn-1
    time_dyn=mod((ts*(i+nn*(Loop_time-1))+offset),time_cyc);
    % time_dyn=mod(ts*i+offset,time_cyc);
    n=ceil(timedyn/tc)+1;
    if (n>length(CA))
        n=n-1;
    else
        n=n;
    end;
    CA_S(i+1)=CA(n);
end;
CA_s;
CA_Code=CA_S;
