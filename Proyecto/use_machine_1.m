%% Parámetros de la simulación
sim_start_time = 0;
sim_end_time = 100;
sim_max_step = 1e-2; 

[theta, r] = generar_lente(30,60,2,2,2,2); % valores en mm

sim_t = 0.001*(sim_start_time:sim_end_time*1000)';

%% Inputs de simulación

% theta_m1, theta_m2, omega_m3, T_l1, T_l2, T_l3

% Condiciones iniciales

theta_m0_1 = 0;
theta_m0_2 = 0;
theta_m0_3 = 0;
T_s0_1 = 20;
T_s0_2 = 20;
T_s0_3 = 20;

sim_T_l1 = ones(size(sim_t))*0;
sim_theta_m1_cons = ones(size(sim_t))*0;

sim_T_l2 = ones(size(sim_t))*0;
sim_theta_m2_cons = ones(size(sim_t))*0;

sim_T_l3 = ones(size(sim_t))*0;
sim_w_m3_cons = ones(size(sim_t))*0;

m2rev = 1/pitch_2;
rev2m = 1/m2rev; % Pasa de ángulo a metros ¡salida de reductor!

pasos_1 = 10;
idx_10 = find(sim_t == 10);
idx_90 = find(sim_t == 90);
cons_elementos = idx_90-idx_10;

[theta,r] = elaborar_consignas(cons_elementos, theta, r); % valores en mm

%% Elaboración de consignas
% Importante: las consignas se dan según los valores deseados a la salida 
% del reductor, dentro del modelo se realiza la reducción para referir
% a valores del motor.

for i=1:length(sim_t)

    if sim_t(i) <= 5

        sim_theta_m1_cons(i) = 0;
        sim_theta_m2_cons(i) = 2*pi*(0.010*m2rev); % a 5mm de contacto - 
        sim_w_m3_cons(i) = 3250/2*2*pi/60;


    elseif sim_t(i) > 5 && sim_t(i) <= 7.5

        sim_theta_m1_cons(i) = theta(1);
        sim_theta_m2_cons(i) = 2*pi*(0.010*m2rev); % a 5mm de contacto
        sim_w_m3_cons(i) = 3250*2*pi/60;

    elseif sim_t(i) > 7.5 && sim_t(i) <= 10

        sim_theta_m1_cons(i) = theta(1);
        sim_theta_m2_cons(i) = 2*pi*(r(1)/1000*m2rev);
        sim_w_m3_cons(i) = 3250*2*pi/60;

        sim_T_l1(i) = 8.19;
        sim_T_l2(i) = 390 * (pitch_2)/(2*pi);
        sim_T_l3(i) = 8.19;

    elseif sim_t(i) > 10 && sim_t(i) < 90 
        
        sim_theta_m1_cons(i) = theta(i-idx_10);
        sim_theta_m2_cons(i) = 2*pi*(r(i-idx_10)/1000*m2rev);
        sim_w_m3_cons(i) = 3250*2*pi/60;
        sim_T_l1(i) = 8.19;
        sim_T_l2(i) = 390 * (pitch_2)/(2*pi);
        sim_T_l3(i) = 8.19;

    elseif sim_t(i) >= 90

        sim_theta_m1_cons(i) = 0;
        sim_theta_m2_cons(i) = 2*pi*(-0.050*m2rev);
        sim_w_m3_cons(i) = 3250*2*pi/60 + ((sim_t(i)-90)/(100-90))*(0-3250*2*pi/60*60/2/pi)*2*pi/60;

    end


end


%% Impresión de consignas

figure;
plot(sim_t, sim_w_m3_cons);
grid on;
xlabel("Tiempo [s]");
ylabel("Velocidad angular [rad/s]")
legend("\omega_{m3}*")
title("Consigna de velocidad Motor 3 BLDC - SR");

figure;
plot(sim_t, rad2deg(sim_theta_m1_cons));
grid on;
xlabel("Tiempo [s]");
ylabel("Posición angular [º]")
legend("\theta_{m1}*")
title("Consigna de posición Motor 1 DC - SR");

figure;
plot(sim_t, (sim_theta_m2_cons)/2/pi*rev2m*1000);
grid on;
xlabel("Tiempo [s]");
ylabel("Posición lineal [mm]")
legend("\theta_{m2}*")
title("Consigna de posición Motor 2 DC - SR");

figure;
subplot(3,1,1);
plot(sim_t, sim_T_l1);
grid on;
xlabel("Tiempo [s]");
ylabel("Torque de carga [Nm]")
title("Entrada torque de carga motor 1");
legend("T_{l1}")
subplot(3,1,2);
plot(sim_t, sim_T_l2);
grid on;
xlabel("Tiempo [s]");
ylabel("Torque de carga [Nm]")
title("Entrada torque de carga motor 2");
legend("T_{l2}")
subplot(3,1,3);
plot(sim_t, sim_T_l3);
legend("T_{l3}")
grid on;
xlabel("Tiempo [s]");
ylabel("Torque de carga [Nm]")
title("Entrada torque de carga motor 3");


%% Simulación

    sim_data_in = [sim_theta_m1_cons, sim_theta_m2_cons, sim_w_m3_cons, sim_T_l1, sim_T_l2, sim_T_l3];

    if DISCRETE
         sim('motor_1_2_3_discreto.slx', ...
        'ExternalInput', '[sim_t, sim_data_in]', ...
        'LoadExternalInput', 'on');
    else

    end

%% Salidas de simulación

figure;
plot(ans.simoutMedidas.Time, rad2deg(ans.simoutMedidas.Data(:,1)));
hold on
plot(ans.simoutEntradas.Time, rad2deg(ans.simoutEntradas.Data(:,1)));
grid on;
xlabel("Tiempo [s]");
ylabel("Posición angular [º]")
legend(["\theta_{m1}","\theta_{m1}*"])
title("Posición angular consigna y medida: Motor 1 DC  - SR");
hold off

figure;
plot(ans.simoutMedidas.Time, ans.simoutMedidas.Data(:,2)/2/pi*rev2m*1000);
hold on;
plot(ans.simoutEntradas.Time, ans.simoutEntradas.Data(:,2)/2/pi*rev2m*1000);
hold off;
grid on;
legend(["x_{m1}","x_{m2}*"])
xlabel("Tiempo [s]");
ylabel("Posición lineal [m]")
title("Posición lineal consigna y medida: Motor 2 DC - SR");

figure;
plot(ans.simoutMedidas.Time, ans.simoutMedidas.Data(:,3));
hold on;
plot(ans.simoutEntradas.Time, ans.simoutEntradas.Data(:,3));
hold off;
grid on;
legend(["\omega_{m1}","\omega_{m2}*"])
xlabel("Tiempo [s]");
ylabel("Velocidad angular [rad/s]")
title("Velocidad angular consigna y medida: Motor 3 BLDC - SR");

figure;
subplot(3,2,1)
plot(ans.simoutSimuladas.Time,ans.simoutSimuladas.Data(:,1))
title("Corriente de armadura Motor 1")
xlabel("Time [s]")
ylabel("i_{a1} [A]")
grid on

subplot(3,2,2)
plot(ans.simoutSimuladas.Time,ans.simoutSimuladas.Data(:,2))
xlabel("Time [s]")
title("Corriente de armadura Motor 2")
ylabel("i_{a2} [A]")
grid on

subplot(3,2,3)
plot(ans.simoutSimuladas.Time,ans.simoutSimuladas.Data(:,3))
title("Corriente de armadura Motor 3")
xlabel("Time [s]")
ylabel("i_{a3} [A]")
grid on

subplot(3,2,4)
plot(ans.simoutSimuladas.Time,ans.simoutSimuladas.Data(:,4))
title("Temperatura de estator Motor 1 ")
xlabel("Time [s]")
ylabel("T_{s1} [ºC]")
grid on

subplot(3,2,5)
plot(ans.simoutSimuladas.Time,ans.simoutSimuladas.Data(:,5))
title("Temperatura de estator Motor 2 ")
xlabel("Time [s]")
ylabel("T_{s2} [ºC]")
grid on

subplot(3,2,6)
plot(ans.simoutSimuladas.Time,ans.simoutSimuladas.Data(:,6))
title("Temperatura de estator Motor 3 ")
xlabel("Time [s]")
ylabel("T_{s3} [ºC]")
grid on



%% Resultados


theta_res = ans.simoutLente.Data(:,1);
p1 = ans.simoutLente.Data(:,2);
p2 = p1/2/pi;
p3 = p2*rev2m;
p4 = p3*1000;
p5 = consigna_a_lente(p4);
r_res = p5;

idx_init = find(ans.simoutLente.Time == 10);
idx_end = find(ans.simoutLente.Time == 90);

theta_res = theta_res(idx_init:idx_end);
r_res = r_res(idx_init:idx_end);

r_cons = consigna_a_lente(r);

x_res = r_res.*cos(theta_res);
y_res = r_res.*sin(theta_res);

x_cons = r_cons.*cos(theta);
y_cons = r_cons.*sin(theta);

figure;
plot(x_cons,y_cons,"-r");
hold on
plot(x_res, y_res,"k");
grid on;
legend(["Lente consigna","Lente resultado*"])
title("Comparativa lente consigna y lente obtenido");

r_cons_calc = consigna_a_lente(ans.simoutEntradas.Data(:,2)/2/pi*rev2m*1000);
r_cons_calc = r_cons_calc(idx_init:idx_end);

maxe = 0;

sec_limit = 200;


for i=1:length(r_res)-sec_limit

    e_act = abs(r_res(i) - r_cons_calc(i));

    if e_act > maxe

        maxe = e_act;

    end

end

mse = mean((r_res(1:length(r_res)-sec_limit) - r_cons_calc(1:length(r_res)-sec_limit)).^2);
disp("El error cuadrático medio entre la consigna y el resultado es de: ")
disp(mse);
disp("[mm]");
disp("El máximo error entre consigna y resultado es de:")
disp(maxe);
disp("[mm]");

figure;
plot(r_cons_calc(1:length(r_res)-sec_limit));
hold on
plot(r_res(1:length(r_res)-sec_limit));
grid on
title("Comparativa entre valores de consigna radial consigna y resultado");
xlabel("item")
ylabel("r [mm]")
legend(["r_{cons}","r_{res}"]);
hold off;

% out.simoutMedidas -> variables que se miaaden en la realidad
% out.simoutSimuladas -> variables que no se miden en la realidad