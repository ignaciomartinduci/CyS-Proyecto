
sim_start_time = 0;
sim_end_time = 10;
sim_max_step = 1e-2;

%% PRIMERA PARTE: GIRO CON CARGA

conv_1=180/pi;

if TUNE_PID

    sim_t = 0.001*(sim_start_time:sim_end_time*1000)';


    theta_m0_1 = 0/conv_1;
    T_s0_1 = 20;
    
    sim_T_l1 = ones(size(sim_t))*0;
    sim_theta_m1_cons = ones(size(sim_t))*0;
    sim_T_amb1 = ones(size(sim_t))*20;
    
    for i=1:length(sim_t)

        if i < length(sim_t)/2

            sim_theta_m1_cons(i) = 0;

        else

            sim_theta_m1_cons(i) = 180/conv_1;

        end


    end
    
    sim_data_in = [sim_T_l1, sim_theta_m1_cons, sim_T_amb1];
        
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Tunning PID motor 1")
    
    end
    
    sim('motor_1.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Tunning PID motor 1")
    
    end

else

    sim_t = 0.5*(sim_start_time:sim_end_time*1)';

    theta_m0_1 = 0/conv_1;
    T_s0_1 = 20;
    
    sim_T_l1 = ones(size(sim_t))*0;
    sim_theta_m1_cons = ones(size(sim_t))*0;
    sim_T_amb1 = ones(size(sim_t))*0;
    
    sim_T_l1(1) = 8.2;
    sim_T_l1(2) = 8.2;
    sim_T_l1(3) = 8.2;
    sim_T_l1(4) = 8.2;
    sim_T_l1(5) = 8.2;
    sim_T_l1(6) = 8.2;
    sim_T_l1(7) = 8.2;
    sim_T_l1(8) = 8.2;
    sim_T_l1(9) = 8.2;
    sim_T_l1(10) = 8.2;
    sim_T_l1(11) = 8.2;
    
    sim_theta_m1_cons(1) = 10/conv_1;
    sim_theta_m1_cons(2) = 20/conv_1;
    sim_theta_m1_cons(3) = 30/conv_1;
    sim_theta_m1_cons(4) = 40/conv_1;
    sim_theta_m1_cons(5) = 50/conv_1;
    sim_theta_m1_cons(6) = 60/conv_1;
    sim_theta_m1_cons(7) = 70/conv_1;
    sim_theta_m1_cons(8) = 80/conv_1;
    sim_theta_m1_cons(9) = 90/conv_1;
    sim_theta_m1_cons(10) = 100/conv_1;
    sim_theta_m1_cons(11) = 110/conv_1;
    
    sim_T_amb1(1) = 20;
    sim_T_amb1(2) = 20;
    sim_T_amb1(3) = 20;
    sim_T_amb1(4) = 20;
    sim_T_amb1(5) = 20;
    sim_T_amb1(6) = 20;
    sim_T_amb1(7) = 20;
    sim_T_amb1(8) = 20;
    sim_T_amb1(9) = 20;
    sim_T_amb1(10) = 20;
    sim_T_amb1(11) = 20;
    
    sim_data_in = [sim_T_l1, sim_theta_m1_cons, sim_T_amb1];
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Giro con carga motor 1")
    
    end
    
    sim('motor_1.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Giro con carga motor 1")
    
    end

    if SENSOR_TEST

       disp("SNR MOTOR 1")
       sensor_test;

    end

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
    title("Input: Armature Voltage for Motor 1");
    
    subplot(2,1,2)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
    legend("T_{l1}");
    xlabel("time [s]");
    ylabel("Load Torque [N m]");
    grid minor;
    title("Input: Load Torque for Motor 1");
    
    figure;
    
    subplot(2,1,1)
    plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
    title("Output: Angular Position of Motor 1");
    legend("theta_{m1}"); 
    xlabel("time [s]");
    ylabel("Angular position [rad]");
    grid minor;
    
    subplot(2,1,2)
    plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
    title("Output: Armature Current for Motor 1");
    legend("i_{a1}");
    xlabel("time [s]");
    ylabel("Armature Current [A]");
    grid minor;

    figure;

    subplot(2,1,1)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)*conv_1);
    hold on;
    plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)*conv_1);
    title("Posición angular consigna y medida MOTOR 1 DC");
    xlabel("time [s]");
    ylabel("Angular position [º]");
    legend(["Input: theta_{m*}","theta_{m}"]);
    grid minor;
    hold off;

    subplot(2,1,2)
    plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)*conv_1 - ans.simulationOut.Data(:,5)*conv_1);
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

