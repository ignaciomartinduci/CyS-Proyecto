function lente_r = consigna_a_lente(r)

lente_r = zeros(size(r));

for i=1:length(r)

    lente_r(i) = -50+35+r(i);

end