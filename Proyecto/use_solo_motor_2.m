
sim_start_time = 0;
sim_end_time = 5;
sim_max_step = 1e-2;
sim_t = 0.5*(sim_start_time:sim_end_time*10)';

%% PRIMERA PARTE: HOMING

conv_2=180/pi;

if TUNE_PID

    sim_t = 0.001*(sim_start_time:sim_end_time*1000)';


    theta_m0_2 = 0/conv_2;
    T_s0_2 = 20;
    
    sim_T_l2 = ones(size(sim_t))*0;
    sim_theta_m2_cons = ones(size(sim_t))*0;
    sim_T_amb2 = ones(size(sim_t))*20;
    
    for i=1:length(sim_t)

        if i < length(sim_t)/2

            sim_theta_m2_cons(i) = 0;

        else

            sim_theta_m2_cons(i) = 180/conv_2;

        end


    end
    
    sim_data_in = [sim_T_l2, sim_theta_m2_cons, sim_T_amb2];
        
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Tunning PID motor 2")
    
    end
    
    sim('motor_2.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Tunning PID motor 2")
    
    end

else

    pos_0_2 = 0; % [m] Límite inferior de la carrera lineal del motor 2
    pos_1_2 = 0.30; % [m] Límite inferior de la carrera lineal del motor 2
    
    conv_2 = r_2/pitch_2;

    theta_m0_2 = pi;
    T_s0_2 = 20;
    
    sim_T_l2 = ones(size(sim_t))*0;
    sim_theta_m2_cons = ones(size(sim_t))*0;
    sim_T_amb2 = ones(size(sim_t))*0;
    
    sim_T_l2(1) = 0;
    sim_T_l2(2) = 0;
    sim_T_l2(3) = 0;
    sim_T_l2(4) = 0;
    sim_T_l2(5) = 0;
    sim_T_l2(6) = 0;
    sim_T_l2(7) = 0;
    sim_T_l2(8) = 0;
    sim_T_l2(9) = 0;
    sim_T_l2(10) = 0;
    sim_T_l2(11) = 0;
    
    sim_theta_m2_cons(1) = 0;
    sim_theta_m2_cons(2) = 0;
    sim_theta_m2_cons(3) = 0;
    sim_theta_m2_cons(4) = 0;
    sim_theta_m2_cons(5) = 0;
    sim_theta_m2_cons(6) = 0;
    sim_theta_m2_cons(7) = 0;
    sim_theta_m2_cons(8) = 0;
    sim_theta_m2_cons(9) = 0;
    sim_theta_m2_cons(10) = 0;
    sim_theta_m2_cons(11) = 0;
    
    sim_T_amb2(1) = 20;
    sim_T_amb2(2) = 20;
    sim_T_amb2(3) = 20;
    sim_T_amb2(4) = 20;
    sim_T_amb2(5) = 20;
    sim_T_amb2(6) = 20;
    sim_T_amb2(7) = 20;
    sim_T_amb2(8) = 20;
    sim_T_amb2(9) = 20;
    sim_T_amb2(10) = 20;
    sim_T_amb2(11) = 20;
    
    sim_data_in = [sim_T_l2, sim_theta_m2_cons, sim_T_amb2];
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Homing motor 2")
    
    end
    
    sim('motor_2.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Homing motor 2")
    
    end

    if SENSOR_TEST

       disp("SNR MOTOR 2")
       sensor_test;

    end

end

% Impresión de resultados

if ENABLE_GRAPHS

    figure;

    hold on;
    subplot(2,1,1)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
    legend("v_{a2}");
    xlabel("time [s]");
    ylabel("Voltage [V]");
    grid minor;
    title("Input: Armature Voltage for Motor 2");
    
    subplot(2,1,2)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
    legend("T_{l2}");
    xlabel("time [s]");
    ylabel("Load Torque [N m]");
    grid minor;
    title("Input: Load Torque for Motor 2");
    
    figure;
    
    subplot(2,1,1)
    plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
    title("Output: Angular Position of Motor 2");
    legend("theta_{m2}"); 
    xlabel("time [s]");
    ylabel("Angular position [rad]");
    grid minor;
    
    subplot(2,1,2)
    plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
    title("Output: Armature Current for Motor 2");
    legend("i_{a2}");
    xlabel("time [s]");
    ylabel("Armature Current [A]");
    grid minor;

    figure;

    subplot(2,1,1)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)*conv_2);
    hold on;
    plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)*conv_2);
    title("Posición angular consigna y medida MOTOR 2 DC");
    xlabel("time [s]");
    ylabel("Angular position [º]");
    legend(["Input: theta_{m*}","theta_{m}"]);
    grid minor;
    hold off;

    subplot(2,1,2)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)*conv_2 - ans.simulationOut.Data(:,1)*conv_2);
    title("Error en posición angular");
    legend("e");
    xlabel("time [s]");
    ylabel("Angular Position [º]");
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

