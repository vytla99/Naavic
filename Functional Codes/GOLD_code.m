function CB1 = GOLD_code(Satellite_PRN_ID)  
G1=ones(1,10);
G2=G1;
%G2 initial values according to IRNSS SPS
initial_values=[1,1,1,0,1,0,0,1,1,1;0,0,0,0,1,0,0,1,1,0;1,0,0,0,1,1,0,1,0,0;
0,1,0,1,1,1,0,0,1,0;1,1,1,0,1,1,0,0,0,0;0,0,0,1,1,0,1,0,1,1;
0,0,0,0,0,1,0,1,0,0;0,1,0,0,1,1,0,0,0,0;0,0,1,0,0,1,1,0,0,0;
1,1,0,1,1,0,0,1,0,0;0,0,0,1,0,0,1,1,0,0;1,1,0,1,1,1,1,1,0,0;
1,0,1,1,0,1,0,0,1,0;0,1,1,1,1,0,1,0,1,0];
phase_assignment=[2,6;3,7;4,8;5,9;1,9;2,10;1,8;2,9;3,10;
    2,3;3,4;5,6;6,7;7,10];
G2(1,:)=initial_values(Satellite_PRN_ID,:);
CA_array=zeros(1,1023);
n=phase_assignment(Satellite_PRN_ID,1);
m=phase_assignment(Satellite_PRN_ID,2);
for i=1:1023
%PRN sequence requires Shifting and MLS output
% Register g1
output1=G1(1,10);
G1(1,2:10)=G1(1,1:9);
G1(1,1)=mod((G1(1,3)+G1(1,10)),2);
%Register g2
output2=mod((G2(1,n)+G2(1,m)),2);
G2(1,2:10)=G2(1,1:9);
G2(1,1)=mod((G2(1,2)+G2(1,3)+G2(1,6)+G2(1,8)+G2(1,9)+G1(1,10)),2);
%CA code output
output=mod((output1+output2),2);
CA_array(1,i)=output;
end
c_out=CA_array;
 CB1=(c_out-0.5)*2;