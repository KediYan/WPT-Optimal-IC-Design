clc, clear all, close all

% constant = [0.55 0.55 0.55 0.5 0.5 0.6 0.6 0.7 0.9 0.8 0.9 1.1 1.0 1.7 3.0 5.2 8.5 11.8];
constant = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% equal coupling coefficient vs. size of relays
OD_TSC = 90e-3; OD_RSC = 30e-3; w = 1.1e-3; p = 1e-3; N = 7;
IR_TSC = OD_TSC/2-(N-1)*(w+p); IR_RSC = OD_RSC/2-(N-1)*(w+p); 
% loop coils
IR_TLC = 33.75e-3; IR_RLC = 5.22e-3;
% separation of loop and spiral
d12 = 35e-3; d34 = 2e-3;
% resonant frequency = 13.56 MHz
wo = 2*pi*13.56*10^6; 
Rsource = 50; Rload = 50;
%------------------------%
% Characteristics of Tx loop
Rp1 = parasitic_resistance(IR_TLC,1);
L1 = Inductance_of_loop(IR_TLC);
C1 = 1/(wo^2*L1);
% Characteristics of Rx loop
Rp4 = parasitic_resistance(IR_RLC,1);
L4 = Inductance_of_loop(IR_RLC);
C4 = 1/(wo^2*L4);
% Characteristics of Tx spiral
Rp2 = parasitic_resistance(IR_TSC,7) * constant(7);
% Rp2 = 1.9;
L2 = Inductance_of_spiral(IR_TSC);
C2 = 1/(wo^2*L2);
% Characteristics of Rx spiral
Rp3 = parasitic_resistance(IR_RSC,7) * constant(3);
% Rp3 = 0.4;
L3 = Inductance_of_spiral(IR_RSC);
C3 = 1/(wo^2*L3);
% Self Impedance
Z11 = Rp1+Rsource+1i*wo*L1-1i/(wo*C1);
Z22 = Rp2+1i*wo*L2-1i/(wo*C2);
Z33 = Rp3+1i*wo*L3-1i/(wo*C3);
Z44 = Rp4+Rload+1i*wo*L4-1i/(wo*C4);

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

S21_measurement = [S21_OD30_measurement;S21_OD40_measurement;S21_OD50_measurement;S21_OD60_measurement;S21_OD70_measurement;S21_OD80_measurement;S21_OD90_measurement;S21_OD100_measurement;S21_OD110_measurement;...
    S21_OD120_measurement;S21_OD130_measurement;S21_OD140_measurement;S21_OD150_measurement;S21_OD160_measurement;S21_OD170_measurement;S21_OD180_measurement;S21_OD190_measurement;S21_OD200_measurement]; 

rinner_relay_array = 2.4e-3:5e-3:87.4e-3;
optimal_location = []; maxS21_array = []; i = 0; OD_array = [];
k2i_at_optimal_location_simulation = []; ki3_at_optimal_location_simulation = [];
d2i_steps = 5e-3:5e-3:145e-3; %5e-3:5e-3:145e-3 OR 1e-3:1e-3:149e-3
for rinner_relay=rinner_relay_array
    i = i + 1;
    OD_array = [OD_array, 2*(rinner_relay+(N-1)*(w+p))*10^3];
    S21_of_each_relay_size = []; 
    for d2i = d2i_steps             % Separation between TSC and ISC: 5mm to 145 mm
        d3i = 150e-3 - d2i;         % TSC and RSC are 150 mm away 
        % Mutual Inductance
        M12 = MI_loop_spiral(IR_TLC,IR_TSC,d12);
        M34 = MI_loop_spiral(IR_RLC,IR_RSC,d34);
        M2i = MI_spiral_spiral(IR_TSC, rinner_relay, d2i);
        M3i = MI_spiral_spiral(IR_RSC, rinner_relay, d3i);
        % Characteristics of the Relay Coil
        Li = Inductance_of_spiral(rinner_relay);
        Rpi = parasitic_resistance(rinner_relay,7) * constant(i);
        Ci = 1/(wo^2*Li);
        Zii = Rpi+1i*wo*Li-1i/(wo*Ci);
        % Mutual Impedance
        Z12 = 1i*wo*M12;
        Z34 = 1i*wo*M34;
        Z2i = 1i*wo*M2i;
        Z3i = 1i*wo*M3i;
        % VL/VS
        Numerator = Z12*Z2i*Z3i*Z34*Rload;
        Denominator = Z11*Z22*Zii*Z33*Z44+Z11*Z2i^2*Z34^2+Zii*Z12^2*Z34^2+Z44*Z12^2*Z3i^2-...
            Z12^2*Zii*Z33*Z44-Z2i^2*Z11*Z33*Z44-Z3i^2*Z11*Z22*Z44-Z34^2*Z11*Z22*Zii;
        VL_over_Vs = Numerator./Denominator;
        S21 = 2*VL_over_Vs*(Rsource/Rload)^0.5;
        S21_of_each_relay_size = [S21_of_each_relay_size,abs(S21)];
    end
    [maxS21,index] = max(S21_of_each_relay_size);
    maxS21_array = [maxS21_array, maxS21];
    optimal_location = [optimal_location,d2i_steps(index)];
    k2i_at_optimal_location_simulation = [k2i_at_optimal_location_simulation, MI_spiral_spiral(IR_TSC, rinner_relay, d2i_steps(index))/sqrt(L2*Li)];
    ki3_at_optimal_location_simulation = [ki3_at_optimal_location_simulation, MI_spiral_spiral(IR_RSC, rinner_relay, 150e-3-d2i_steps(index))/sqrt(L3*Li)];
end

figure
plot(OD_array,optimal_location*1e3,'b');
hold on
[maxAmongmax,ind] = max(S21_measurement');
plot(OD_array,5*ind,'r');
hold off
xlabel('Outer Diameter of Intermediate Coils (mm)');
ylabel('The optimal location of the Intermediate Coil (mm)');
legend("Simulation","Measurement");
set(gca,"FontWeight","bold","YLim",[0 150],"Xlim",[20 210]);

figure
plot(OD_array,maxS21_array,'bo-');
hold on
plot(OD_array,10.^(maxAmongmax/20),'r');
hold off
xlabel('Outer Diameter of Intermediate Coils (mm)');
ylabel('S21 at Optimal Location');
legend("Simulation","Measurement");
set(gca,"FontWeight","bold","Xlim",[20 210],"YLim",[0 0.7]);

figure
yyaxis right
plot(OD_array(2:end),atand(diff(maxS21_array)/max(diff(maxS21_array))),"LineWidth",3);
ylabel("Rate of Change of S21 in degree",'FontSize',12,'Color','black')
yyaxis left
plot(OD_array(1:end),maxS21_array/max(maxS21_array),"LineWidth",3);
ylabel("Normalized S21 at the Optimal Location",'FontSize',12,'Color','black')
xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',12,'Color','black');
rectangle('Position',[50 0 20 1],'Curvature',0.2,'EdgeColor','none', 'FaceColor',[1 0 0 0.3])
