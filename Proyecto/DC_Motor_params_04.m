    
%% Parámetros del ACCIONAMIENTO 4:

voltage_4 = 12; % [V] Alimentación Vcc. 

pitch_4 = 0.25; % [m] Paso del tornillo sinfín 

r_4 = 51; % [-] relación de transmisión del reductor.
J_r4 = 1.1975 * 10^-6; % [kg m^2] inercia del reductor

enc_chn_4 = 3; % [-] cantidad de canales del encoder
enc_ppr_4 = 1024; % [p/rpm] Pulsos por revolución del encoder
enc_J_4 = 0.005 * 10^-6; % [kg m^2] inercia del encoder

d_4 = 0.02; % [m] Diametro del acoplamiento
l_4 = 0.3; % [m] Longitud del acoplamiento
m_4 = pi*d_4^2/4*l_4*AISI_316_rho; % [kg] Masa del acoplamiento
L_a4 = 0.0336*10^-3; % [H] Inductancia.
r_a4_20 = 0.108; % [Ohm] Resistencia óhmica del devandado a 20 grados.
k_e4 = 0.0156; % [V / (rad/s)] constante de fuerza contraelectromotríz.
k_t4 = 0.0156; % [N m / A] constante de torque de la PMDC.
J_4 = 7.76 * 10^-6; % [kg m^2] inercia rotacional a la salida del rotor.
J_eq4 = enc_J_4 + J_r4 + J_4 + 1/8 * m_4 * d_4^2 / r_4^2;

tao_ts_amb_4 = 882; % [s] Constante de tiempo de temperatura housing-ambient
res_term_4 = 9.58; % [ºC/W] Resistencia térmica estator - ambiente 
C_t4 = tao_ts_amb_4/res_term_4; % [J/ºC] Capacitancia térmica del estator 
alpha_cu = 3.9 *10^-3; % [1/ºC] Coeficiente de aumento de R_s con Temp_s 

% Datos experimentales

b_m4 = .3; % [kg m^2 / s] viscosidad dinámica.


