
%% Parámetros del motor de corriente continua: (NO DEFINIDO AUN)

m_3 = 1; % [kg] Masa del acoplamiento
d_3 = 0.1; % [m] Diametro del acoplamiento
L_a3 = 5*10^-3; % [H] Inductancia.
r_a3_20 = 1.2; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e3 = 0.025; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t3 = 0.025; % [N m / A] constante de torque de la PMDC.
r_3 = 200; % [-] relación de transmisión del reductor.
J_3 = 1.5 * 10^-3; % [kg m^2] inercia rotacional a la salida del rotor.
b_m3 = .1; % [kg m^2 / s] viscosidad dinámica.
J_eq_3 = J_3 + 1/8 * m_3 * d_3^2;


C_t3 = 0.8; % [J/ºC] Capacitancia térmica del estator 
res_term_3 = 146.7; % [ºC/W] Resistencia térmica estator - ambiente 
alpha_cu = 3.9 *10^-3; % [1/ºC] Coeficiente de aumento de R_s con Temp_s 




