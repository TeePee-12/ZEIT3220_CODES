
polz = [90  , 78.75, 67.5, 56.25, 45 , 33.75, 22.5 , 11.25, 0  ];
gain = [-187, -61  , -55 , -52  , -49, -48  , -47.5, -47  , -46];

figure (1)
plot(polz,gain)
legend("8.5 GHz")
xlabel('Polarization Angle (Relative to Vertical) [Deg]');
ylabel('Signal Magnitude (F-Parameters) [dB]');
title("Received Signal Amplitude as Incident Wave Polarization Changes at 8.5GHz")
saveas(figure(1), "polarization.svg");

polz = [90  , 67.5, 45 ,22.5 , 0  ];
angl = [-90, -85 , -81, -63 , -46];

figure (2)
plot(polz,angl)
legend("8.5 GHz")
xlabel('Incident Wave  Angle (Relative to Horn Apperture Normal) [Deg]');
ylabel('Signal Magnitude (F-Parameters) [dB]');
title("Received Signal Amplitude as Incident Wave Angle of Incidence Changes at 8.5GHz")
saveas(figure(2), "incidentangle.svg");