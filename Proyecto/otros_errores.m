max_backlash = 0.25/180*pi; % [rad] Backlash maximo de reductores

sigma_backlash = max_backlash / 3; % [rad] desviación estandar de backlash

sigma2_backlash = sigma_backlash^2; % [rad^2] varianza de backlash

N = 100000;

if BACKLASH == 0

    max_backlash = 0;
    sigma_backlash = 0;
    sigma2_backlash = 0;

end

backlash_error = randn(N,1) * sigma_backlash; % Muestras de error

if ENABLE_GRAPHS

    figure;
    hold on;
    histogram(backlash_error, 100, 'Normalization', 'pdf');
    grid on;
    xlabel("Backlash [rad]")
    ylabel("Densidad de probabilidad");
    title("Distribución normal de backlash");
    hold off;

end