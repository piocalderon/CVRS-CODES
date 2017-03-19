function dy = myModel(Y,params)

% ========= PARAMETERS ========== %
c_as = params(1);
c_vs = params(2);
c_ap = params(3);
c_vp = params(4);
c_l = params(5);
c_r = params(6);
R_l = params(7);
R_r = params(8);
kappa = params(9);
alpha_l = params(10);
alpha_r = params(11);
beta_l = params(12);
beta_r = params(13);
gamma_l = params(14);
gamma_r = params(15);
M_O2 = params(16);
M_CO2 = params(17);
rho_O2 = params(18);
rho_CO2 = params(19);
q_as = params(20);
V_tot = params(21);
R_p = params(22);
A_pesk = params(23);
P_IO2 = params(24);
P_ICO2 = params(25);
V_AO2 = params(26);
V_ACO2 = params(27);
V_TO2 = params(28);
V_TCO2 = params(29);
K_CO2 = params(30);
k_CO2 = params(31);
K_a1 = params(32);
K_a2 = params(33);
W = params(34);
H = params(35);
dotV_A = params(36);

% ===== STATE VARIABLES ===== %
P_as = Y(1);
P_vs = Y(2);
P_ap = Y(3);
P_vp = Y(4);
S_l = Y(5);
sigma_l = Y(6);
S_r = Y(7);
sigma_r = Y(8);
P_aCO2 = Y(9);
P_aO2 = Y(10);
C_vCO2 = Y(11);
C_vO2 = Y(12);

% ========== COMPUTED QUANTITIES ========= %
R_s = A_pesk * C_vO2;
t_d = (H^(-0.5))*((H^(-0.5)) - kappa);
k_l = exp(-((c_l*R_l)^-1)*t_d);
a_l = 1 - k_l;
k_r = exp(-((c_r*R_r)^-1)*t_d);
a_r = 1 - k_r;

F_s = (R_s^-1) * (P_as - P_vs);
F_p = (R_p^-1) * (P_ap - P_vp);
Q_l = H*((c_l*a_l*P_vp*S_l)*(a_l*P_as + k_l*S_l)^-1);
Q_r = H*((c_r*a_r*P_vs*S_r)*(a_r*P_ap + k_r*S_r)^-1);

MR_O2 = M_O2 + rho_O2*W;
MR_CO2 = M_CO2 + rho_CO2*W;

% ========== DERIVATIVES ========== %
dy(1) = (c_as^-1) * (Q_l - F_s);
dy(2) = (c_vs^-1) * (F_s - Q_r);
dy(3) = (c_ap^-1) * (Q_r - F_p);
dy(4) = (c_vp^-1) * (F_p - Q_l);
dy(5) = sigma_l;
dy(6) = -gamma_l * sigma_l - alpha_l * S_l + beta_l * H;
dy(7) = sigma_r;
dy(8) = -gamma_r * sigma_r - alpha_r * S_r+ beta_r * H;
dy(9) = (V_ACO2^-1) * (863*F_p*(C_vCO2-K_CO2*P_aCO2 - k_CO2) + dotV_A * (P_ICO2 - P_aCO2));
dy(10) = (V_AO2^-1) * (863*F_p*(C_vO2-K_a1*(1-exp(-K_a2*P_aO2))^2) + dotV_A * (P_IO2 - P_aO2));
dy(11) = (V_TCO2^-1) * (MR_CO2 + F_s*(K_CO2*P_aCO2 + k_CO2 - C_vCO2));
dy(12) = (V_TO2^-1) * (-MR_O2 + F_s*(K_a1*(1-exp(-K_a2*P_aO2))^2 - C_vO2));
