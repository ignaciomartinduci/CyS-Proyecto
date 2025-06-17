
%% DISEÑO DE CONTROLADOR PID_1 
    % Requisitos temporales de diseño

    T_s1 = 0.3;
    M_p1 = 0;

    T_s2 = 0.5;
    M_p2 = 0;

    T_s3 = 2;
    M_p3 = 10;

    T_s4 = 0.5;
    M_p4 = 0;

    %% Diseño PID - Ziegler-Nichols

    %% MOTOR 1

    K_p1 = 6.6674; 
    K_d1 = 0.022261;
    K_i1 = 0;


    %% MOTOR 2

    K_p2 = 15.5368; 
    K_d2 = 0.07064;
    K_i2 = 0;


    %% MOTOR 3

    K_p3 = 0; 
    K_d3 = 0;
    K_i3 = 0.4131;


    %% MOTOR 4

    K_p4 = 2.44; 
    K_d4 = 0;
    K_i4 = 0;


if TUNE_PID_DESIGN(1) == 1

    disp("Configurando PID 1");

    G_p1 = tf([k_t1],[L_a1*J_eq1,J_eq1*r_a1_20+b_m1*L_a1,b_m1*r_a1_20+k_e1*k_t1,0]);
    G_c1 = pidtune(G_p1,'PD');

    pidTuner(G_p1,G_c1);

    disp("== Detenido, pulsa para configurar siguiente PID");
    input('');

end
if TUNE_PID_DESIGN(2) == 1

    disp("Configurando PID 2");

    G_p2 = tf([k_t2],[L_a2*J_eq2,J_eq2*r_a2_20+b_m2*L_a2,b_m2*r_a2_20+k_e2*k_t2,0]);
    G_c2 = pidtune(G_p2,'PD');

    pidTuner(G_p2,G_c2);

    disp("== Detenido, pulsa para configurar siguiente PID");
    input('');

end
if TUNE_PID_DESIGN(3) == 1

    disp("Configurando PID 3");

    G_p3 = tf([k_t3],[L_a3*J_eq3,J_eq3*r_a3_20+b_m3*L_a3,b_m3*r_a3_20+k_e3*k_t3]);
    G_c3 = pidtune(G_p3,'PI');

    pidTuner(G_p3,G_c3);

    disp("== Detenido, pulsa para configurar siguiente PID");
    input('');

end
if TUNE_PID_DESIGN(4) == 1

    disp("Configurando PID 4");

    G_p4 = tf([k_t4],[L_a4*J_eq4,J_eq4*r_a4_20+b_m4*L_a4,b_m4*r_a4_20+k_e4*k_t4,0]);
    G_c4 = pidtune(G_p4,'PD');

    pidTuner(G_p4,G_c4);

    
    if STEPS
    
        disp("== detendio, pulsar para continuar ==");
        input('');
    
    end

end
    




