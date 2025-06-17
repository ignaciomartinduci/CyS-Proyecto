
%% NOTA -> EL RUIDO MECÁNICO -NO- SE INCORPORA EN LA ETAPA DE MEDICION Y ADC

%% MOTOR 1

mechanical_noise_freq_1 = 10; % [Hz] Frecuencia de ruido mecánica
mechanical_noise_power_1 = 1*360/enc_ppr_1*5; % [var] Amplitud del rudio mecánico

electrical_noise_freq_1 = sampling_frequency/100; % [Hz] Frecuencia de ruido mecánica
electrical_noise_power_1 = 1*360/enc_ppr_1*5; % [var] Amplitud del rudio mecánico

jitter_1 = 360/enc_ppr_1;

%% MOTOR 2

mechanical_noise_freq_2 = 10; % [Hz] Frecuencia de ruido mecánica
mechanical_noise_power_2 = 360/enc_ppr_2; % [var] Amplitud del rudio mecánico

electrical_noise_freq_2 = sampling_frequency; % [Hz] Frecuencia de ruido mecánica
electrical_noise_power_2 = 360/enc_ppr_2; % [var] Amplitud del rudio mecánico

jitter_2 = 360/enc_ppr_2;

%% MOTOR 3

mechanical_noise_freq_3 = 10; % [Hz] Frecuencia de ruido mecánica
mechanical_noise_power_3 = sensibilidad_sensor_3; % [var] Amplitud del rudio mecánico

electrical_noise_freq_3 = sampling_frequency; % [Hz] Frecuencia de ruido mecánica
electrical_noise_power_3 = sensibilidad_sensor_3; % [var] Amplitud del rudio mecánico

jitter_3 = sensibilidad_sensor_3;

%% MOTOR 4

mechanical_noise_freq_4 = 10; % [Hz] Frecuencia de ruido mecánica
mechanical_noise_power_4 = 360/enc_ppr_4; % [var] Amplitud del rudio mecánico

electrical_noise_freq_4 = sampling_frequency; % [Hz] Frecuencia de ruido mecánica
electrical_noise_power_4 = 360/enc_ppr_4; % [var] Amplitud del rudio mecánico

jitter_4 = 360/enc_ppr_4;

