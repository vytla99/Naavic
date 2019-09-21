function Buffer_Date=framecheck2(in_data,count_buffer)
looptime=length(in_data);
DM_I_old=0;
BinFlag=0;
sum_data=0;
sum_flag=0;
Buffer_Data=[];
for k=1:1:looptime
    IPSum=in_data(k);
    DM_I=sign(real(IPSum));
    diff=DM_I*DM_I_old;
    DM_I_old=DM_I;
    position_judge=mod(count_buffer(k),20);
    if ((diff==-1)&&(position_judge==1))
        BinFlag=1;
    end;
    if BinFLag==1
        dem_data=DM_I;
        sum_data=sum_data+dem_data;
        sum_flag=sum_flag+1;
        if sum_flag>=20;
            sum_flag=0;
            out_sum_data=sum_data;
            sum_data=0;
            if abs(out_sum_data)==10
                if abs(out_sum_data)>=10
                    out_data=sign(out_sum_data);
                else
                    out_data=0;
                end;
                Buffer_Data=[Buffer_Data out_data];
            end;
        end;
    end;
    