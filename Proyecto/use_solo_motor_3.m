
sim_start_time = 0;
sim_end_time = 3;
sim_max_step = 1e-2;
sim_t = 0.5*(sim_start_time:sim_end_time*10)';

%% PRIMERA PARTE: ENTRADA EN REGIMEN SIN CARGA

conv_3 = 2*pi/60;
conv_3_2 = 180/pi;

if TUNE_PID

    sim_t = 0.001*(sim_start_time:sim_end_time*1000)';


    w_m3_0 = 0/conv_3;
    T_s0_3 = 20;
    
    sim_T_l3 = ones(size(sim_t))*0;
    sim_w_m3_cons = ones(size(sim_t))*0;
    sim_T_amb3 = ones(size(sim_t))*20;
    
    for i=1:length(sim_t)

        if i < length(sim_t)/2

            sim_w_m3_cons(i) = 0;

        else

            sim_w_m3_cons(i) = 60*conv_3;

        end


    end
    
    sim_data_in = [sim_T_l3, sim_w_m3_cons, sim_T_amb3];
        
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Tunning PID motor 3")
    
    end
    
    sim('motor_3.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Tunning PID motor 3")
    
    end

     % Impresión de resultados
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a3}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 3");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l3}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 3");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
        title("Output: Angular Velocity of Motor 3");
        legend("w_{m3}"); 
        xlabel("time [s]");
        ylabel("Angular speed [rad/s]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 3");
        legend("i_{a3}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_3);
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_3);
        title("Comparación w_{m*}, w_{m} MOTOR 3 BLDC");
        legend(["w_{m*}","w_{m}"]);
        xlabel("time [s]");
        ylabel("Angular Velocity [rpm]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_3 - ans.simulationOut.Data(:,1)/conv_3);
        title("Error en velocidad angular");
        legend("e");
        xlabel("time [s]");
        ylabel("Angular Velocity [rpm]");
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

    w_m3_0 = 0;
    
    rpm_3_cons = 3250;

    
    sim_T_l3 = ones(size(sim_t))*0;
    sim_w_m3_cons = ones(size(sim_t))*0;
    sim_T_amb3 = ones(size(sim_t))*0;
    
    sim_T_l3(1) = 0;
    sim_T_l3(2) = 0;
    sim_T_l3(3) = 0;
    sim_T_l3(4) = 0;
    sim_T_l3(5) = 0;
    sim_T_l3(6) = 0;
    sim_T_l3(7) = 0;
    sim_T_l3(8) = 0;
    sim_T_l3(9) = 0;
    sim_T_l3(10) = 0;
    sim_T_l3(11) = 0;
    
    sim_w_m3_cons(1) = rpm_3_cons*conv_3;
    sim_w_m3_cons(2) = rpm_3_cons*conv_3;
    sim_w_m3_cons(3) = rpm_3_cons*conv_3;
    sim_w_m3_cons(4) = rpm_3_cons*conv_3;
    sim_w_m3_cons(5) = rpm_3_cons*conv_3;
    sim_w_m3_cons(6) = rpm_3_cons*conv_3;
    sim_w_m3_cons(7) = rpm_3_cons*conv_3;
    sim_w_m3_cons(8) = rpm_3_cons*conv_3;
    sim_w_m3_cons(9) = rpm_3_cons*conv_3;
    sim_w_m3_cons(10) = rpm_3_cons*conv_3;
    sim_w_m3_cons(11) = rpm_3_cons*conv_3;
    
    sim_T_amb3(1) = 20;
    sim_T_amb3(2) = 20;
    sim_T_amb3(3) = 20;
    sim_T_amb3(4) = 20;
    sim_T_amb3(5) = 20;
    sim_T_amb3(6) = 20;
    sim_T_amb3(7) = 20;
    sim_T_amb3(8) = 20;
    sim_T_amb3(9) = 20;
    sim_T_amb3(10) = 20;
    sim_T_amb3(11) = 20;
    
    sim_data_in = [sim_T_l3, sim_w_m3_cons, sim_T_amb3];
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Entrada en régimen de velocidad de motor 3")
    
    end
    
    sim('motor_3.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Entrada en régimen de velocidad de motor 3")
    
    end

    if SENSOR_TEST

       disp("SNR MOTOR 3")
       sensor_test;

    end
    
    % Impresión de resultados
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a3}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 3");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l3}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 3");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1));
        title("Output: Angular Velocity of Motor 3");
        legend("w_{m3}"); 
        xlabel("time [s]");
        ylabel("Angular speed [rad/s]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 3");
        legend("i_{a3}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_3);
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_3);
        title("Comparación w_{m*}, w_{m} MOTOR 3 BLDC");
        legend(["w_{m*}","w_{m}"]);
        xlabel("time [s]");
        ylabel("Angular Velocity [rpm]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_3 - ans.simulationOut.Data(:,1)/conv_3);
        title("Error en velocidad angular");
        legend("e");
        xlabel("time [s]");
        ylabel("Angular Velocity [rpm]");
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

    

    %% SEGUNDA PARTE: APLICACIÓN DE CARGA POR CORTE
    
    w_m3_0 = ans.simulationOut.Data(end,1);
    
    rpm_3_cons = 3250;
    conv_3 = 2*pi/60;
    
    sim_T_l3 = ones(size(sim_t))*0;
    sim_w_m3_cons = ones(size(sim_t))*0;
    sim_T_amb3 = ones(size(sim_t))*0;
    
    sim_T_l3(1) = 8.2;
    sim_T_l3(2) = 8.2;
    sim_T_l3(3) = 8.2;
    sim_T_l3(4) = 8.2;
    sim_T_l3(5) = 8.2;
    sim_T_l3(6) = 8.2;
    sim_T_l3(7) = 8.2;
    sim_T_l3(8) = 8.2;
    sim_T_l3(9) = 8.2;
    sim_T_l3(10) = 8.2;
    sim_T_l3(11) = 8.2;
    
    sim_w_m3_cons(1) = rpm_3_cons*conv_3;
    sim_w_m3_cons(2) = rpm_3_cons*conv_3;
    sim_w_m3_cons(3) = rpm_3_cons*conv_3;
    sim_w_m3_cons(4) = rpm_3_cons*conv_3;
    sim_w_m3_cons(5) = rpm_3_cons*conv_3;
    sim_w_m3_cons(6) = rpm_3_cons*conv_3;
    sim_w_m3_cons(7) = rpm_3_cons*conv_3;
    sim_w_m3_cons(8) = rpm_3_cons*conv_3;
    sim_w_m3_cons(9) = rpm_3_cons*conv_3;
    sim_w_m3_cons(10) = rpm_3_cons*conv_3;
    sim_w_m3_cons(11) = rpm_3_cons*conv_3;
    
    sim_T_amb3(1) = 20;
    sim_T_amb3(2) = 20;
    sim_T_amb3(3) = 20;
    sim_T_amb3(4) = 20;
    sim_T_amb3(5) = 20;
    sim_T_amb3(6) = 20;
    sim_T_amb3(7) = 20;
    sim_T_amb3(8) = 20;
    sim_T_amb3(9) = 20;
    sim_T_amb3(10) = 20;
    sim_T_amb3(11) = 20;
    
    sim_data_in = [sim_T_l3, sim_w_m3_cons, sim_T_amb3];
    
    if ENABLE_MESSAGES
    
        disp("Proceso iniciado: Corte usando motor 3")
    
    end
    
    sim('motor_3.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    
    if ENABLE_MESSAGES
    
        disp("Proceso finalizado: Corte usando motor 3")
    
    end


    if SENSOR_TEST

       disp("SNR MOTOR 3")
       sensor_test;

    end
    
    % Impresión de resultados
    
    if ENABLE_GRAPHS
    
        figure;
    
        hold on;
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,1));
        legend("v_{a3}");
        xlabel("time [s]");
        ylabel("Voltage [V]");
        grid minor;
        title("Input: Armature Voltage for Motor 3");
        
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,2));
        legend("T_{l3}");
        xlabel("time [s]");
        ylabel("Load Torque [N m]");
        grid minor;
        title("Input: Load Torque for Motor 3");
        
        figure;
        
        subplot(2,1,1)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,1)/conv_3);
        title("Output: Angular Velocity of Motor 3");
        legend("w_{m3}"); 
        xlabel("time [s]");
        ylabel("Angular position [rad/s]");
        grid minor;
        
        subplot(2,1,2)
        plot(ans.simulationOut.Time, ans.simulationOut.Data(:,2));
        title("Output: Armature Current for Motor 3");
        legend("i_{a3}");
        xlabel("time [s]");
        ylabel("Armature Current [A]");
        grid minor;
    
        figure;
    
        subplot(2,1,1)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_3);
        hold on;
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,4)/conv_3);
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,1)/conv_3);
        plot(ans.simulationIn.Time, ans.simulationOut.Data(:,5)/conv_3);
        title("Comparación w_{m*}, w_{m} MOTOR 3 BLDC");
        legend(["w_{m*}","w_{m}"]);
        xlabel("time [s]");
        ylabel("Angular Velocity [rpm]");
        grid minor;
        hold off;
    
        subplot(2,1,2)
        plot(ans.simulationIn.Time, ans.simulationIn.Data(:,3)/conv_3 - ans.simulationOut.Data(:,1)/conv_3);
        title("Error en velocidad angular");
        legend("e");
        xlabel("time [s]");
        ylabel("Angular Velocity [rpm]");
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
