    
%% Parámetros del motor de corriente continua:

voltage_3 = 220; % [V] Alimentación Vcc. 


d_3 = 0.1; % [m] diamentro del acoplamiento, exagerado para incluir muelas
l_3 = 0.5; % [m] longitud del acoplamiento

m_3 = AISI_316_rho*pi*d_3^2/4*l_3; % [kg] Masa del acoplamiento
L_a3 = 5*10^-3; % [H] Inductancia.
r_a3_20 = 0.35; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e3 = 0.3; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t3 = 0.3; % [N m / A] constante de torque de la PMDC.
r_3 = 2; % [-] relación de transmisión del reductor.
J_3 = 1.5 * 10^-3; % [kg m^2] inercia rotacional a la salida del rotor.
b_m3 = .001; % [kg m^2 / s] viscosidad dinámica.
J_eq3 = J_3 + 1/8 * m_3 * d_3^2 / r_3^2; 


C_t3 = 50; % [J/ºC] Capacitancia térmica del estator 
res_term_3 = 0.1; % [ºC/W] Resistencia térmica estator - ambiente (Pequeña porque hay refrigeración)
alpha_cu = 3.9 *10^-3; % [1/ºC] Coeficiente de aumento de R_s con Temp_s 

sensibilidad_sensor_3 = 0.030; % [V/(rev/s)] Sensibilidad del sensor de velocidad 


