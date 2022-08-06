function Cdv_dt = nonlinear_circuit_Musil(input_time_array, input_volt_array)


% Constants
source_freq = 10e6;   % 10 MHz
E = 2*sin(2*pi*source_freq*input_time_array);
R = 2e3;
C = 1e-9;
I_s = 10e-16;
V_T = 25e-3;
I_d_v2_t = I_s*(exp(input_volt_array(2)/V_T)-1);
C_dv_1_dt = ((-1/R)*(input_volt_array(1) - E)) - ((1/R)*(input_volt_array(1) - input_volt_array(2)));
C_dv_2_dt = ((-1/R)*(input_volt_array(2) - input_volt_array(1)) - I_d_v2_t); 

Cdv_dt = [ C_dv_1_dt ; C_dv_2_dt];

end

