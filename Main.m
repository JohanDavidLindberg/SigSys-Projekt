R = 1
G = 1
C = 1
R23 = 1

s = tf('s');
H1 = (G/(R*C*s))^2*-1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
H2 = (G/(R*C*s))*-1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
H3 = -1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))

figure("Name","Pole-zero plots")
h = iopzplot(H1,H2,H3);        
%h.IOGrouping = "all";         
grid on;
legend('H1','H2','H3');

figure("Name","Impulse response")
impulse(H1, H2, H3);
grid on;
legend('H1', 'H2', 'H3');

figure("Name","Bode")
bode(H1, H2, H3);
grid on;
legend('H1', 'H2', 'H3');