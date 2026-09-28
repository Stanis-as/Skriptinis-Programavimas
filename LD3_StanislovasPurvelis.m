% Stanislovas Purvelis
% EIF-25
% 9/28/2026
% 3 laboratorinis darbas. 3 variantas.

clc; clear;

%% 1. užduotis a dalis: Pirmoji funkcija f(x)

x = linspace(0, 200, 300);

f_x = 2 * exp(-0.02 * x) .* cos(0.2 * x);

figure(1);

plot(x, f_x, 'g', 'LineWidth', 10);

title('Funkcijos f(x) = 2e^{-0.02x}cos(0.2x) grafikas');
xlabel('x ašis');
ylabel('f(x) reikšmės');
legend('f(x)');
grid on;

axis([min(x) max(x) min(f_x) max(f_x)]);



%% 1. užduotis b dalis: Antroji funkcija f(z) = cot(z)

z1 = linspace(-pi, 0, 150);
z2 = linspace(0, pi, 150);

z1 = z1(2:end-1);
z2 = z2(2:end-1);

f_z = cot(z1);
f_zz = cot(z2);

figure(2);

plot(z1, f_z, z2, f_zz, 'b', 'LineWidth', 2);

title('Funkcijos f(z) = cot(z) grafikas');
xlabel('z ašis (rad)');
ylabel('f(z) reikšmės');
legend('f(z) = cot(z)');
grid on;

axis([min(z) max(z) -10 10]);

%% 2 užduotis: Specializuotų grafikų kūrimas

x = 0:0.05:10*pi;

y = sin(x) .* cos(x); 
z = cos(x);

figure(3);

subplot(2, 1, 1); 

plot3(x, y, z, 'b', 'LineWidth', 1.5);

title('a) Trimatė kreivė plot3');
xlabel('x ašis');
ylabel('y ašis');
zlabel('z ašis');
grid on;

subplot(2, 1, 2); 

polarplot(x, y, 'm', 'LineWidth', 1.5);

title('b) Funkcija y(x) kampinėje koordinačių ašyje');
grid on; 

%% 3 laboratorinis darbas. Papildoma užduotis (5 variantas)
A_amp = 7; f = 8; sigma = 2; U1 = 4; U2 = 3;
t = 0:0.002:2;

n = sigma * randn(size(t));
s_noisy = A_amp * sin(2*pi*f.*t) + 0.5 * A_amp * cos(4*pi*f.*t) + n;

s_filtered = s_noisy;
s_filtered(abs(s_filtered) < U2) = 0;

t_virs_U1 = t(s_noisy > U1);
reiksmes_virs_U1 = s_noisy(s_noisy > U1);

figure(4);

subplot(2, 1, 1); 

plot(t, s_noisy, 'b-', 'LineWidth', 2); hold on;
plot(t, s_filtered, 'r:', 'LineWidth', 2);

yline(U1, 'g--', 'U1 riba', 'LineWidth', 1.5);
yline(U2, 'm--', 'U2 riba', 'LineWidth', 1.5);
yline(-U2, 'm--', '-U2 riba', 'LineWidth', 1.5);

title('Pradinis ir filtruotas signalai su filtravimo ribomis');
xlabel('Laikas (s)');
ylabel('Įtampa (V)');
grid on;
axis([0 2 min(s_noisy)-1 max(s_noisy)+1]);

legend('Pradinis signalas', 'Filtruotas signalas', 'Location', 'northeast');
hold off;

subplot(2, 1, 2);

[max_val, max_idx] = max(reiksmes_virs_U1);
[min_val, min_idx] = min(reiksmes_virs_U1);

stem(t_virs_U1, reiksmes_virs_U1, 'k', 'LineWidth', 1); hold on;

plot(t_virs_U1(max_idx), max_val, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 9);
plot(t_virs_U1(min_idx), min_val, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 9);

title('Diskrečios signalo reikšmės viršijančios U1 ribą');
xlabel('Laikas (s)');
ylabel('Įtampa (V)');
grid on;

if ~isempty(t_virs_U1)
    axis([min(t_virs_U1) max(t_virs_U1) U1-0.5 max(reiksmes_virs_U1)+1]);
end

legend('Reikšmės > U1', 'Ekstremumai (Min/Max)', 'Location', 'northeast');
hold off;