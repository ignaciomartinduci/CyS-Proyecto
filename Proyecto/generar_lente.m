function [theta,r] = generar_lente(h,w,round_1,round_2,round_3,round_4)

if nargin < 1 || isempty(h),        h = 30; end
if nargin < 2 || isempty(w),        w = 50; end
if nargin < 3 || isempty(round_1),  round_1 = 5; end
if nargin < 4 || isempty(round_2),  round_2 = 5; end
if nargin < 5 || isempty(round_3),  round_3 = 5; end
if nargin < 6 || isempty(round_4),  round_4 = 5; end

h        = min(max(h,       30), 50);
w        = min(max(w,       40), 60);
round_1  = min(max(round_1,  1), 10);
round_2  = min(max(round_2,  1), 10);
round_3  = min(max(round_3,  1), 10);
round_4  = min(max(round_4,  1), 10);

p_1  =  w/2;                           t_1  = 0;
p_2  =  hypot(w/2 , h/2-round_1);      t_2  = atan2( h/2-round_1 ,  w/2 );
p_3  =  hypot(h/2 , w/2-round_1);      t_3  = atan2( h/2          ,  w/2-round_1 );
p_4  =  h/2;                           t_4  = pi/2;
p_5  =  hypot(h/2 , w/2-round_2);      t_5  = atan2( h/2          , -w/2+round_2 );
p_6  =  hypot(w/2 , h/2-round_2);      t_6  = atan2( h/2-round_2 , -w/2 );
p_7  =  hypot(h/2-round_3 , w/2);      t_7  = 2*pi+atan2(-h/2+round_3 , -w/2 );
p_8  =  hypot(h/2 , w/2-round_3);      t_8  = 2*pi+atan2(-h/2         , -w/2+round_3 );
p_9  =  hypot(h/2 , w/2-round_4);      t_9  = 2*pi+atan2(-h/2         ,  w/2-round_4 );
p_10 =  hypot(h/2-round_4 , w/2);      t_10 = 2*pi+atan2(-h/2+round_4 ,  w/2 );
p_11 =  w/2;                           t_11 = 2*pi;

theta = [t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 t_10 t_11];
r     = [p_1 p_2 p_3 p_4 p_5 p_6 p_7 p_8 p_9 p_10 p_11];

figure;
polarplot(theta,r,"LineWidth",1.2);
title("Lente generado");
grid on;

end

