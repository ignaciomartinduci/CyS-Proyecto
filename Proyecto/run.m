close all; clc; clear;  

%% Correr programa desde este archivo. Modificar qué se simulará o que 
%% tareas se llevarán a cabo en el script "run_flags.m"

% Orden de desarrollo   
% control_y_sistemas_0.slx
% control_y_sistemas_1.slx  
% motor_4.slx
% motor_3.slx
    
run_flags;

Env_params;
materiales;

DC_Motor_params_01;
DC_Motor_params_02;
BLDC_Motor_params_03;
DC_Motor_params_04;

filter_params;
noise_params;


if VERIFY_OL_MODEL
    verify_ol_model;    

end

std_matrixes;


if OL_STABILITY_ANALYSIS

    est_contr_obs;

end

PID_tuning; 

if VERIFY_CL_PID

    verify_cl_pid;

end

otros_errores;
derating;

if USE_SOLO_MOTOR_1

    use_solo_motor_1;

end

if USE_SOLO_MOTOR_2

    use_solo_motor_2;

end

if USE_SOLO_MOTOR_3

    use_solo_motor_3;

end

if USE_SOLO_MOTOR_4

    use_solo_motor_4;

end

if USE_MACHINE_1

    use_machine_1;

end

if CL_STABILITY_ANALYSIS

    est_cl;

end



