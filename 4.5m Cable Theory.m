
% Transmission Line Properties
Z_l = 200+0i;      %Load Impedance
Z_0 = 50+0i;       %Characteristic Impedance
L = 4.5;           %Length
U_p = 3e8*0.66;    %Phase Velocity

gammas = complex([]);
freqs = [];
Z_ins = complex([]);

for f = 40e4:60e4
    [gammas(end+1),Z_ins(end+1)]  = Params(Z_l, Z_0, L, U_p, f*100);
    freqs(end+1) = f*100;
end
figure(1)
title(["Theoretical Γ_{in} as a function of signal frequency","4.5m transmission line, Z_{0}=50[\Omega], Z_{L}=200[\Omega]"]);
smithplot(gammas)
% Add markers and legend at specific points
hold on
marker_indices = [1, 10e4, length(gammas)]; % indices of points to mark
marker_colors = {'r', 'g', 'b'}; % colors of markers
marker_labels = {'40MHz', '50MHz', '60MHz'}; % labels of markers
for ii = 1:length(marker_indices)
    index = marker_indices(ii);
    plot(real(gammas(index)), imag(gammas(index)), 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', marker_colors{ii}, 'MarkerEdgeColor', 'none', 'DisplayName', [marker_labels{ii}, ': ', num2str(abs(gammas(index)), '%.3g'), ' < ', num2str(angle(gammas(index)), '%.2g'), '\pi'])
end
legend('Location', 'eastoutside')

figure(2)
tiledlayout(2,1)
sgtitle(["Theoretical input impedance as a function of signal frequency","4.5m transmission line, Z_{0}=50[\Omega], Z_{L}=200[\Omega]"]);
nexttile
plot(freqs,real(Z_ins))
ylabel(['Real Z_{in} [\Omega]']);
xlabel("Frequency [Hz]")
nexttile
plot(freqs,imag(Z_ins))
ylabel(['Imag Z_{in} [\Omega]']);
xlabel("Frequency [Hz]")

function [GAMMA_in, Z_in] = Params(Z_l, Z_0, L, U_p, f)
     wavelength = U_p/f;
     bl = 2*pi*(L/wavelength);
     GAMMA_l = (Z_l-Z_0)/(Z_l+Z_0);
     GAMMA_in = GAMMA_l*exp(-2i*bl);
     Z_in = Z_0*((Z_l+(1i*Z_0*tan(bl)))/(Z_0+(1i*Z_l*tan(bl))));
end