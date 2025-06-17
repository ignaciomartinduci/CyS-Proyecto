%% Muestro y filtro Pasa bajos

CPU_frequency = 6000; % [Hz] frecuencia de la cpu del controlador
sampling_frequency = 40; % [Hz] tasa de muestreo del sistema


max_freq = sampling_frequency/2; % [Hz] frecuencia máxima a conservar del sistema
filter_RC = 1/(max_freq*2*pi); 

