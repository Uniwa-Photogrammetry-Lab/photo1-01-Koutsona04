clc;
figure;
hold on;
xlim([-0.2 0.2])
ylim([-0.2 0.2])
grid on;

% Ρυθμίσεις κάμερας και εστιακού μήκους
x0 = 0; % Θέση της κάμερας στον άξονα x
y0 = 0; % Θέση της κάμερας στον άξονα y
f = 0.1; % Εστιακό μήκος
X0 = 0; % Θέση της κάμερας στον άξονα X
Y0 = 0; % Θέση της κάμερας στον άξονα Y
Z0 = 0; % Θέση της κάμερας στον άξονα Z

% Μπροστινές κορυφές
vAf = [-2 -0.5 5];
vBf = [-2 0.5 5];
vCf = [-1 0.5 5];
vDf = [-1 -0.5 5];

% Πίσω κορυφές
vAb = [-2 -0.5 6];
vBb = [-2 0.5 6];
vCb = [-1 0.5 6];
vDb = [-1 -0.5 6];

% Σχεδίαση του μπροστινού προσώπου
drawLine(projectVertex(vAf, x0, y0, f, X0, Y0, Z0), projectVertex(vBf, x0, y0, f, X0, Y0, Z0), 'blue');
drawLine(projectVertex(vBf, x0, y0, f, X0, Y0, Z0), projectVertex(vCf, x0, y0, f, X0, Y0, Z0), 'blue');
drawLine(projectVertex(vCf, x0, y0, f, X0, Y0, Z0), projectVertex(vDf, x0, y0, f, X0, Y0, Z0), 'blue');
drawLine(projectVertex(vDf, x0, y0, f, X0, Y0, Z0), projectVertex(vAf, x0, y0, f, X0, Y0, Z0), 'blue');

% Σχεδίαση του πίσω προσώπου
drawLine(projectVertex(vAb, x0, y0, f, X0, Y0, Z0), projectVertex(vBb, x0, y0, f, X0, Y0, Z0), 'red');
drawLine(projectVertex(vBb, x0, y0, f, X0, Y0, Z0), projectVertex(vCb, x0, y0, f, X0, Y0, Z0), 'red');
drawLine(projectVertex(vCb, x0, y0, f, X0, Y0, Z0), projectVertex(vDb, x0, y0, f, X0, Y0, Z0), 'red');
drawLine(projectVertex(vDb, x0, y0, f, X0, Y0, Z0), projectVertex(vAb, x0, y0, f, X0, Y0, Z0), 'red');

% Σχεδίαση των συνδέσεων μεταξύ μπροστινού και πίσω προσώπου
drawLine(projectVertex(vAf, x0, y0, f, X0, Y0, Z0), projectVertex(vAb, x0, y0, f, X0, Y0, Z0), 'green');
drawLine(projectVertex(vBf, x0, y0, f, X0, Y0, Z0), projectVertex(vBb, x0, y0, f, X0, Y0, Z0), 'green');
drawLine(projectVertex(vCf, x0, y0, f, X0, Y0, Z0), projectVertex(vCb, x0, y0, f, X0, Y0, Z0), 'green');
drawLine(projectVertex(vDf, x0, y0, f, X0, Y0, Z0), projectVertex(vDb, x0, y0, f, X0, Y0, Z0), 'green');

% Συνάρτηση για σχεδίαση γραμμής μεταξύ δύο κορυφών
function drawLine(v1, v2, color)
    line([v1(1) v2(1)], [v1(2) v2(2)], 'color', color);
end

% Συνάρτηση για προβολή κορυφών 3D σε 2D με βάση τα παρακάτω παραμέτρους
function res = projectVertex(v, x0, y0, f, X0, Y0, Z0)
    % Υπολογισμός της απόστασης από την κάμερα για κάθε κορυφή
    x = v(1);
    y = v(2);
    z = v(3);
    
    % Εφαρμογή της προοπτικής με την κάμερα στην θέση (X0, Y0, Z0)
    res = [f * (x - X0) / (z - Z0), f * (y - Y0) / (z - Z0)]; % Εφαρμογή της προοπτικής
end
