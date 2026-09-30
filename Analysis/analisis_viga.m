% Análisis de Viga Simplemente Apoyada - Hito 1
clear; clc; close all;

%% 1. Cargar los datos
% Leemos el CSV desde la carpeta 'Data'
datos = readtable('../Data/datos_viga.csv');
P_kN = datos.carga_kN; 
delta_medida_mm = datos.deflexion_medida_mm;

%% 2. Parámetros geométricos y de material (desde parametros_viga.xlsx)
L = 4.0;      % Luz de la viga [m]
b = 0.2;      % Ancho [m]
h = 0.4;      % Alto [m]
E_GPa = 25;   % Módulo de elasticidad [GPa]

% Conversión de unidades explícita
% Transformamos GPa a kPa (kN/m^2) para que sea coherente con la carga en kN.
E_kPa = E_GPa * 1e6;  

%% 3. Cálculos teóricos
% Segundo momento de área de sección rectangular [m^4]
I = (b * h^3) / 12;   

% Deflexión teórica de Euler-Bernoulli: delta = P*L^3 / (48*E*I)
% El resultado estará en metros, lo multiplicamos por 1000 para pasar a mm
delta_teorica_m = (P_kN * L^3) ./ (48 * E_kPa * I);
delta_teorica_mm = delta_teorica_m * 1000;

%% 4. Comparación de datos
% Calculamos la diferencia relativa (%) solo para cargas distintas de cero (índice 2 en adelante)
diff_relativa = abs(delta_medida_mm(2:end) - delta_teorica_mm(2:end)) ./ delta_teorica_mm(2:end) * 100;
disp('Diferencia relativa porcentual (%):');
disp(diff_relativa);

%% 5. Verificación adicional
% La pauta pide una verificación extra. Evaluaremos la constancia de delta/P en el rango lineal.
% Si el material se comporta de forma elástica lineal, esta relación debería ser casi constante.
relacion_delta_P = delta_medida_mm(2:end) ./ P_kN(2:end);
disp('Relación delta_medida / P (mm/kN) - Debería ser constante:');
disp(relacion_delta_P);

%% 6. Generación de la figura
fig = figure;
% Usamos el color naranja (#D95319) con círculos (o) y línea continua (-)
plot(P_kN, delta_medida_mm, 'o-', 'Color', '#D95319', 'MarkerFaceColor', '#D95319', 'LineWidth', 1.5); hold on;
% 'g*--' significa color verde (g), con asteriscos (*) y línea segmentada (--)
plot(P_kN, delta_teorica_mm, 'g*--', 'LineWidth', 1.5);
grid on;

% Títulos, ejes, unidades y leyenda
title('Curva Carga vs. Deflexión en el Centro de la Luz');
xlabel('Carga Aplicada P [kN]');
ylabel('Deflexión Central \delta [mm]');
legend('Datos Medidos', 'Predicción Teórica (Euler-Bernoulli)', 'Location', 'northwest');

% Guardar la figura en la carpeta Figures para la trazabilidad
saveas(fig, '../Figures/carga_deflexion.png');
disp('Figura guardada exitosamente en la carpeta Figures.');