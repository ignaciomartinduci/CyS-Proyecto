
%% Parámetros del motor de corriente continua: (NO DEFINIDO AUN)

voltage_1 = 12; % [V] Alimentación Vcc. 

d_1 = 0.02; % [m] Diametro del acoplamiento
l_1 = 0.3; % [m] Longitud del acoplamiento
m_1 = AISI_316_rho*pi*d_1^2/4*l_1; % [kg] Masa del acoplamiento
L_a1 = 7.5*10^-3; % [H] Inductancia.
r_a1_20 = 0.5; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e1 = 0.25; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t1 = 0.25; % [N m / A] constante de torque de la PMDC.
r_1 = 25; % [-] relación de transmisión del reductor.
J_1 = 7.7 * 10^-6; % [kg m^2] inercia rotacional a la salida del rotor.
b_m1 = .01; % [kg m^2 / s] viscosidad dinámica.
J_eq1 = J_1 + 1/8 * m_1 * d_1^2 / r_1^2;

C_t1 = 19.57;       % [J/ºC] Capacitancia térmica del estator (devanado)
res_term_1 = 9.58;  % [ºC/W] Resistencia térmica estator - ambiente
alpha_cu = 3.9e-3;  % [1/ºC] Coeficiente térmico del cobre

enc_ppr_1 = 1024; % [pulsos/rev] Pulsos por revolución del encoder

m_motor1 = 2.5; % [kg] Masa del motor
m_accionamiento_1 = m_1 + m_motor1; % [kg] Masa total motor + acoplamiento

