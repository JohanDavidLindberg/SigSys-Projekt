R = 1
G = 1
C = 1.03e-3
R23 = 0.32

s = tf('s');
H1 = (G/(R*C*s))^2*-1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
H2 = (G/(R*C*s))*-1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
H3 = -1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
%{
figure("Name","Pole-zero plot H1")
h1 = iopzplot(H1);
legend('H1');
figure("Name","Pole-zero plot H2")
h2 = iopzplot(H2);
legend('H2');
figure("Name","Pole-zero plot H3")
h3 = iopzplot(H3);
legend('H3');

figure("Name","Impulse response")
impulse(H1, H2, H3);
grid on;
legend('H1', 'H2', 'H3');
%}
figure("Name","Bode")
bode(H1, H2, H3);
grid on;
legend('H1', 'H2', 'H3');



% Time parameters
f0 = 50;                       % Fundamental frequency 
T0 = 1 / f0;                   % Period 
fs = 10000;                    % High sampling frequency to get smooth curve
t = 0:(1/fs):5*T0;

% Fourier series of the saw tooth wave
w0 = 2 * pi * f0;
N = 100;
x = 0.5 * ones(size(t));       % shift signal up to 0 to 1 v

for n = 1:N
    x = x - (1 / (n * pi)) * sin(n * w0 * t);
end

% Simulation 
y = lsim(H1, x, t);            %Simulates timerespones from H1 with x signal

% --- 5. Plotting ---
figure('Color', 'w');
plot(t * 1000, x, 'r--', 'LineWidth', 1.2); hold on;
plot(t * 1000, y, 'b-', 'LineWidth', 2);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title('System Response to a 50 Hz Sawtooth Wave Input');
legend('Input Sawtooth', 'Output Filtered Sawtooth');