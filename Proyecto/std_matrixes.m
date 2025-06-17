% Matrices de forma estandar de Motor 1

A_1 = [0    1               0
    0   -b_m1/J_eq1     k_t1/J_eq1
    0   -k_e1/L_a1      -r_a1_20/L_a1];

B_c1 = [
    0     
    0       
    1/L_a1];

B_d1 = [0
    -1/(J_eq1*r_1)
    0];

B_1 = [B_c1 B_d1];

C_1 = [1 0 0];

sys_ss_1 = ss(A_1, B_c1, C_1, 0);

% Matrices de forma estandar de Motor 2

A_2 = [0    1               0
    0   -b_m2/J_eq2     k_t2/J_eq2
    0   -k_e2/L_a2      -r_a2_20/L_a2];

B_c2 = [
    0     
    0       
    1/L_a2];

B_d2 = [0
    -1/(J_eq2*r_2)
    0];

B_2 = [B_c2 B_d2];

C_2 = [1 0 0];

sys_ss_2 = ss(A_2, B_c2, C_2, 0);

% Matrices de forma estandar de Motor 3

A_3 = [0    1               0
    0   -b_m3/J_eq3     k_t3/J_eq3
    0   -k_e3/L_a3      -r_a3_20/L_a3];

B_c3 = [
    0     
    0       
    1/L_a3];

B_d3 = [0
    -1/(J_eq3*r_3)
    0];

B_3 = [B_c3 B_d3];

C_3 = [0 1 0];

sys_ss_3 = ss(A_3, B_c3, C_3, 0);

% Matrices de forma estandar de Motor 4

A_4 = [0    1               0
    0   -b_m4/J_eq4     k_t4/J_eq4
    0   -k_e4/L_a4      -r_a4_20/L_a4];

B_c4 = [
    0     
    0       
    1/L_a4];

B_d4 = [0
    -1/(J_eq4*r_4)
    0];

B_4 = [B_c4 B_d4];

C_4 = [1 0 0];

sys_ss_4 = ss(A_4, B_c4, C_4, 0);

