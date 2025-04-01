
%% Parámetros del motor de corriente continua: (NO DEFINIDO AUN)

m_1 = 1; % [kg] Masa del acoplamiento
d_1 = 0.1; % [m] Diametro del acoplamiento
L_a1 = 5*10^-3; % [H] Inductancia.
r_a1_20 = 1.2; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e1 = 0.025; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t1 = 0.025; % [N m / A] constante de torque de la PMDC.
r_1 = 200; % [-] relación de transmisión del reductor.
J_1 = 1.5 * 10^-3; % [kg m^2] inercia rotacional a la salida del rotor.
b_m1 = .1; % [kg m^2 / s] viscosidad dinámica.
J_eq_1 = J_1 + 1/8 * m_1 * d_1^2;


C_t1 = 0.8; % [J/ºC] Capacitancia térmica del estator 
res_term_1 = 146.7; % [ºC/W] Resistencia térmica estator - ambiente 
alpha_cu = 3.9 *10^-3; % [1/ºC] Coeficiente de aumento de R_s con Temp_s 




