function loop_canshu = loop_canshu_calculate (settings)
WnF = 1.89 * settings.FLL_bandwidth;
WnP = 1.27 * settings.PLL_bandwidth;
WnD = 1.89 * settings.DDLL_bandwidth;

Tcoh = settings.Tcoh;
K = settings.K;
carrier_k=0.25;
loop_canshu.cofeone_FLL = (sqrt(2)*WnF*Tcoh+WnF^2*Tcoh^2)/carrier_k;
loop_canshu.cofetwo_FLL = -(sqrt(2)*WnF*Tcoh)/carrier_k;
loop_canshu.cofeone_PLL = (2*WnP+2*WnP^2*Tcoh+WnP^3*Tcoh^2)/carrier_k;
loop_canshu.cofetwo_PLL = -(4*WnP+2*WnP^2*Tcoh)/carrier_k;
loop_canshu.cofethree_PLL = 2*WnP/carrier_k;
loop_canshu.cofeone_DDLL = (sqrt(2)*WnD+WnD^2*Tcoh)/K;
loop_canshu.cofetwo_DDLL = -sqrt(2)*WnD/K;