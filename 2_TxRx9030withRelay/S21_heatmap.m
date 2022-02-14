clear all, clc, close all
% Asymmetric System
OD = 30:10:200; % mm
d2i = 5:5:145; % mm
%% 09/29/2020
S21_OD30_measurement = [0.0009 0.001 0.0014 0.0021 0.0032 0.0047 0.007 0.01 0.015 0.02 0.027 0.037 0.049 0.063 0.08 0.099 0.119 0.139 0.159 0.176 0.183 0.177 0.154 0.122 0.088 0.056 0.034 0.019 0.0095];
S21_OD40_measurement = [0.0007 0.001 0.0016 0.0026 0.0039 0.006 0.0087 0.013 0.018 0.025 0.036 0.049 0.066 0.091 0.119 0.157 0.198 0.245 0.287 0.308 0.301 0.264 0.209 0.145 0.099 0.063 0.038 0.022 0.012];
S21_OD50_measurement = [0.0006 0.001 0.002 0.0033 0.005 0.0076 0.011 0.016 0.021 0.029 0.041 0.056 0.078 0.106 0.14 0.186 0.235 0.289 0.339 0.35 0.336 0.3 0.235 0.171 0.117 0.075 0.052 0.03 0.018];
S21_OD60_measurement = [0.0003 0.0009 0.0018 0.003 0.0042 0.0073 0.011 0.016 0.021 0.03 0.042 0.06 0.083 0.107 0.142 0.186 0.239 0.293 0.343 0.364 0.355 0.314 0.247 0.18 0.127 0.086 0.056 0.037 0.023];
S21_OD70_measurement = [0.0003 0.0008 0.0018 0.0033 0.0055 0.0082 0.012 0.017 0.024 0.033 0.046 0.064 0.084 0.113 0.148 0.193 0.245 0.299 0.345 0.368 0.363 0.324 0.264 0.195 0.146 0.102 0.072 0.049 0.035];
S21_OD80_measurement = [0.0005 0.0010 0.0022 0.0040 0.0061 0.0090 0.013 0.018 0.026 0.035 0.048 0.066 0.086 0.116 0.149 0.192 0.242 0.295 0.342 0.369 0.370 0.359 0.318 0.259 0.201 0.151 0.112 0.083 0.059];
S21_OD90_measurement = [0.0006 0.0011 0.0027 0.0046 0.0069 0.01 0.014 0.02 0.028 0.037 0.05 0.068 0.089 0.119 0.151 0.192 0.241 0.29 0.338 0.367 0.372 0.352 0.305 0.248 0.195 0.156 0.122 0.094 0.075];
S21_OD100_measurement = [0.0002 0.0015 0.0029 0.0045 0.0071 0.01 0.014 0.019 0.026 0.035 0.047 0.063 0.084 0.108 0.138 0.176 0.217 0.263 0.307 0.348 0.368 0.367 0.346 0.324 0.254 0.21 0.16 0.139 0.113];
S21_OD110_measurement = [0.0014 0.0025 0.004 0.006 0.0085 0.012 0.016 0.022 0.029 0.039 0.05 0.068 0.085 0.11 0.139 0.174 0.212 0.255 0.301 0.338 0.36 0.366 0.361 0.345 0.313 0.245 0.202 0.171 0.142];
S21_OD120_measurement = [0.0029 0.0037 0.0051 0.0071 0.0095 0.013 0.016 0.023 0.029 0.038 0.049 0.063 0.082 0.105 0.132 0.166 0.206 0.247 0.29 0.329 0.361 0.376 0.374 0.356 0.32 0.288 0.252 0.217 0.188];
S21_OD130_measurement = [0.0047 0.0059 0.0074 0.0095 0.012 0.016 0.021 0.026 0.034 0.044 0.056 0.072 0.09 0.113 0.142 0.174 0.213 0.253 0.293 0.33 0.357 0.374 0.374 0.36 0.337 0.308 0.276 0.246 0.218];
S21_OD140_measurement = [0.0064 0.0076 0.0089 0.011 0.014 0.017 0.022 0.027 0.034 0.043 0.055 0.068 0.086 0.105 0.132 0.162 0.195 0.233 0.277 0.308 0.339 0.361 0.372 0.371 0.358 0.338 0.314 0.288 0.262];
S21_OD150_measurement = [0.0085 0.0096 0.011 0.013 0.016 0.019 0.024 0.03 0.036 0.045 0.056 0.07 0.085 0.106 0.129 0.156 0.187 0.223 0.257 0.289 0.321 0.346 0.361 0.367 0.367 0.353 0.337 0.317 0.295];
S21_OD160_measurement = [0.0089 0.01 0.012 0.014 0.017 0.021 0.025 0.032 0.04 0.049 0.06 0.075 0.092 0.113 0.137 0.165 0.197 0.232 0.266 0.3 0.325 0.345 0.355 0.358 0.36 0.350 0.335 0.320 0.303];
S21_OD170_measurement = [0.015 0.016 0.018 0.021 0.024 0.028 0.034 0.04 0.048 0.058 0.069 0.085 0.102 0.121 0.141 0.167 0.191 0.219 0.248 0.273 0.296 0.316 0.329 0.337 0.34 0.337 0.331 0.323 0.314];
S21_OD180_measurement = [0.018 0.02 0.022 0.025 0.029 0.033 0.039 0.045 0.053 0.063 0.075 0.089 0.104 0.124 0.143 0.165 0.189 0.213 0.238 0.26 0.279 0.295 0.307 0.315 0.319 0.319 0.316 0.311 0.305];
S21_OD190_measurement = [0.021 0.024 0.026 0.029 0.032 0.037 0.042 0.048 0.056 0.066 0.077 0.09 0.105 0.123 0.14 0.159 0.182 0.204 0.224 0.242 0.261 0.275 0.286 0.294 0.299 0.3 0.3 0.297 0.293];
S21_OD200_measurement = [0.027 0.03 0.033 0.035 0.04 0.045 0.051 0.059 0.067 0.075 0.088 0.101 0.116 0.132 0.15 0.168 0.187 0.204 0.222 0.238 0.252 0.262 0.272 0.277 0.281 0.281 0.281 0.279 0.279];
%% 10/22/2020
S21_OD30_measurement = [0.0009 0.0013 0.0019 0.0029 0.0043 0.0064 0.0094 0.0137 0.0187 0.0257 0.0350 0.0477 0.0620 0.0803 0.1000 0.1217 0.1460 0.1693 0.1870 0.1950 0.1870 0.1630 0.1253 0.0860 0.0567 0.0330 0.0187 0.0094 0.0056];
S21_OD40_measurement = [0.0008 0.0011 0.0017 0.0027 0.0042 0.0058 0.0092 0.0127 0.0187 0.0263 0.0367 0.0487 0.0713 0.0960 0.1280 0.1673 0.2133 0.2637 0.3013 0.3100 0.2850 0.2333 0.1713 0.1143 0.0733 0.0457 0.0260 0.0137 0.0071];
S21_OD50_measurement = [0.0006 0.0010 0.0016 0.0028 0.0044 0.0068 0.0100 0.0140 0.0203 0.0287 0.0397 0.0543 0.0750 0.1007 0.1343 0.1783 0.2243 0.2763 0.3130 0.3197 0.2950 0.2407 0.1807 0.1243 0.0820 0.0503 0.0300 0.0193 0.0113];
S21_OD60_measurement = [0.0004 0.0009 0.0017 0.0030 0.0046 0.0070 0.0100 0.0150 0.0213 0.0290 0.0403 0.0553 0.0757 0.1033 0.1373 0.1810 0.2307 0.2840 0.3213 0.3357 0.3150 0.2600 0.1997 0.1443 0.0983 0.0627 0.0413 0.0263 0.0190];
S21_OD70_measurement = [0.0001 0.0007 0.0016 0.0030 0.0048 0.0071 0.0103 0.0150 0.0213 0.0293 0.0413 0.0550 0.0773 0.1043 0.1380 0.1787 0.2270 0.2793 0.3203 0.3430 0.3317 0.2907 0.2317 0.1733 0.1247 0.0853 0.0593 0.0417 0.0317];
S21_OD80_measurement = [0.0003 0.0005 0.0016 0.0030 0.0051 0.0077 0.0110 0.0157 0.0220 0.0300 0.0417 0.0570 0.0763 0.1027 0.1357 0.1757 0.2230 0.2740 0.3207 0.3483 0.3490 0.3190 0.2697 0.2123 0.1577 0.1170 0.0863 0.0637 0.0517];
S21_OD90_measurement = [0.0004 0.0008 0.0021 0.0039 0.0060 0.0091 0.0130 0.0180 0.0253 0.0347 0.0467 0.0627 0.0837 0.1107 0.1450 0.1867 0.2357 0.2870 0.3363 0.3660 0.3747 0.3533 0.3117 0.2560 0.2027 0.1570 0.1227 0.0957 0.0800];
S21_OD100_measurement = [0.0003 0.0015 0.0030 0.0049 0.0075 0.0107 0.0147 0.0207 0.0280 0.0380 0.0470 0.0683 0.0890 0.1167 0.1500 0.1913 0.2363 0.2867 0.3323 0.3657 0.3813 0.3733 0.3430 0.2967 0.2477 0.2013 0.1627 0.1330 0.1130];
S21_OD110_measurement = [0.0014 0.0024 0.0039 0.0059 0.0083 0.0117 0.0157 0.0213 0.0293 0.0387 0.0507 0.0670 0.0880 0.1130 0.1453 0.1817 0.2257 0.2713 0.3160 0.3533 0.3747 0.3773 0.3597 0.3273 0.2873 0.2437 0.2050 0.1747 0.1517];
S21_OD120_measurement = [0.0030 0.0041 0.0055 0.0077 0.0104 0.0140 0.0183 0.0240 0.0313 0.0413 0.0530 0.0690 0.0897 0.1150 0.1450 0.1807 0.2230 0.2683 0.3163 0.3520 0.3757 0.3820 0.3710 0.3447 0.3090 0.2733 0.2393 0.2073 0.1840];
S21_OD130_measurement = [0.0048 0.0056 0.0070 0.0095 0.0120 0.0160 0.0205 0.0260 0.0340 0.0445 0.0560 0.0715 0.0920 0.1165 0.1455 0.1800 0.2170 0.2625 0.3045 0.3405 0.3680 0.3810 0.3795 0.3635 0.3360 0.3075 0.2760 0.2475 0.2255];
S21_OD140_measurement = [0.0067 0.0075 0.0090 0.0110 0.0135 0.0170 0.0215 0.0275 0.0345 0.0445 0.0570 0.0715 0.0895 0.1130 0.1375 0.1690 0.2065 0.2440 0.2840 0.3210 0.3520 0.3710 0.3800 0.3760 0.3595 0.3380 0.3145 0.2900 0.2680];
S21_OD150_measurement = [0.0090 0.0100 0.0120 0.0140 0.0163 0.0203 0.0253 0.0313 0.0390 0.0480 0.0597 0.0743 0.0920 0.1130 0.1377 0.1670 0.2003 0.2333 0.2717 0.3057 0.3360 0.3573 0.3710 0.3750 0.3693 0.3563 0.3387 0.3190 0.3007];
S21_OD160_measurement = [0.0120 0.0130 0.0150 0.0180 0.0210 0.0250 0.0300 0.0370 0.0450 0.0550 0.0670 0.0820 0.0990 0.1210 0.1445 0.1730 0.2040 0.2370 0.2685 0.2975 0.3235 0.3435 0.3565 0.3610 0.3600 0.3525 0.3410 0.3290 0.3180];
S21_OD170_measurement = [0.0150 0.0170 0.0190 0.0220 0.0250 0.0300 0.0350 0.0420 0.0500 0.0610 0.0720 0.0870 0.1050 0.1250 0.1470 0.1740 0.2020 0.2350 0.2610 0.2880 0.3110 0.3290 0.3420 0.3490 0.3500 0.3470 0.3400 0.3330 0.3290];
S21_OD180_measurement = [0.0190 0.0210 0.0230 0.0270 0.0310 0.0360 0.0410 0.0480 0.0580 0.0680 0.0800 0.0960 0.1130 0.1330 0.1540 0.1780 0.2040 0.2290 0.2540 0.2760 0.2970 0.3110 0.3230 0.3290 0.3320 0.3310 0.3270 0.3230 0.3200];
S21_OD190_measurement = [0.0230 0.0250 0.0280 0.0310 0.0350 0.0390 0.0460 0.0530 0.0620 0.0730 0.0850 0.1000 0.1150 0.1340 0.1540 0.1770 0.1990 0.2210 0.2440 0.2630 0.2830 0.2950 0.3060 0.3140 0.3170 0.3170 0.3160 0.3140 0.3140];
S21_OD200_measurement = [0.0280 0.0310 0.0340 0.0370 0.0410 0.0460 0.0530 0.0600 0.0700 0.0800 0.0920 0.1070 0.1230 0.1400 0.1570 0.1770 0.1990 0.2180 0.2360 0.2520 0.2670 0.2780 0.2870 0.2920 0.2950 0.2950 0.2950 0.2940 0.2950];
%% 02/22/2021
S21_OD30_measurement = [-52.73055	-50.65899	-47.57588	-44.31915	-40.81668	-37.58543	-34.26168	-31.23347	-28.23397	-25.51148	-22.89299	-20.68415	-18.55062	-16.85908	-15.3689	-14.1936	-13.20433	-12.46181	-11.82297	-11.49207	-11.65325	-12.64573	-15.12247	-18.42922	-23.31531	-28.13337	-34.47151	-40.81796	-48.97337];
S21_OD40_measurement = [-58.27877	-55.21762	-51.32751	-47.57244	-43.76368	-40.37957	-37.00897	-33.97662	-30.81318	-28.06323	-25.06134	-22.61786	-19.75252	-17.58639	-15.12881	-13.31811	-11.49928	-10.30174	-9.37825	-9.254091	-10.15526	-11.97166	-15.09574	-18.52568	-23.1093	-27.37629	-33.01537	-38.36832	-45.43368];
S21_OD50_measurement = [-61.10547	-56.36302	-51.71293	-47.54465	-43.67957	-40.29124	-36.85408	-33.85591	-30.77841	-27.92377	-25.0515	-22.47611	-19.64086	-17.35539	-14.74811	-12.75524	-10.75704	-9.477741	-8.574688	-8.539549	-9.607136	-11.55325	-14.69051	-18.07471	-22.18558	-26.15427	-30.93183	-35.53442	-37.97991];
S21_OD60_measurement = [-67.51068	-59.50836	-53.51307	-49.03892	-44.74863	-41.48487	-37.84478	-35.04912	-31.68978	-29.07482	-25.96788	-23.47218	-20.5598	-18.22358	-15.60096	-13.54975	-11.40282	-9.921047	-8.622828	-8.166155	-8.545338	-9.885632	-12.32231	-15.16739	-18.73509	-22.18291	-26.18809	-29.84531	-33.59459];
S21_OD70_measurement = [-70.9205	-58.49043	-52.01771	-47.39244	-43.34003	-39.94164	-36.61142	-33.62555	-30.64869	-27.86815	-25.01444	-22.47027	-19.79657	-17.42838	-14.95352	-12.90976	-10.90627	-9.55312	-8.400969	-8.0352	-8.500919	-9.760555	-12.08617	-14.56943	-17.90324	-20.91974	-24.32672	-27.19219	-29.83098];
S21_OD80_measurement = [-72.58652	-57.60386	-50.98443	-46.37219	-42.41525	-39.12379	-35.86361	-33.00853	-30.03929	-27.4305	-24.62189	-22.21006	-19.51872	-17.34781	-14.84067	-12.91454	-10.94573	-9.587477	-8.424715	-7.9838	-8.268173	-9.228186	-11.21008	-13.34907	-16.24164	-18.6734	-21.59174	-23.78613	-25.73789];
S21_OD90_measurement = [-74.78374	-57.32413	-50.50686	-46.1609	-42.20326	-39.0046	-35.88079	-33.11918	-30.23547	-27.66057	-24.95376	-22.60688	-19.98724	-17.79631	-15.42825	-13.52352	-11.5323	-10.12283	-8.809088	-8.133497	-7.967539	-8.448004	-9.753572	-11.38417	-13.73817	-15.77835	-18.2143	-20.0493	-21.86542];
S21_OD100_measurement = [-62.93739	-54.36496	-48.64664	-44.87991	-41.14473	-38.39079	-35.13305	-32.75943	-29.75212	-27.48167	-24.72767	-22.57063	-19.94273	-17.99891	-15.60114	-13.81717	-11.8204	-10.49035	-9.112801	-8.361971	-7.955964	-8.113379	-8.955891	-10.10432	-11.9746	-13.57253	-15.63274	-17.22462	-18.72646];
S21_OD110_measurement = [-55.3155	-50.80231	-46.65727	-43.49235	-40.17581	-37.52999	-34.5937	-32.11484	-29.50136	-27.17391	-24.71605	-22.44914	-20.14934	-18.0454	-15.91735	-14.04069	-12.24266	-10.78451	-9.464788	-8.611343	-8.049347	-7.973143	-8.391918	-9.190979	-10.5055	-11.8407	-13.37718	-14.74186	-15.99714];
S21_OD120_measurement = [-50.14283	-47.87932	-44.98363	-42.3277	-39.54096	-37.14328	-34.49268	-32.27593	-29.70035	-27.6281	-25.0713	-23.06134	-20.72507	-18.85374	-16.65173	-14.84356	-12.97485	-11.516	-9.993851	-9.082575	-8.289948	-7.945399	-7.974199	-8.387463	-9.240128	-10.16482	-11.42316	-12.56452	-13.67248];
S21_OD130_measurement = [-46.11777	-44.71184	-42.62981	-40.54438	-38.11785	-36.08837	-33.56009	-31.58922	-29.13261	-27.20836	-24.80443	-22.99433	-20.65066	-18.87712	-16.78903	-15.18186	-13.29588	-11.94511	-10.43481	-9.477835	-8.585253	-8.099552	-7.922386	-8.065193	-8.593201	-9.202415	-10.15071	-10.98473	-11.93413];
S21_OD140_measurement = [-42.70032	-41.59286	-39.89217	-38.24573	-36.11744	-34.34758	-32.07024	-30.31742	-28.01642	-26.24532	-24.01079	-22.34368	-20.10681	-18.50625	-16.46281	-14.90355	-13.2002	-11.92807	-10.56301	-9.628725	-8.748915	-8.269552	-7.986096	-7.984948	-8.268173	-8.680014	-9.312841	-9.931704	-10.62493];
S21_OD150_measurement = [-40.21688	-39.27395	-37.89967	-36.45428	-34.63457	-33.03581	-31.02089	-29.36186	-27.26619	-25.57758	-23.53859	-21.8346	-19.87089	-18.30589	-16.47654	-14.96046	-13.35054	-12.08061	-10.86944	-9.886412	-9.100214	-8.532522	-8.168314	-8.031296	-8.105524	-8.314291	-8.691818	-9.106415	-9.612282];
S21_OD160_measurement = [-37.84643	-37.03961	-35.85305	-34.56769	-32.98253	-31.56754	-29.74609	-28.22675	-26.3471	-24.74219	-22.88528	-21.31573	-19.47697	-17.9963	-16.29887	-14.96666	-13.48668	-12.36889	-11.1675	-10.32806	-9.503098	-8.976929	-8.553007	-8.328072	-8.240614	-8.293161	-8.473221	-8.707344	-9.024378];
S21_OD170_measurement = [-35.74396	-34.94761	-33.804	-32.65185	-31.17706	-29.95739	-28.18808	-26.85706	-25.06023	-23.61121	-21.86886	-20.46403	-18.72439	-17.34937	-15.82015	-14.65376	-13.29193	-12.36912	-11.25739	-10.52585	-9.811586	-9.331213	-8.945005	-8.720711	-8.595589	-8.594486	-8.672527	-8.816988	-9.031267];
S21_OD180_measurement = [-33.84764	-33.21651	-32.33248	-31.38147	-30.10865	-29.01947	-27.52135	-26.28698	-24.67797	-23.40153	-21.74921	-20.46945	-18.87753	-17.65657	-16.1952	-15.09698	-13.81019	-12.9229	-11.8882	-11.22404	-10.50913	-10.05127	-9.625923	-9.388906	-9.181791	-9.121481	-9.112709	-9.178989	-9.31555];
S21_OD190_measurement = [-32.10975	-31.39213	-30.5892	-29.57003	-28.5363	-27.31906	-26.13572	-24.80774	-23.4741	-22.14731	-20.80155	-19.48468	-18.23561	-16.98654	-15.85116	-14.7296	-13.79127	-12.93346	-12.17459	-11.5402	-11.02653	-10.62346	-10.30845	-10.09192	-9.946678	-9.892843	-9.919622	-9.967257	-10.07056];
S21_OD200_measurement = [-30.27575	-29.70894	-28.95843	-28.15037	-27.18811	-26.15015	-25.09441	-23.91511	-22.72722	-21.52739	-20.29252	-19.15047	-17.96709	-16.90276	-15.83545	-14.90741	-14.03224	-13.30212	-12.62295	-12.09462	-11.64254	-11.29781	-11.02869	-10.83467	-10.71854	-10.65295	-10.66457	-10.72158	-10.80384];
%% Plot
S21_measurement = [S21_OD30_measurement;S21_OD40_measurement;S21_OD50_measurement;S21_OD60_measurement;S21_OD70_measurement;S21_OD80_measurement;S21_OD90_measurement;S21_OD100_measurement;S21_OD110_measurement;...
    S21_OD120_measurement;S21_OD130_measurement;S21_OD140_measurement;S21_OD150_measurement;S21_OD160_measurement;S21_OD170_measurement;S21_OD180_measurement;S21_OD190_measurement;S21_OD200_measurement]; 

imagesc(d2i,OD,10.^(S21_measurement/20));
%imagesc(d2i,OD,S21_measurement);
set(gca,'YDir','normal','XTick',[5:10:145],'YTick',[30:10:200],'FontName','Times New Roman','FontWeight','bold');
xlabel('Separation Between the Transmiting Coil and the Intermediate Coil (mm)','FontSize',12);
ylabel('Outer Diameter of Intermediate Coils (mm)','FontSize',12);
cb = colorbar;
cb.Label.String = 'S21 Linear Magnitude';
cb.Label.FontSize = 12;
colormap(parula);
caxis([0 0.7]);