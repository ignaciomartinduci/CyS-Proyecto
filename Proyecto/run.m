close all; clc; clear;

%% Correr programa desde este archivo. Modificar qué se simulará o que 
%% tareas se llevarán a cabo en el script "run_flags.m"

DC_Motor_params_01;
DC_Motor_params_02;
BLDC_Motor_params_03;
DC_Motor_params_04;
DC_Motor_params_05;

Env_params;
run_flags;

if VERIFY_OL_MODEL

    verify_ol_model;

end



