max_temp_s = 172; % [ºC] Maxima temperatura admisible de estator
control_temp_s = max_temp_s *0.75; % [ºC] Temperatura a la que comienza el derating


% control_temp_s = 22.5; Habilitar para pruebas

max_current = 6; % [A] Máxima corriente admisible
max_current_3 = 18; % [A] Para Motor 3 BLDC
factor_derating = 1; % [-] Factor de amplificación de la reducción de ganancias

if DERATING == 0

    control_temp_s = 10000;
    
end

if CURRENT_LIMIT == 0

    max_current = 10000; 
    max_current_3 = 10000;

end