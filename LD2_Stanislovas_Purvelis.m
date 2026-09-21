% 2 laboratorinis darbas
% Stanislovas Purvelis
% EIF-25

%% 1 UZD 14 variantas

clc; clear;

%% 1. Vienmačiai masyvai
a = (200:-10:10)';

b = log10(a);

c = 10 .^ b;

d = c - a;

disp('Vektorius a (pirmieji 5 nariai):'); disp(a(1:5)');
disp('Vektorius d (pirmieji 5 nariai):'); disp(d(1:5)');

%% 2. Dvimačiai masyvai

A = [ pi/2,           3i,       exp(pi);
      log2(2),        2*pi,     log10(1);
      log(exp(1)),    pi^pi,    cos(pi) ];
  
disp('Pradinė matrica A:'); disp(A);

A(:, 2) = rand(3, 1);
disp('Matrica A po vidurinio stulpelio pakeitimo:'); disp(A);

stulpeliu_sumos = sum(A);
disp('Kiekvieno stulpelio sumos:'); disp(stulpeliu_sumos);

%% 3. Praktinis veiksmų su masyvais taikymas

A_amp = 7; 
f = 8; 
sigma = 2; 
U1 = 4; 
U2 = 3;
t = 0:0.002:2;

s_clean = A_amp * sin(2*pi*f*t) + 0.5 * A_amp * cos(4*pi*f*t);
n = sigma * randn(size(t));

s_noisy = s_clean + n;

reiksmes_virs_U1 = s_noisy(s_noisy > U1);

s_filtered = s_noisy;
s_filtered(abs(s_filtered) < U2) = 0;

nefiltruoto_dydis = length(s_noisy);
fprintf('Nefiltruoto signalo dydis: %d elementų\n', nefiltruoto_dydis);

atrinktu_dydis = length(reiksmes_virs_U1);
fprintf('Atrinktų (virš U1) reikšmių skaičius: %d elementų\n', atrinktu_dydis);

max_filtruotas = max(s_filtered);
min_filtruotas = min(s_filtered);
fprintf('Filtruoto signalo Max: %.4f V, Min: %.4f V\n', max_filtruotas, min_filtruotas);

%% Papildoma užduotis - 12 variantas
% P1. Masyvo elementų indeksavimas

clc;

A = input('Įveskite vektorių A: ');

B = A(2:2:end);

nelyginiai = A(1:2:end);
C = nelyginiai(end:-1:1);

disp('vektorius B yra:');
disp(B);

disp('vektorius C yra:');
disp(C);
