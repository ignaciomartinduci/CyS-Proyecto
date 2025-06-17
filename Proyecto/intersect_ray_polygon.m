function r = intersect_ray_polygon(ray_start, ray_end, poly)

 closest_dist = Inf;
    intersection_found = false;

    for i = 1:size(poly,1)
        % Definir extremos del segmento del polígono
        p1 = poly(i,:);
        p2 = poly(mod(i, size(poly,1)) + 1, :); % conecta último con primero
        
        [intersect, pt] = intersect_segments(ray_start, ray_end, p1, p2);
        if intersect
            d = norm(pt - ray_start);
            if d < closest_dist
                closest_dist = d;
                intersection_found = true;
            end
        end
    end

    if intersection_found
        r = closest_dist;
    else
        r = [];
    end
end