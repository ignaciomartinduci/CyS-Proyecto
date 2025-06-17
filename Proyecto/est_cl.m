
%% MOTOR 1 DC

G_1 = ss(A_1,B_c1,C_1,0);
G_pid1 = pid(K_p1,K_i1,K_d1);
T_1 = feedback(G_pid1*G_1, 1);

poles_cl_1 = pole(T_1);

%% MOTOR 2 DC

G_2 = ss(A_2,B_c2,C_2,0);
G_pid2 = pid(K_p2,K_i2,K_d2);
T_2 = feedback(G_pid2*G_2, 1);

poles_cl_2 = pole(T_2);

%% MOTOR 3 BLDC

G_3 = ss(A_3,B_c3,C_3,0);
G_pid3 = pid(K_p3,K_i3,K_d3);
T_3 = feedback(G_pid3*G_3, 1);

poles_cl_3 = pole(T_3);

%% MOTOR 4 DC

G_4 = ss(A_4,B_c4,C_4,0);
G_pid4 = pid(K_p4,K_i4,K_d4);
T_4 = feedback(G_pid4*G_4, 1);

poles_cl_4 = pole(T_4);

%% IMPRESIÓN

if ENABLE_MESSAGES

    disp("Polos CL motor 1 DC");
    disp(poles_cl_1)

    disp("Polos CL motor 2 DC");
    disp(poles_cl_2)

    disp("Polos CL motor 3 BLDC");
    disp(poles_cl_3)

    disp("Polos CL motor 4 DC");
    disp(poles_cl_4)

end

if ENABLE_GRAPHS

    if OL_STABILITY_ANALYSIS == 0
        disp("Para ver comparativa con polos OL, HABILITAR: OL_STABILITY_ANALYSIS == 1")

    else

        %%

        
        [GM_o1, PM_o1, ~, ~] = margin(G_1);
        [GM_c1, PM_c1, ~, ~] = margin(G_pid1*G_1);

        fprintf('Margen de fase LA y LC Motor 1 DC: \t%gº | \t%g\ºn', PM_o1, PM_c1);

        [GM_o2, PM_o2, ~, ~] = margin(G_2);
        [GM_c2, PM_c2, ~, ~] = margin(G_pid2*G_2);

        fprintf('Margen de fase LA y LC Motor 2 DC: \t%gº | \t%gº\n', PM_o2, PM_c2);
   
        [GM_o3, PM_o3, ~, ~] = margin(G_3);
        [GM_c3, PM_c3, ~, ~] = margin(G_pid3*G_3);

        fprintf('Margen de fase LA y LC Motor 3 BLDC: \t%gº | \t%gº\n', PM_o3, PM_c3);
        
        [GM_o4, PM_o4, ~, ~] = margin(G_4);
        [GM_c4, PM_c4, ~, ~] = margin(G_pid4*G_4);

        fprintf('Margen de fase LA y LC Motor 4 DC: \t%gº | \t%gº9378\n', PM_o4, PM_c4);

        

        %%

        figure
        plot(real(poles_1),     imag(poles_1),    'x', 'MarkerSize',8), hold on
        plot(real(poles_cl_1),  imag(poles_cl_1), 'o', 'MarkerSize',8)
        
        xline(0,'--')                         % eje imaginario
        grid on
        xlabel('Parte real [rad/s]'), ylabel('Parte imaginaria [rad/s]')
        title('Comparación de polos MOTOR 1 DC: lazo abierto vs. lazo cerrado')
        legend({'Polos lazo abierto (poles_1)', ...
                'Polos lazo cerrado (poles\_cl\_1)'}, ...
                'Location','best')
        axis equal
        hold off

        figure
        plot(real(poles_2),     imag(poles_2),    'x', 'MarkerSize',8), hold on
        plot(real(poles_cl_2),  imag(poles_cl_2), 'o', 'MarkerSize',8)
        
        xline(0,'--')                         % eje imaginario
        grid on
        xlabel('Parte real [rad/s]'), ylabel('Parte imaginaria [rad/s]')
        title('Comparación de polos MOTOR 2 DC: lazo abierto vs. lazo cerrado')
        legend({'Polos lazo abierto (poles_2)', ...
                'Polos lazo cerrado (poles\_cl\_2)'}, ...
                'Location','best')
        axis equal
        hold off

        figure
        plot(real(poles_3),     imag(poles_3),    'x', 'MarkerSize',8), hold on
        plot(real(poles_cl_3),  imag(poles_cl_3), 'o', 'MarkerSize',8)
        
        xline(0,'--')                         % eje imaginario
        grid on
        xlabel('Parte real [rad/s]'), ylabel('Parte imaginaria [rad/s]')
        title('Comparación de polos MOTOR 3 BLDC: lazo abierto vs. lazo cerrado')
        legend({'Polos lazo abierto (poles_3)', ...
                'Polos lazo cerrado (poles\_c3\_3)'}, ...
                'Location','best')
        axis equal
        hold off

        figure
        plot(real(poles_4),     imag(poles_4),    'x', 'MarkerSize',8), hold on
        plot(real(poles_cl_4),  imag(poles_cl_4), 'o', 'MarkerSize',8)
        
        xline(0,'--')                         % eje imaginario
        grid on
        xlabel('Parte real [rad/s]'), ylabel('Parte imaginaria [rad/s]')
        title('Comparación de polos MOTOR 4 DC: lazo abierto vs. lazo cerrado')
        legend({'Polos lazo abierto (poles_4)', ...
                'Polos lazo cerrado (poles\_cl\_4)'}, ...
                'Location','best')
        axis equal
        hold off

    end

end