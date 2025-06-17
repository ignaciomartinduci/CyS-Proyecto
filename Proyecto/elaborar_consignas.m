function [cons_theta, cons_r] = elaborar_consignas(cons_elementos, theta, r)

    x = r(:) .* cos(theta(:));
    y = r(:) .* sin(theta(:));

    dx     = diff(x);
    dy     = diff(y);
    dist   = hypot(dx, dy);            
    cumd   = [0; cumsum(dist)];       
    Ltot   = cumd(end);                

    d_new = linspace(0, Ltot, cons_elementos).';  

    cons_x = interp1(cumd, x, d_new, 'linear');
    cons_y = interp1(cumd, y, d_new, 'linear');

    cons_r     = hypot(cons_x, cons_y);
    cons_r = cons_r+50-35;

    cons_theta = atan2(cons_y, cons_x);
    cons_theta = mod(cons_theta, 2*pi);

end
