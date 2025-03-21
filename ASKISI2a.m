clc;
figure;
hold on;
xlim([-0.5 0.5])
ylim([-0.5 0.5])
grid on;

% Εστιακό μήκος
f = 0.1;

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
drawLine(projectVertex(vAf), projectVertex(vBf), 'blue');
drawLine(projectVertex(vBf), projectVertex(vCf), 'blue');
drawLine(projectVertex(vCf), projectVertex(vDf), 'blue');
drawLine(projectVertex(vDf), projectVertex(vAf), 'blue');

% Σχεδίαση του πίσω προσώπου
drawLine(projectVertex(vAb), projectVertex(vBb), 'red');
drawLine(projectVertex(vBb), projectVertex(vCb), 'red');
drawLine(projectVertex(vCb), projectVertex(vDb), 'red');
drawLine(projectVertex(vDb), projectVertex(vAb), 'red');

% Σχεδίαση των συνδέσεων μεταξύ μπροστινού και πίσω προσώπου
drawLine(projectVertex(vAf), projectVertex(vAb), 'green');
drawLine(projectVertex(vBf), projectVertex(vBb), 'green');
drawLine(projectVertex(vCf), projectVertex(vCb), 'green');
drawLine(projectVertex(vDf), projectVertex(vDb), 'green');

% Συνάρτηση για σχεδίαση γραμμής μεταξύ δύο κορυφών
function drawLine(v1, v2, color)
    line([v1(1) v2(1)], [v1(2) v2(2)], 'color', color);
end

% Συνάρτηση για προβολή κορυφών 3D σε 2D με βάση το εστιακό μήκος και την κάμερα στην αρχή
function res = projectVertex(v)
    f = 0.1; % Εστιακό μήκος
    x = v(1);
    y = v(2);
    z = v(3);
    
    % Εφαρμογή της προοπτικής με την κάμερα στην αρχή των αξόνων
    res = [f * x / z, f * y / z]; % Εφαρμογή της προοπτικής
end
