
sim_start_time = 0;
sim_end_time = 3;
sim_max_step = 1e-2;
sim_t = 0.5*(sim_start_time:sim_end_time*10)';

%% PRIMERA PARTE -> HOMING

conv_4_2 = 180/pi;
conv_4 = r_4/pitch_4;

if TUNE_PID

    sim_t = 0.001*(sim_start_time:sim_end_time*1000)';
    
    theta_m4_0 = 0;

    sim_theta_m4_0 = 0;
    T_s4_0 = 20;
    
    sim_F_l4 = ones(size(sim_t))*0;
    sim_theta_m4_cons = ones(size(sim_t))*0;
    sim_T_amb4 = ones(size(sim_t))*20;
    
    for i=1:length(sim_t)

        if i < length(sim_t)/2

            sim_theta_m4_cons(i) = 0;

        else

            sim_theta_m4_cons(i) = 360/conv_4_2;

        end


    end
    
    sim_data_in = [sim_F_l4, sim_theta_m4_cons, sim_T_amb4];
        
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Tunning PID motor 4")
    
    end
    
    sim('motor_4.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Tunning PID motor 4")
    
    end
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a1}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 4");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l1}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 4");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
        title("Output: Angular Position of Motor 4");
        legend("theta_{m1}"); 
        xlabel("time [s]");
        ylabel("Angular position [rad]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 4");
        legend("i_{a1}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4);
        title("Comparación: x_{m*}, x_{m} MOTOR 4 DC"); 
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_4);
        legend(["x_{m*}","x_{m}"]);
        xlabel("time [s]");
        ylabel("Liner position [m]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4 - ans.simulationOut.Data(:,4)/conv_4);
        title("Error en posición lineal");
        legend("e");
        xlabel("time [s]");
        ylabel("Linear position [m]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,5));
        title("Input: Ambient Temperature");
        legend("T_{amb}");
        xlabel("time [s]");
        ylabel("Temperature [ºC ]");
        grid minor;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,3));
        title("Output: Armature Temperature");
        legend("e");
        xlabel("time [s]");
        ylabel("Temperature [ºC]");
        grid minor;
    
    
    end
    
    
    if STEPS
    
        disp("== detendio, pulsar para continuar ==");
        input('');
    
    end

else

    % Condiciones iniciales
    
    pos_0_4 = 0; % [m] Límite inferior de la carrera lineal del motor 4
    pos_1_4 = 0.05; % [m] Límite superior de la carrera lineal del motor 4
        
    rand_lim_1 = pos_0_4*conv_4; % [rad] 
    rand_lim_2 = pos_1_4*conv_4; % [rad]
    n_rand = (rand_lim_2-rand_lim_1)*rand(1,1) + rand_lim_1;
    
    
    theta_m4_0 = n_rand;
    T_s4_0 = 25;
    
    % Inputs
    
    sim_F_l4 = ones(size(sim_t))*0;
    sim_theta_m4_cons = ones(size(sim_t))*0;
    sim_T_amb4 = ones(size(sim_t))*0;
    
    
    sim_F_l4(1) = 0;
    sim_F_l4(2) = 0;
    sim_F_l4(3) = 0;
    sim_F_l4(4) = 0;
    sim_F_l4(5) = 0;
    sim_F_l4(6) = 0;
    sim_F_l4(7) = 0;
    sim_F_l4(8) = 0;
    sim_F_l4(9) = 0;
    sim_F_l4(10) = 0;
    sim_F_l4(11) = 0;
    
    sim_theta_m4_cons(1) = pos_0_4*conv_4;
    sim_theta_m4_cons(2) = pos_0_4*conv_4;
    sim_theta_m4_cons(3) = pos_0_4*conv_4;
    sim_theta_m4_cons(4) = pos_0_4*conv_4;
    sim_theta_m4_cons(5) = pos_0_4*conv_4;
    sim_theta_m4_cons(6) = pos_0_4*conv_4;
    sim_theta_m4_cons(7) = pos_0_4*conv_4;
    sim_theta_m4_cons(8) = pos_0_4*conv_4;
    sim_theta_m4_cons(9) = pos_0_4*conv_4;
    sim_theta_m4_cons(10) = pos_0_4*conv_4;
    sim_theta_m4_cons(11) = pos_0_4*conv_4;
    
    sim_T_amb4(1) = 20;
    sim_T_amb4(2) = 20;
    sim_T_amb4(3) = 20;
    sim_T_amb4(4) = 20;
    sim_T_amb4(5) = 20;
    sim_T_amb4(6) = 20;
    sim_T_amb4(7) = 20;
    sim_T_amb4(8) = 20;
    sim_T_amb4(9) = 20;
    sim_T_amb4(10) = 20;
    sim_T_amb4(11) = 20;
    
    sim_data_in = [sim_F_l4, sim_theta_m4_cons, sim_T_amb4];
    
    % Simulación
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Homing motor 4")
    
    end
    
    sim('motor_4.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Homing motor 4")
    
    end

    if SENSOR_TEST

       disp("SNR MOTOR 4")
       sensor_test;

    end
    
    % Impresión de resultados
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a1}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 4");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l1}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 4");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
        title("Output: Angular Position of Motor 4");
        legend("theta_{m1}"); 
        xlabel("time [s]");
        ylabel("Angular position [rad]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 4");
        legend("i_{a1}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4);
        title("Comparación: x_{m*}, x_{m} MOTOR 4 DC"); 
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_4);
        legend(["x_{m*}","x_{m}"]);
        xlabel("time [s]");
        ylabel("Liner position [m]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4 - ans.simulationOut.Data(:,4)/conv_4);
        title("Error en posición lineal");
        legend("e");
        xlabel("time [s]");
        ylabel("Linear position [m]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,5));
        title("Input: Ambient Temperature");
        legend("T_{amb}");
        xlabel("time [s]");
        ylabel("Temperature [ºC ]");
        grid minor;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,3));
        title("Output: Armature Temperature");
        legend("e");
        xlabel("time [s]");
        ylabel("Temperature [ºC]");
        grid minor;
    
    
    end
    
    if STEPS
    
        disp("== detendio, pulsar para continuar ==");
        input('');
    
    end
    
    %% SEGUNDA PARTE -> AJUSTE DE LENTE
    
    theta_m4_0 = ans.simulationOut.data(end,1);
    T_s4_0 = ans.simulationOut.data(end,3);
    
    sim_F_l4(1) = 0;
    sim_F_l4(2) = 0;
    sim_F_l4(3) = 0;
    sim_F_l4(4) = 0;
    sim_F_l4(5) = 0;
    sim_F_l4(6) = 0;
    sim_F_l4(7) = 0;
    sim_F_l4(8) = 0;
    sim_F_l4(9) = 0;
    sim_F_l4(10) = 0;
    sim_F_l4(11) = 0;
    
    sim_theta_m4_cons(1) = pos_1_4*conv_4;
    sim_theta_m4_cons(2) = pos_1_4*conv_4;
    sim_theta_m4_cons(3) = pos_1_4*conv_4;
    sim_theta_m4_cons(4) = pos_1_4*conv_4;
    sim_theta_m4_cons(5) = pos_1_4*conv_4;
    sim_theta_m4_cons(6) = pos_1_4*conv_4;
    sim_theta_m4_cons(7) = pos_1_4*conv_4;
    sim_theta_m4_cons(8) = pos_1_4*conv_4;
    sim_theta_m4_cons(9) = pos_1_4*conv_4;
    sim_theta_m4_cons(10) = pos_1_4*conv_4;
    sim_theta_m4_cons(11) = pos_1_4*conv_4;
    
    
    sim_T_amb4(1) = 20;
    sim_T_amb4(2) = 20;
    sim_T_amb4(3) = 20;
    sim_T_amb4(4) = 20;
    sim_T_amb4(5) = 20;
    sim_T_amb4(6) = 20;
    sim_T_amb4(7) = 20;
    sim_T_amb4(8) = 20;
    sim_T_amb4(9) = 20;
    sim_T_amb4(10) = 20;
    sim_T_amb4(11) = 20;
    
    sim_data_in = [sim_F_l4, sim_theta_m4_cons, sim_T_amb4];
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Ajuste de lente con motor 4")
    
    end
    
    sim('motor_4.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Ajuste de lente con motor 4")
    
    end

    if SENSOR_TEST

       disp("SNR MOTOR 4")
       sensor_test;

    end
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a1}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 4");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l1}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 4");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
        title("Output: Angular Position of Motor 4");
        legend("theta_{m1}"); 
        xlabel("time [s]");
        ylabel("Angular position [rad]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 4");
        legend("i_{a1}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4);
        title("Comparación: x_{m*}, x_{m} MOTOR 4 DC"); 
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_4);
        legend(["x_{m*}","x_{m}"]);
        xlabel("time [s]");
        ylabel("Liner position [m]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4 - ans.simulationOut.Data(:,4)/conv_4);
        title("Error en posición lineal");
        legend("e");
        xlabel("time [s]");
        ylabel("Linear position [m]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,5));
        title("Input: Ambient Temperature");
        legend("T_{amb}");
        xlabel("time [s]");
        ylabel("Temperature [ºC ]");
        grid minor;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,3));
        title("Output: Armature Temperature");
        legend("e");
        xlabel("time [s]");
        ylabel("Temperature [ºC]");
        grid minor;
    
    
    end
    
    if STEPS
    
        disp("== detendio, pulsar para continuar ==");
        input('');
    
    end
    
    %% TERCERA PARTE -> RESISTENCIA A ESFUERZO MAXIMO DE CORTE
    
    theta_m4_0 = ans.simulationOut.data(end,1);
    T_s4_0 = ans.simulationOut.data(end,3);
    
    sim_F_l4(1) = 8.2*2*pi/pitch_4;
    sim_F_l4(2) = 8.2*2*pi/pitch_4;
    sim_F_l4(3) = 8.2*2*pi/pitch_4;
    sim_F_l4(4) = 8.2*2*pi/pitch_4;
    sim_F_l4(5) = 8.2*2*pi/pitch_4;
    sim_F_l4(6) = 8.2*2*pi/pitch_4;
    sim_F_l4(7) = 8.2*2*pi/pitch_4;
    sim_F_l4(8) = 8.2*2*pi/pitch_4;
    sim_F_l4(9) = 8.2*2*pi/pitch_4;
    sim_F_l4(10) = 8.2*2*pi/pitch_4;
    sim_F_l4(11) = 8.2*2*pi/pitch_4;
    
    sim_theta_m4_cons(1) = pos_1_4*conv_4;
    sim_theta_m4_cons(2) = pos_1_4*conv_4;
    sim_theta_m4_cons(3) = pos_1_4*conv_4;
    sim_theta_m4_cons(4) = pos_1_4*conv_4;
    sim_theta_m4_cons(5) = pos_1_4*conv_4;
    sim_theta_m4_cons(6) = pos_1_4*conv_4;
    sim_theta_m4_cons(7) = pos_1_4*conv_4;
    sim_theta_m4_cons(8) = pos_1_4*conv_4;
    sim_theta_m4_cons(9) = pos_1_4*conv_4;
    sim_theta_m4_cons(10) = pos_1_4*conv_4;
    sim_theta_m4_cons(11) = pos_1_4*conv_4;
    
    
    sim_T_amb4(1) = 20;
    sim_T_amb4(2) = 20;
    sim_T_amb4(3) = 20;
    sim_T_amb4(4) = 20;
    sim_T_amb4(5) = 20;
    sim_T_amb4(6) = 20;
    sim_T_amb4(7) = 20;
    sim_T_amb4(8) = 20;
    sim_T_amb4(9) = 20;
    sim_T_amb4(10) = 20;
    sim_T_amb4(11) = 20;
    
    sim_data_in = [sim_F_l4, sim_theta_m4_cons, sim_T_amb4];
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Corte de lente - efectos en motor 4")
    
    end
    
    sim('motor_4.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Corte de lente - efectos en motor 4")
    
    end

    if SENSOR_TEST

       disp("SNR MOTOR 4")
       sensor_test;

    end
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a1}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 4");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l1}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 4");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
        title("Output: Angular Position of Motor 4");
        legend("theta_{m1}"); 
        xlabel("time [s]");
        ylabel("Angular position [rad]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 4");
        legend("i_{a1}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4);
        title("Comparación: x_{m*}, x_{m} MOTOR 4 DC"); 
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_4);
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,1)/conv_3);
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,5)/conv_4);
        legend(["x_{m*}","x_{m}"]);
        xlabel("time [s]");
        ylabel("Liner position [m]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_4 - ans.simulationOut.Data(:,4)/conv_4);
        title("Error en posición lineal");
        legend("e");
        xlabel("time [s]");
        ylabel("Linear position [m]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,5));
        title("Input: Ambient Temperature");
        legend("T_{amb}");
        xlabel("time [s]");
        ylabel("Temperature [ºC ]");
        grid minor;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,3));
        title("Output: Armature Temperature");
        legend("e");
        xlabel("time [s]");
        ylabel("Temperature [ºC]");
        grid minor;
    
    
    end
    
    
    if STEPS
    
        disp("== detendio, pulsar para continuar ==");
        input('');
    
    end

end

