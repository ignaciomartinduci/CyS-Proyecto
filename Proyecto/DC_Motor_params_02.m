
%% Parámetros del motor de corriente continua: (NO DEFINIDO AUN)

voltage_2 = 110; % [V] Alimentación Vcc. 

pitch_2 = 0.005; % [m] paso del tornillo sinfín.

d_2 = 0.07; % [m] Diametro del acoplamiento
l_2 = 0.3; % [m] Longitud del acoplamiento
m_2 = AISI_316_rho*pi*d_2^2/4*l_2; % [kg] Masa del acoplamiento
L_a2 = 3*10^-3; % [H] Inductancia.
r_a2_20 = 0.25; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e2 = 0.56; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t2 = 0.56; % [N m / A] constante de torque de la PMDC.
r_2 = 5; % [-] relación de transmisión del reductor.
J_2 = 1.34 * 10^-4; % [kg m^2] inercia rotacional a la salida del rotor.
b_m2 = .01; % [kg m^2 / s] viscosidad dinámica.
J_eq2 = J_2 + 1/8 * m_2 * d_2^2 / r_2^2;

C_t2 = 66.49;       % [J/ºC] Capacitancia térmica del devanado (estator)
res_term_2 = 3.15;  % [ºC/W] Resistencia térmica total estator - ambiente
alpha_cu = 3.9e-3;  % [1/ºC] Coeficiente térmico del cobre

enc_ppr_2 = 1024; % [pulsos/rev] Pulsos por revolución del encoder

K_r2 = 300000; % [N/m] Constante de resorte de tope