% Stanislovas Purvelis
% 4 laboratorinis darbas. 6 variantas.
% EIF-25

clc; clear;

%% 1. Trimatų grafikų vaizdavimas (a dalis)

x_a = linspace(-2, 2, 20);
y_a = linspace(-2, 2, 20);

[X_a, Y_a] = meshgrid(x_a, y_a);

Z_a = sin((X_a.^2 + Y_a.^2) ./ 20) .* exp(-(X_a.^2 + Y_a.^2));

figure(1);

surf(X_a, Y_a, Z_a);

shading interp;      
colormap(jet);       
view(45, 30);       

zlim([-1 1]);

title('Trimatis tūrio grafikas f(x,y) = sin((x^2+y^2)/20) \cdot e^{-(x^2+y^2)}');
xlabel('X ašis');
ylabel('Y ašis');
zlabel('Z ašis (f(x,y))');
grid on;


%% 1. Trimatų grafikų vaizdavimas (b dalis)

x_b = linspace(-1, 1, 20);
y_b = linspace(-1, 1, 20);

[X_b, Y_b] = meshgrid(x_b, y_b);

R = sqrt(X_b.^2 + Y_b.^2);

Z_b = exp(R.^2);

figure(2);

mesh(X_b, Y_b, Z_b);

shading faceted;   
colormap(hot);      
view(70, 30);       

title('Trimatis paviršiaus grafikas z(r) = e^{r^2}');
xlabel('X ašis');
ylabel('Y ašis');
zlabel('Z ašis (z(r))');
grid on;


%% 4 laboratorinis darbas. Papildoma užduotis (3 variantas)

x = -2:0.1:2;
y = -2:0.1:2;

[X, Y] = meshgrid(x, y);

Z = 1 - (X.^2 + Y.^2);

figure(3);

subplot(1, 3, 1);
surf(X, Y, Z);
shading interp;      
colormap(gca, 'parula'); 
title('1. Paviršius (parula)');
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;

subplot(1, 3, 2);
surf(X, Y, Z);
shading interp;
colormap(gca, 'hsv');   
title('2. Paviršius (hsv)');
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;

subplot(1, 3, 3);
surf(X, Y, Z);
shading interp;
colormap(gca, 'winter');

title('3. Paviršius (winter)');
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;