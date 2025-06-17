
sensor_test_enter = 1;

s_signal = std(ans.simulationOut.Data(:,4));

signal_noise = ans.simulationOut.Data(:,1)-ans.simulationOut.Data(:,4);

signal_filtered = ans.simulationOut.Data(:,5)-ans.simulationOut.Data(:,4);

s_signal_noise = std(signal_noise);
s_signal_filtered = std(signal_filtered);

SNR_noise = 10*log10(s_signal^2/s_signal_noise^2);
SNR_filtered = 10*log10(s_signal^2/s_signal_filtered^2);

disp(SNR_noise);

disp("Luego del filtro: ");

disp(SNR_filtered);

