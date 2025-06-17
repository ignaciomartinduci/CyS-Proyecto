
% Cálculo de polos a lazo abierto

poles_1 = eig(A_1);
poles_2 = eig(A_2);
poles_3 = eig(A_3);
poles_4 = eig(A_4);

%% Análisis de estabilidad
% Se considera estable en lazo abierto si todos los polos tienen parte real negativa.

if ENABLE_MESSAGES
    disp('=== ANÁLISIS DE ESTABILIDAD EN LAZO ABIERTO ===');
    disp(" ");
    
    % Motor 1
    if all(real(poles_1) <= 0)
        disp('Modelo OL Motor 1: Estable (todos los polos con parte real negativa)');
    else
        disp('Modelo OL Motor 1: Inestable (existen polos con parte real >= 0)');
    end
    disp(['Polos Motor 1: ', mat2str(poles_1)]);
    disp(' ');

    % Motor 2
    if all(real(poles_2) <= 0)
        disp('Modelo OL Motor 2: Estable');
    else
        disp('Modelo OL Motor 2: Inestable');
    end
    disp(['Polos Motor 2: ', mat2str(poles_2)]);
    disp(' ');

    % Motor 3
    if all(real(poles_3) <= 0)
        disp('Modelo OL Motor 3: Estable');
    else
        disp('Modelo OL Motor 3: Inestable');
    end
    disp(['Polos Motor 3: ', mat2str(poles_3)]);
    disp(' ');

    % Motor 4
    if all(real(poles_4) <= 0)
        disp('Modelo OL Motor 4: Estable');
    else
        disp('Modelo OL Motor 4: Inestable');
    end
    disp(['Polos Motor 4: ', mat2str(poles_4)]);
    disp(' ');

end

% Gráficas de los polos en el plano complejo

if ENABLE_GRAPHS
    figure('Name','Polos en Lazo Abierto','NumberTitle','off');
    
    % Motor 1
    subplot(2,3,1);
    plot(real(poles_1),imag(poles_1),'x','MarkerSize',8);
    grid on; hold on;
    title('Polos Motor 1');
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    
    % Motor 2
    subplot(2,3,2);
    plot(real(poles_2),imag(poles_2),'x','MarkerSize',8);
    grid on; hold on;
    title('Polos Motor 2');
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    
    % Motor 3
    subplot(2,3,3);
    plot(real(poles_3),imag(poles_3),'x','MarkerSize',8);
    grid on; hold on;
    title('Polos Motor 3');
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    
    % Motor 4
    subplot(2,3,4);
    plot(real(poles_4),imag(poles_4),'x','MarkerSize',8);
    grid on; hold on;
    title('Polos Motor 4');
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');

end


%% Análisis de controlabilidad y Observabilidad

if ENABLE_MESSAGES
    disp('=== ANÁLISIS DE CONTROLABILIDAD Y OBSERVABILIDAD ===');
    disp(" ");
        
    % Motor 1
    Co_1 = ctrb(A_1, B_1);
    Ob_1 = obsv(A_1, C_1);
    dim1 = size(A_1,1);
    disp('>> Motor 1');
    if rank(Co_1) == dim1
        disp('   - Completamente Controlable');
    else
        disp('   - NO es completamente Controlable');
    end
    
    if rank(Ob_1) == dim1
        disp('   - Completamente Observable');
    else
        disp('   - NO es completamente Observable');
    end
    disp(' ');
    
    % Motor 2
    Co_2 = ctrb(A_2, B_2);
    Ob_2 = obsv(A_2, C_2);
    dim2 = size(A_2,1);
    disp('>> Motor 2');
    if rank(Co_2) == dim2
        disp('   - Completamente Controlable');
    else
        disp('   - NO es completamente Controlable');
    end
    
    if rank(Ob_2) == dim2
        disp('   - Completamente Observable');
    else
        disp('   - NO es completamente Observable');
    end
    disp(' ');
    
    % Motor 3
    Co_3 = ctrb(A_3, B_3);
    Ob_3 = obsv(A_3, C_3);
    dim3 = size(A_3,1);
    disp('>> Motor 3');
    if rank(Co_3) == dim3
        disp('   - Completamente Controlable');
    else
        disp('   - NO es completamente Controlable');
    end
    
    if rank(Ob_3) == dim3
        disp('   - Completamente Observable');
    else
        disp('   - NO es completamente Observable');
    end
    disp(' ');
    
    % Motor 4
    Co_4 = ctrb(A_4, B_4);
    Ob_4 = obsv(A_4, C_4);
    dim4 = size(A_4,1);
    disp('>> Motor 4');
    if rank(Co_4) == dim4
        disp('   - Completamente Controlable');
    else
        disp('   - NO es completamente Controlable');
    end
    
    if rank(Ob_4) == dim4
        disp('   - Completamente Observable');
    else
        disp('   - NO es completamente Observable');
    end
    disp(' ');
    
    
end