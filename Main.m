R = 1
G = 1
C = 1
R23 = 1

s = tf('s');
H1 = (G/(R*C*s))^2*-1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
H2 = (G/(R*C*s))*-1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))
H3 = -1*s^2/(s^2+(R23*(G/(R*C)))*s + G^2/(R^2*C^2))

figure("Name","Pole-zero plot H1")
h1 = iopzplot(H1);
h1.IOGrouping = "all"; 
legend('H1');
figure("Name","Pole-zero plot H2")
h2 = iopzplot(H2);
h2.IOGrouping = "all"; 
legend('H2');
figure("Name","Pole-zero plot H3")
h3 = iopzplot(H3);
h3.IOGrouping = "all";       
legend('H3');

figure("Name","Impulse response")
impulse(H1, H2, H3);
grid on;
legend('H1', 'H2', 'H3');

figure("Name","Bode")
bode(H1, H2, H3);
grid on;
legend('H1', 'H2', 'H3');