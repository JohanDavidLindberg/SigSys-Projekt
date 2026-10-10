% FIlter parameters
fs = 24000;                       % Sampling frequency 
Nyq = fs / 2;                     % Nyquist frequency 
Wp = 8000 / Nyq;                  % Normalized cutoff frequency for graph
[b, a] = cheby1(7, 3, Wp);        % 7th-order Chebyshev Type I
freqz(b, a, 1024, fs);            % Plot frequency response

% Input signal generation
t = 0:1/fs:0.01;                  
x1 = sin(2*pi*3000*t);             
x2 = sin(2*pi*8200*t);            
x = x1 + x2;                      

% Write out transferfunction
sys = tf(b, a, 1/fs, 'Variable', 'z^-1')

% Filtering signal
y = filter(b, a, x);            

% Plotting time domain
figure('Color', 'w');
plot(t * 1000, x, 'r--', 'LineWidth', 1.2); hold on;
plot(t * 1000, y, 'b-', 'LineWidth', 2);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title('Chebyshev Lowpass Filter ');
legend('Input', 'Output');

% --- 6. FFT Amplitude Spectrum Analysis (Problem 5 & Note 2) ---
N = length(x);                    % Number of samples

% Compute FFTs
X = fft(x);                       %[cite: 2]
Y = fft(y);                       

% Frequency vector in kHz (0 to fs/1000)
fvector = ((0:N-1) / N * fs) / 1000; 

% Normalized amplitude 
X_mag = (2/N) * abs(X);           
Y_mag = (2/N) * abs(Y);           

figure('Color', 'w');
plot(fvector, X_mag, 'r--', 'LineWidth', 1.2); hold on;
plot(fvector, Y_mag, 'b-', 'LineWidth', 2);
grid on;
xlim([0 fs/(2*1000)]);             
xlabel('Frequency (kHz)');        
ylabel('Amplitude (V)');          
title('Normalized Amplitude Spectrum (FFT)');
legend('Input Spectrum |X(f)|', 'Output Spectrum |Y(f)|');