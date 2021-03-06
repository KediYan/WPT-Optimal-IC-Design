clear all, close all, clc
%-----User Variables-----%
% spiral coils
OD_TSC = 50e-3; OD_RSC = 50e-3; w = 1.1e-3; p = 1e-3; N = 7;
IR_TSC = OD_TSC/2-(N-1)*(w+p); IR_RSC = OD_RSC/2-(N-1)*(w+p); 
% loop coils
IR_TLC = (OD_TSC/2 + IR_TSC)/2; IR_RLC = (OD_RSC/2 + IR_RSC)/2;
% resonant frequency = 13.56 MHz
wo = 2*pi*13.56*10^6; 
Rsource = 50; Rload = 50;
%-----------------------%
% Characteristics of loops
Rp1 = parasitic_resistance(IR_TLC,1); Rp4 = parasitic_resistance(IR_RLC,1);
L1 = Inductance_of_loop(IR_TLC); L4 = Inductance_of_loop(IR_RLC);
C1 = 1/(wo^2*L1); C4 = 1/(wo^2*L4);
% Characteristics of spirals
Rp2 = parasitic_resistance(IR_TSC,7); Rp3 = parasitic_resistance(IR_RSC,7);
L2 = Inductance_of_spiral(IR_TSC); L3 = Inductance_of_spiral(IR_RSC);
C2 = 1/(wo^2*L2); C3 = 1/(wo^2*L3);
% Self-Impedance
Z11 = Rp1+Rsource+1i*wo*L1-1i/(wo*C1);
Z22 = Rp2+1i*wo*L2-1i/(wo*C2);
Z33 = Rp3+1i*wo*L3-1i/(wo*C3);
Z44 = Rp4+Rload+1i*wo*L4-1i/(wo*C4);
% Measured S21
S21_OD30_measurement = [-69.75604	-53.90846	-44.60128	-38.00991	-32.32071	-27.63775	-23.28036	-19.50912	-16.21899	-13.43694	-11.51958	-10.22214	-9.502546	-9.127682	-9.004719	-9.065351	-9.348118	-10.0029	-11.25523	-13.23414	-16.00485	-19.42469	-23.29441	-27.59011	-32.60431	-38.13223	-44.96144	-55.7115	-75.69639];
S21_OD40_measurement = [-67.8639	-54.36426	-44.90912	-38.65775	-33.3951	-28.93376	-24.90158	-21.08749	-17.5998	-14.49153	-11.70538	-9.424965	-7.705075	-6.643505	-6.23782	-6.41742	-7.276423	-8.793011	-10.93613	-13.69145	-16.77199	-20.18746	-23.9248	-27.92006	-32.37202	-37.50234	-43.46061	-52.56758	-70.33812];
S21_OD50_measurement = [-65.58762	-50.769	-42.87271	-37.31888	-32.78028	-28.2782	-24.42635	-20.80674	-17.45754	-14.26916	-11.45321	-9.001457	-7.086121	-5.827909	-5.292921	-5.518547	-6.46271	-8.208414	-10.50541	-13.34163	-16.44894	-19.79763	-23.27958	-27.09265	-31.17105	-35.88438	-41.28722	-48.41095	-58.75197];
S21_OD60_measurement = [-52.93058	-44.75855	-39.11231	-34.49535	-30.42977	-26.32088	-22.7681	-19.28157	-16.10278	-13.12624	-10.40606	-8.155684	-6.337174	-5.232565	-4.881954	-5.264488	-6.409244	-8.278969	-10.70858	-13.53331	-16.47627	-19.84347	-23.22772	-27.03335	-31.00119	-35.38264	-40.26006	-46.64238	-55.15304];
S21_OD70_measurement = [-45.21054	-40.66863	-36.31459	-32.53362	-28.76032	-25.17498	-21.84383	-18.54957	-15.55773	-12.72878	-10.11489	-7.918528	-6.156564	-5.097934	-4.710668	-5.040241	-6.100204	-7.843657	-10.12807	-12.79929	-15.62691	-18.75374	-21.9481	-25.39812	-28.89725	-32.79333	-36.81963	-41.2338	-46.16536];
S21_OD80_measurement = [-39.38773	-36.67581	-33.53134	-30.30787	-27.04792	-23.81828	-20.79021	-17.75079	-14.89831	-12.18888	-9.766113	-7.666445	-6.025653	-5.001427	-4.634372	-4.913235	-5.89534	-7.470952	-9.589268	-12.10555	-14.7607	-17.68147	-20.65305	-23.67773	-27.01751	-30.29303	-33.59836	-36.87728	-39.75253];
S21_OD90_measurement = [-34.83287	-32.88868	-30.49839	-27.78234	-25.01517	-22.14566	-19.36287	-16.64163	-13.95084	-11.54686	-9.264748	-7.354923	-5.872511	-4.92357	-4.579895	-4.821046	-5.689236	-7.159752	-9.121849	-11.41012	-13.88433	-16.52702	-19.26044	-22.14488	-25.01347	-27.84977	-30.5921	-33.11844	-35.09157];
S21_OD100_measurement = [-31.31243	-30.06487	-28.19258	-26.04087	-23.54994	-21.10678	-18.49394	-16.02938	-13.59091	-11.30828	-9.166588	-7.372562	-5.875359	-5.001014	-4.573786	-4.687747	-5.339866	-6.531749	-8.212732	-10.22536	-12.45405	-14.93974	-17.36876	-19.95279	-22.51721	-25.06046	-27.31323	-29.42957	-31.11602];
S21_OD110_measurement = [-28.41623	-27.29724	-25.79471	-23.9373	-21.87699	-19.73144	-17.45543	-15.16192	-12.92841	-10.83613	-8.880377	-7.215148	-5.857536	-5.003953	-4.577966	-4.628447	-5.163342	-6.172503	-7.65735	-9.47641	-11.49602	-13.67772	-15.93604	-18.26134	-20.5904	-22.76682	-24.77007	-26.55583	-27.95519];
S21_OD120_measurement = [-25.4424	-24.46149	-23.03057	-21.32258	-19.47325	-17.51152	-15.47243	-13.44502	-11.47888	-9.595974	-7.897215	-6.472127	-5.449417	-4.758531	-4.520089	-4.73685	-5.414737	-6.486366	-7.999142	-9.726151	-11.62394	-13.59545	-15.75998	-17.76521	-19.79542	-21.699	-23.40359	-24.86203	-25.9535];
S21_OD130_measurement = [-23.41742	-22.51629	-21.28726	-19.87507	-18.1984	-16.48283	-14.58404	-12.77338	-10.99336	-9.278252	-7.716099	-6.40681	-5.437428	-4.781865	-4.51839	-4.652011	-5.176893	-6.080589	-7.37169	-8.916985	-10.58414	-12.39967	-14.28023	-16.11169	-17.97476	-19.67476	-21.20127	-22.53559	-23.55536];
S21_OD140_measurement = [-21.64416	-20.86329	-19.82234	-18.53202	-17.08328	-15.56674	-13.94707	-12.2728	-10.6886	-9.179035	-7.762584	-6.533862	-5.558739	-4.897158	-4.56143	-4.551324	-4.892748	-5.567099	-6.596423	-7.883618	-9.297958	-10.90425	-12.61027	-14.3032	-15.98289	-17.51616	-18.94767	-20.17832	-21.20071];
S21_OD150_measurement = [-19.45441	-18.6961	-17.66471	-16.56432	-15.23358	-13.82948	-12.37642	-10.89599	-9.499147	-8.15008	-6.947631	-5.955236	-5.228477	-4.728857	-4.531389	-4.616366	-4.982732	-5.637377	-6.562984	-7.720968	-9.048769	-10.48777	-11.99669	-13.48857	-14.98899	-16.34191	-17.53958	-18.60317	-19.49502];
S21_OD160_measurement = [-17.44027	-16.74107	-15.8586	-14.79542	-13.62701	-12.414	-11.12813	-9.868177	-8.653877	-7.557031	-6.579015	-5.767139	-5.191545	-4.813191	-4.647785	-4.70364	-4.978046	-5.488231	-6.232216	-7.216572	-8.285307	-9.527626	-10.79378	-12.08778	-13.38664	-14.61619	-15.71065	-16.62867	-17.41616];
S21_OD170_measurement = [-15.64666	-14.99395	-14.20738	-13.26689	-12.30472	-11.22175	-10.12692	-9.070219	-8.045534	-7.135866	-6.37291	-5.739165	-5.274593	-4.978966	-4.848055	-4.866015	-5.075335	-5.446844	-6.001997	-6.741895	-7.626162	-8.627649	-9.706858	-10.83485	-11.95324	-13.0087	-13.98584	-14.82891	-15.51639];
S21_OD180_measurement = [-13.89228	-13.34204	-12.66144	-11.88204	-11.0365	-10.14754	-9.234478	-8.410797	-7.607007	-6.912676	-6.32932	-5.864058	-5.532235	-5.304037	-5.203627	-5.204591	-5.340921	-5.591213	-5.979719	-6.523894	-7.159063	-7.924545	-8.781021	-9.736118	-10.63288	-11.53341	-12.35676	-13.10277	-13.713];
S21_OD190_measurement = [-12.27969	-11.7774	-11.15799	-10.54129	-9.856142	-9.158779	-8.463852	-7.826707	-7.304305	-6.809233	-6.429363	-6.123951	-5.907282	-5.770493	-5.720012	-5.735996	-5.825705	-6.013803	-6.289174	-6.671065	-7.148682	-7.735529	-8.35903	-9.072609	-9.790365	-10.49742	-11.17026	-11.73808	-12.24579];
S21_OD200_measurement = [-11.15537	-10.75777	-10.26991	-9.758211	-9.216978	-8.721998	-8.21907	-7.772138	-7.380738	-7.023007	-6.744972	-6.538363	-6.379295	-6.292113	-6.241724	-6.246731	-6.305526	-6.421095	-6.617828	-6.86913	-7.200587	-7.602183	-8.062805	-8.592373	-9.14702	-9.690184	-10.21089	-10.69117	-11.09387];
S21_measurement = [S21_OD30_measurement;S21_OD40_measurement;S21_OD50_measurement;S21_OD60_measurement;S21_OD70_measurement;S21_OD80_measurement;S21_OD90_measurement;S21_OD100_measurement;S21_OD110_measurement;...
    S21_OD120_measurement;S21_OD130_measurement;S21_OD140_measurement;S21_OD150_measurement;S21_OD160_measurement;S21_OD170_measurement;S21_OD180_measurement;S21_OD190_measurement;S21_OD200_measurement]; 
rinner_relay_array = 2.4e-3:5e-3:87.4e-3;
OD_relay_array = []; d2i_array = []; S21_simulation = []; optimal_location = []; maxS21_array = []; i = 0;
d2i_steps = 5e-3:5e-3:145e-3; % 1e-3:1e-3:149e-3
for rinner_relay=rinner_relay_array % Relay size, OD = 30mm to 200mm
    i = i + 1;
    OD = 2*(rinner_relay+(N-1)*(2.1e-3))*10^3;
    S21_of_each_relay_size = []; 
    for d2i = d2i_steps 
        d3i = 150e-3 - d2i;             % TSC and RSC are 150 mm away
        % Mutual Inductance
        M12 = MI_loop_spiral(IR_TLC,IR_TSC,15e-3); M34 = M12;
        M2i = MI_spiral_spiral(IR_TSC, rinner_relay, d2i);
        M3i = MI_spiral_spiral(IR_RSC, rinner_relay, d3i);
        % Characteristics of Relay
        Li = Inductance_of_spiral(rinner_relay);
        Rpi = parasitic_resistance(rinner_relay,7);
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
        OD_relay_array = [OD_relay_array,OD];
        d2i_array = [d2i_array, d2i*1e3];
        S21_simulation = [S21_simulation,abs(S21)];
        % to get the max value of S21 of each relay's size
        S21_of_each_relay_size = [S21_of_each_relay_size,abs(S21)];
    end
    [maxS21,index] = max(S21_of_each_relay_size);
    maxS21_array = [maxS21_array,maxS21];
    optimal_location = [optimal_location,d2i_steps(index)];
end

%subplot(2,1,1);
DT1 = delaunayTriangulation(OD_relay_array(:),d2i_array(:));
T1 = DT1.ConnectivityList;
surface1 = trisurf(T1,OD_relay_array(:),d2i_array(:),S21_simulation(:));
surface1.CData = S21_simulation(:);
surface1.FaceColor = 'interp';
title('Simulation')
xlabel('Outer Diameter of relay (mm)')
ylabel('Separation between the Transmitter and the Intermediate (mm)')
zlabel('S21 Linear Magnitude') 
zlim([0,1])
set(gca, 'YDir', 'reverse')
colormap jet;

%{
S21_measurement = [S21_OD30_measurement S21_OD40_measurement S21_OD50_measurement S21_OD60_measurement S21_OD70_measurement S21_OD80_measurement S21_OD90_measurement S21_OD100_measurement S21_OD110_measurement ...
    S21_OD120_measurement S21_OD130_measurement S21_OD140_measurement S21_OD150_measurement S21_OD160_measurement S21_OD170_measurement S21_OD180_measurement S21_OD190_measurement S21_OD200_measurement]; 
subplot(2,1,2);
DT1 = delaunayTriangulation(OD_relay_array(:),d2i_array(:));
T1 = DT1.ConnectivityList;
surface1 = trisurf(T1,OD_relay_array(:),d2i_array(:),S21_measurement(:));
surface1.CData = S21_measurement(:);
surface1.FaceColor = 'interp';
title('Measurement');
xlabel('Outer Diameter of relay (mm)')
ylabel('Separation between the Transmitter and the Intermediate (mm)')
zlabel('S21 Linear Magnitude') 
set(gca, 'YDir', 'reverse')
colormap jet;
%}
S21_measurement = [S21_OD30_measurement;S21_OD40_measurement;S21_OD50_measurement;S21_OD60_measurement;S21_OD70_measurement;S21_OD80_measurement;S21_OD90_measurement;S21_OD100_measurement;S21_OD110_measurement;...
    S21_OD120_measurement;S21_OD130_measurement;S21_OD140_measurement;S21_OD150_measurement;S21_OD160_measurement;S21_OD170_measurement;S21_OD180_measurement;S21_OD190_measurement;S21_OD200_measurement]; 
figure
OD_array = 2*(rinner_relay_array+(N-1)*(2.1e-3))*10^3;
plot(OD_array,maxS21_array);
hold on
% [maxAmongmax,ind] = max(maxS21_array);
% plot(OD_array(ind),maxAmongmax,'o');
% hold on
plot(OD_array,10.^(max(S21_measurement')/20));
hold off
xlabel('Outer Diameter of ICs (mm)');
ylabel('Maximum |S21| for each IC');
legend("Simulation","Measurement");