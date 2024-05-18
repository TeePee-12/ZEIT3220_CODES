clc;
clear;
clear all;
%%Generate Data Plots for Lab 1B, Theory, Sim, Measured for 3 cables
%Contsants for theory plots
Z_l = 200+0i;      %Load Impedance
Z_0 = 50+0i;       %Characteristic Impedance
U_p = 3e8*0.66;    %Phase Velocity
RC = ((Z_l-Z_0)/(Z_l+Z_0));

%% Cable 1, #7, 2964mm
L = 2.964;           %Length

Measured   = sparameters('Cable_1_data.s1p');
Simulated = sparameters('Cable_1_Sim_data.s1p');
%Extract the input impedance and frequency points
Measured_freq = Measured.Frequencies;
Measured_z_in = reshape(s2z(rfparam(Measured,1,1)),[1,50]);
Measured_real_z_in = real(Measured_z_in);
Measured_imag_z_in = imag(Measured_z_in);

Simulated_freq = Simulated.Frequencies;
Simulated_z_in = reshape(s2z(rfparam(Simulated,1,1)),[1,21]);
Simulated_real_z_in = real(Simulated_z_in);
Simulated_imag_z_in = imag(Simulated_z_in);


%Calculate and plot S11 for 20e4 data points between 40-60MHz
Theory = complex([]);
freqs = [];
Z_ins = complex([]);
for f = 40e4:60e4
    [Theory(end+1),Z_ins(end+1)]  = Params(Z_l, Z_0, L, U_p, f*100);
    freqs(end+1) = f*100;
end

%Make Smith Plot
fig1=figure(1);
%Plot Theory
smithplot(Theory,'LineWidth',2,'LegendLabels','Cable#7 Theory');
%Plot Simulation
hold on;
smithplot(Simulated,'LineStyle','--','LineWidth',2,'LegendLabels','Cable#7 Simulation');
%Plot Measured
hold on;
smithplot(Measured,'LineWidth',2,'LegendLabels','Cable#7 Measured');
hold off;
saveas(fig1,'Cable_7_Smith_Chart.svg');


%Make Cartesian Plot for Zin
% Plot the real and imaginary parts of the input impedance as a function of frequency
fig2=figure(2);
tiledlayout(2,1);
sgtitle(' Z_{in}, Theory, Simulated and Measured | Cable#7');

%Plot Real Part
nexttile;
plot(freqs,real(Z_ins), 'DisplayName','Theory');
hold on;
plot(Simulated_freq, Simulated_real_z_in,'DisplayName','Simulated');
hold on;
plot(Measured_freq, Measured_real_z_in,'DisplayName','Measured');
ylabel('Real Z_{in} [\Omega]');
xlabel('Frequency [Hz]');
hold off;
legend;

%Plot Imag Part
nexttile
plot(freqs,imag(Z_ins))
hold on
plot(Simulated_freq, Simulated_imag_z_in)
hold on
plot(Measured_freq, Measured_imag_z_in)
ylabel('Imag Z_{in} [\Omega]');
xlabel("Frequency [Hz]")
hold off;
saveas(fig2,'Cable_7_Cartesian_Plot.svg');

%% Cable 2, #2, 3234mm
L = 3.234;      %Length

Measured   = sparameters('Cable_2_data.s1p');
Simulated = sparameters('Cable_2_Sim_data.s1p');
%Extract the input impedance and frequency points
Measured_freq = Measured.Frequencies;
Measured_z_in = reshape(s2z(rfparam(Measured,1,1)),[1,50]);
Measured_real_z_in = real(Measured_z_in);
Measured_imag_z_in = imag(Measured_z_in);

Simulated_freq = Simulated.Frequencies;
Simulated_z_in = reshape(s2z(rfparam(Simulated,1,1)),[1,21]);
Simulated_real_z_in = real(Simulated_z_in);
Simulated_imag_z_in = imag(Simulated_z_in);


%Calculate and plot S11 for 20e4 data points between 40-60MHz
Theory = complex([]);
freqs = [];
Z_ins = complex([]);
for f = 40e4:60e4
    [Theory(end+1),Z_ins(end+1)]  = Params(Z_l, Z_0, L, U_p, f*100);
    freqs(end+1) = f*100;
end

fig3=figure(3);
%Plot Theory
d=smithplot(Theory,'LineWidth',2,'LegendLabels','Cable#2 Theory');
%Plot Simulation
hold on;
smithplot(Simulated,'LineStyle','--','LineWidth',2,'LegendLabels','Cable#2 Simulation');
%Plot Measured
hold on;
smithplot(Measured,'LineWidth',2,'LegendLabels','Cable#2 Measured');
hold off;
saveas(fig3,'Cable_2_Smith_Chart.svg');

%Make Cartesian Plot for Zin
% Plot the real and imaginary parts of the input impedance as a function of frequency
fig4=figure(4);
tiledlayout(2,1);
sgtitle(' Z_{in}, Theory, Simulated and Measured | Cable#2');

%Plot Real Part
nexttile;
plot(freqs,real(Z_ins));
hold on;
plot(Simulated_freq, Simulated_real_z_in);
hold on;
plot(Measured_freq, Measured_real_z_in);
ylabel('Real Z_{in} [\Omega]');
xlabel('Frequency [Hz]');
hold off;
legend('Theory','Simulation','Measured');

%Plot Imag Part
nexttile;
plot(freqs,imag(Z_ins));
hold on;
plot(Simulated_freq, Simulated_imag_z_in);
hold on;
plot(Measured_freq, Measured_imag_z_in);
ylabel('Imag Z_{in} [\Omega]');
xlabel("Frequency [Hz]");
hold off;
saveas(fig4,'Cable_2_Cartesian_Plot.svg');

%% Cable 3, #5, 3983mm
L = 3.983;      %Length

Measured   = sparameters('Cable_3_data.s1p');
Simulated = sparameters('Cable_3_Sim_data.s1p');
%Extract the input impedance and frequency points
Measured_freq = Measured.Frequencies;
Measured_z_in = reshape(s2z(rfparam(Measured,1,1)),[1,50]);
Measured_real_z_in = real(Measured_z_in);
Measured_imag_z_in = imag(Measured_z_in);

Simulated_freq = Simulated.Frequencies;
Simulated_z_in = reshape(s2z(rfparam(Simulated,1,1)),[1,21]);
Simulated_real_z_in = real(Simulated_z_in);
Simulated_imag_z_in = imag(Simulated_z_in);

%Calculate and plot S11 for 20e4 data points between 40-60MHz
Theory = complex([]);
freqs = [];
Z_ins = complex([]);
for f = 40e4:60e4
    [Theory(end+1),Z_ins(end+1)]  = Params(Z_l, Z_0, L, U_p, f*100);
    freqs(end+1) = f*100;
end

fig5=figure(5);
%Plot Theory
d=smithplot(Theory,'LineWidth',2,'LegendLabels','Cable#5 Theory');
%Plot Simulation
hold on;
smithplot(Simulated,'LineStyle','--','LineWidth',2,'LegendLabels','Cable#5 Simulation');
%Plot Measured
hold on;
smithplot(Measured,'LineWidth',2,'LegendLabels','Cable#5 Measured');
hold off;
saveas(fig5,'Cable_5_Smith_Chart.svg');

%Make Cartesian Plot for Zin
% Plot the real and imaginary parts of the input impedance as a function of frequency
fig6=figure(6);
tiledlayout(2,1);
sgtitle(' Z_{in}, Theory, Simulated and Measured | Cable#5');

%Plot Real Part
nexttile
plot(freqs,real(Z_ins));
hold on
plot(Simulated_freq, Simulated_real_z_in);
hold on
plot(Measured_freq, Measured_real_z_in);
ylabel('Real Z_{in} [\Omega]');
xlabel('Frequency [Hz]');
hold off;
legend('Theory','Simulation','Measured');

%Plot Imag Part
nexttile;
plot(freqs,imag(Z_ins));
hold on;
plot(Simulated_freq, Simulated_imag_z_in);
hold on;
plot(Measured_freq, Measured_imag_z_in);
ylabel('Imag Z_{in} [\Omega]');
xlabel("Frequency [Hz]");
hold off;
saveas(fig6,'Cable_5_cartesian_Plots.svg')

%% Lab 1C

Load_a_Cable_2   = sparameters('Cable_2_Load_A_data.s1p');
Simulated_Load_A = sparameters('Calculated_Mystery_Load_Simulation.s1p');
Shunt_Stub       = sparameters('Shunt_Stub_Matching_Data.s1p');
Q_Wave           = sparameters('Q_Wave_Matching_Data.s1p');

%Make Smith Plot
fig7=figure(7);
%Plot Theory
smithplot(Load_a_Cable_2,'LineWidth',2,'LegendLabels','Load#a Measured');
%Plot Simulation
hold on;
smithplot(Simulated_Load_A,'LineStyle','--','LineWidth',2,'LegendLabels','ADS Simulation 9.676 Ω , 31.30nH');
%Plot Measured
hold on;
smithplot(Shunt_Stub,'LineWidth',2,'LegendLabels','Shunt-Stub Matching Network');
hold on;
smithplot(Q_Wave,'LineWidth',2,'LegendLabels','Quarter-Wave Matching Network');
saveas(fig7,'Impedance Matching Smith Chart.svg');

Shunt_freq = Shunt_Stub.Frequencies;
Shunt_z_in = reshape(s2z(rfparam(Shunt_Stub,1,1)),[1,201]);
Shunt_real_z_in = real(Shunt_z_in);
Shunt_imag_z_in = imag(Shunt_z_in);
Shunt_db    = mag2db(abs(rfparam(Shunt_Stub,1,1)));
Qwave_freq = Q_Wave.Frequencies;
Qwave_z_in = reshape(s2z(rfparam(Q_Wave,1,1)),[1,201]);
Qwave_real_z_in = real(Qwave_z_in);
Qwave_imag_z_in = imag(Qwave_z_in);
Qwave_db   =  mag2db(abs(rfparam(Q_Wave,1,1)));

% Plot the real and imaginary parts of the input impedance as a function of frequency
fig8=figure(8);
tiledlayout(2,1);
sgtitle(' Z_{in}, Impedance Matching Networks');

%Plot Real Part
nexttile
plot(Shunt_freq, Shunt_real_z_in);
hold on
plot(Qwave_freq, Qwave_real_z_in);
ylabel('Real Z_{in} [\Omega]');
xlabel('Frequency [Hz]');
hold off;
legend('Shunt-Stub Network','Quarter-Wave Network');

%Plot Imag Part
nexttile;
plot(Shunt_freq, Shunt_imag_z_in);
hold on;
plot(Qwave_freq, Qwave_imag_z_in);
ylabel('Imag Z_{in} [\Omega]');
xlabel("Frequency [Hz]");
hold off;
saveas(fig8,'Impedacne Match_cartesian_Plots.svg')
%%
fig9=figure(9);
sgtitle(' Z_{in}, Impedance Matching Networks');

plot(Shunt_freq, Shunt_db);
hold on;
plot(Qwave_freq, Qwave_db);
ylabel('dB');
xlabel("Frequency [Hz]");
hold off;
legend('Shunt-Stub Network','Quarter-Wave Network');
saveas(fig9,'Impedacne Match_dB_Plot.svg')




%%Function for calculating S params at each frequency
function [GAMMA_in, Z_in] = Params(Z_l, Z_0, L, U_p, f)
     wavelength = U_p/f;
     bl = 2*pi*(L/wavelength);
     GAMMA_l = (Z_l-Z_0)/(Z_l+Z_0);
     GAMMA_in = GAMMA_l*exp(-2i*bl);
     Z_in = Z_0*((Z_l+(1i*Z_0*tan(bl)))/(Z_0+(1i*Z_l*tan(bl))));
end



