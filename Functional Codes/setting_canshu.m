%function initinal 
%input: none
%output: setting
%function: set the runing condition
%including middle_freq,dup_freq,sample_freq,code_freq
%the bandwidth of PLL , FLL, DDLL 
%cofe_from_FLL_2_DDLL;
%the Nco_Length;
function settings = setting_canshu()
settings.middle_freq = 1.17645e6
settings.dup_freq = 80;
settings.sample_freq = 10e+6;
settings.code_freq = 1.023e+6;
settings.code_length = 1023;
settings.snr = -20;
settings.FLL_flag = 1;
settings.PLL_flag = 0;
settings.FLL_bandwidth = 4.2;%FLL
settings.PLL_bandwidth = 10;%PLL
settings.DDLL_bandwidth = 2;
settings.cofe_FLL_auxi_DDLL  = 1/763;
settings.nco_Length = 32;
settings.noise_std = 1;
% setting.length = (1:10000);
% setting.length_no = 10000;
settings.sample_t = 1/settings.sample_freq;
settings.K = 1;
settings.transfer_coef = (2^settings.nco_Length)/settings.sample_freq;
settings.middle_freq_nco = settings.middle_freq*settings.transfer_coef;
settings.Ncoh = (settings.sample_freq / settings.code_freq)*settings.code_length;
settings.Tcoh = settings.Ncoh *settings.sample_t;
settings.dot_length = [1:settings.Ncoh];
settings.code_word = settings.code_freq * settings.transfer_coef;
settings.fd_code = settings.dup_freq*(1/763)*settings.transfer_coef;
%setting.fd_code = setting.dup_freq*settings.cofe_FLL_auxi_DDLL*setting.transfer_coef;
settings.e_code_original_phase = (2^settings.nco_Length)/2;
settings.modulate_code_bias_phsae = (2^settings.nco_Length)/8;
settings.signal_phase = 0;
settings.local_phase = 0;