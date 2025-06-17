function [intersect, pt] = intersect_segments(p1, p2, q1, q2)
    % Retorna true si los segmentos p1-p2 y q1-q2 se cruzan
    % pt es el punto de intersección si existe

    intersect = false;
    pt = [NaN, NaN];

    % Vectores
    r = p2 - p1;
    s = q2 - q1;

    denom = cross2D(r, s);

    if denom == 0
        return; % Paralelos o colineales
    end

    t = cross2D((q1 - p1), s) / denom;
    u = cross2D((q1 - p1), r) / denom;

    if t >= 0 && t <= 1 && u >= 0 && u <= 1
        pt = p1 + t * r;
        intersect = true;
    end
end

function z = cross2D(a, b)
    % Producto cruzado 2D (scalar)
    z = a(1) * b(2) - a(2) * b(1);
end