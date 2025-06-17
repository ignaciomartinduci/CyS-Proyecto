
sim_start_time = 0;
sim_end_time = 1;
sim_max_step = 1e-3;
sim_t = 0.1*(sim_start_time:sim_end_time*10)';

% Condiciones iniciales

theta_m1_0 = 0;
T_s1_0 = 25;

% Inputs

sim_v_a1 = ones(size(sim_t))*0;
sim_T_l1 = ones(size(sim_t))*0;
sim_T_amb1 = ones(size(sim_t))*0;


sim_v_a1(1) = 12;
sim_v_a1(2) = 12;
sim_v_a1(3) = 12;
sim_v_a1(4) = 12;
sim_v_a1(5) = 12;
sim_v_a1(6) = 12;
sim_v_a1(7) = -12;
sim_v_a1(8) = -12;
sim_v_a1(9) = -12;
sim_v_a1(10) = -12;
sim_v_a1(11) = -12;

sim_T_l1(1) = 0;
sim_T_l1(2) = 0;
sim_T_l1(3) = 0.5;
sim_T_l1(4) = 0.5;
sim_T_l1(5) = 100;
sim_T_l1(6) = 0.1;
sim_T_l1(7) = 0.5;
sim_T_l1(8) = 0.5;
sim_T_l1(9) = 0.5;
sim_T_l1(10) = 0.5;
sim_T_l1(11) = 0.5;

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

sim_data_in = [sim_v_a1, sim_T_l1, sim_T_amb1];

% Simulación

sim('control_y_sistemas_0.slx', ...
    'ExternalInput', '[sim_t, sim_data_in]', ...
    'LoadExternalInput', 'on');

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
    ylabel("Current [A]");
    grid minor;

    figure;


    subplot(2,1,1)
    plot(ans.simulationOut.Time, ans.simulationIn.Data(:,3));
    title("Input: Ambient Temperature");
    legend("T_{amb}"); 
    xlabel("time [s]");
    ylabel("Temperature [ºC]");
    grid minor;
    
    subplot(2,1,2)
    plot(ans.simulationOut.Time, ans.simulationOut.Data(:,3));
    title("Output: Armature Temperature for Motor 1");
    legend("T_{s}");
    xlabel("time [s]");
    ylabel("Temperature [ºC]");
    grid minor;


end
