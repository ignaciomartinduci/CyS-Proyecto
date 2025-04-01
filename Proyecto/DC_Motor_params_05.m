
%% Parámetros del motor de corriente continua: (NO DEFINIDO AUN)

m_5 = 1; % [kg] Masa del acoplamiento
d_5 = 0.1; % [m] Diametro del acoplamiento
L_a5 = 5*10^-3; % [H] Inductancia.
r_a5_20 = 1.2; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e5 = 0.025; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t5 = 0.025; % [N m / A] constante de torque de la PMDC.
r_5 = 200; % [-] relación de transmisión del reductor.
J_5 = 1.5 * 10^-3; % [kg m^2] inercia rotacional a la salida del rotor.
b_m5 = .1; % [kg m^2 / s] viscosidad dinámica.
J_eq_5 = J_5 + 1/8 * m_5 * d_5^2;


C_t5 = 0.8; % [J/ºC] Capacitancia térmica del estator 
res_term_5 = 146.7; % [ºC/W] Resistencia térmica estator - ambiente 
alpha_cu = 3.9 *10^-3; % [1/ºC] Coeficiente de aumento de R_s con Temp_s 




