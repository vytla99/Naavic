function [CA_array] = CA(Satellite_number)
%% C/A sequence generation
%Input= CA([Satellite PRN ID])
%Output= CA_array=array(1,1023)
%phase assignments same as NAVSTAR.
phase_assignment=[2,6;3,7;4,8;5,9;1,9;2,10;1,8;2,9;3,10;
    2,3;3,4;5,6;6,7;7,10];
n=phase_assignment(Satellite_number,1);
m=phase_assignment(Satellite_number,2);
%Creation of two Arrays g1 and g2. g1 and g2 act as shift registers.
g1=ones(1,10);
g2=g1;i=1;time=0;
%g2 initial values according to IRNSS SPS
initial_values=[1,1,1,0,1,0,0,1,1,1;0,0,0,0,1,0,0,1,1,0;1,0,0,0,1,1,0,1,0,0;
0,1,0,1,1,1,0,0,1,0;1,1,1,0,1,1,0,0,0,0;0,0,0,1,1,0,1,0,1,1;
0,0,0,0,0,1,0,1,0,0;0,1,0,0,1,1,0,0,0,0;0,0,1,0,0,1,1,0,0,0;
1,1,0,1,1,0,0,1,0,0;0,0,0,1,0,0,1,1,0,0;1,1,0,1,1,1,1,1,0,0;
1,0,1,1,0,1,0,0,1,0;0,1,1,1,1,0,1,0,1,0];
g2(1,:)=initial_values(Satellite_number,:);
CA_array=zeros(1,1023);CA_arrayx=zeros(1,1023);
while i<1024 
    time=time+(1/(1.023*(10^3)));
%PRN sequence requires Shifting and MLS output
% Register g1
output1=g1(1,10);
g1(1,2:10)=g1(1,1:9);
g1(1,1)=mod((g1(1,3)+g1(1,10)),2);
%Register g2
output2=mod((g2(1,n)+g2(1,m)),2);
g2(1,2:10)=g2(1,1:9);
g2(1,1)=mod((g2(1,2)+g2(1,3)+g2(1,6)+g2(1,8)+g2(1,9)+g1(1,10)),2);
%CA code output
output=mod((output1+output2),2);
CA_array(1,i)=output;
CA_arrayx(1,i)=time;
i=i+1;
end;
for i=1:1023
    if CA_array(1,i)==0;
        CA_array(1,i)=-1;
    end;
end;
end

