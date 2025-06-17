
%% En este script elegir qué tarea se lleva a cabo y otras configuraciones

ENABLE_MESSAGES = 1; % Imprimir mensajes.
ENABLE_GRAPHS = 1; % Imprimir gráficos.
STEPS = 1; % Habilitar ejecución paso a paso
ENABLE_SENSORS = 1; % Habilitar los sensores reales
ENABLE_SATURATIONS = 1; % Habilitar los saturadores de tensión
TUNE_PID = 0; % Selecciona el modo de la ejecución de la simulación (TUNE - CASO REAL)
TUNE_PID_DESIGN = [0,0,0,0]; % Habilita el diseñador de PID
SENSOR_TEST = 0; % Habilita el análisis de sensores
DISCRETE = 1; % Elegir entre simular planta discreta o continua, solo para USE_MACHINE_1
BACKLASH = 1; % Habilita el backlash
DERATING = 1; % Habilita el derating
CURRENT_LIMIT = 1; % Habilita la restricción de corriente

if ENABLE_MESSAGES == 0
    STEPS = 0;
end

VERIFY_OL_MODEL = 0; % Verificar el modelo físico de lazo abierto.
OL_STABILITY_ANALYSIS = 0; % Verificar la estabilidad de modelos a lazo abierto.
CL_STABILITY_ANALYSIS = 0; % Verificar la estabilida de modelos a lazo cerrado.
VERIFY_CL_PID = 0; % Verificar el funcionamiento de los controladores PID

USE_MACHINE_1 = 1; % Uso de máquina completo, versión 1

USE_SOLO_MOTOR_4 = 0; % Uso solo de motor 4
USE_SOLO_MOTOR_3 = 0; % Uso solo de motor 3
USE_SOLO_MOTOR_2 = 0; % Uso solo de motor 2
USE_SOLO_MOTOR_1 = 0; % Uso solo de motor 1