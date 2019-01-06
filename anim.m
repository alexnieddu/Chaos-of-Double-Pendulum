% Animation and Diagram of phasespace
function anim(phi, m, l, t)
time = [0 t];
% Integrator
[t, x]  = runge4(@(t,y) dpend(t,y,[m(1) m(2)],[l(1) l(2)]), time, [phi(1) phi(2) 0 0], 10e-3);
x
phi1i = x(:, 1);    
phi2i = x(:, 2);

% Initial time
T = t(1);

% Initial condition in cartesian
xx = [0  l(1)*sin(phi1i(1))  l(1)*sin(phi1i(1))+l(2)*sin(phi2i(1))] ;
yy = [0 -l(1)*cos(phi1i(1)) -l(1)*cos(phi1i(1))-l(2)*cos(phi2i(1))] ;

hold on
p = plot (xx,yy, '.-', 'MarkerSize', 30, 'LineWidth', 2);
axis (1.1*[-(l(1)+l(2)) (l(1)+l(2)) -(l(1)+l(2)) (l(1)+l(2))]);
title('Animation');

% Animation
for j = 1:length(t)
    xx = [0   l(1)*sin(phi1i(j))   l(1)*sin(phi1i(j))+l(2)*sin(phi2i(j))];
    yy = [0  -l(1)*cos(phi1i(j))  -l(1)*cos(phi1i(j))-l(2)*cos(phi2i(j))];
    set(p , 'XData' , xx , 'YData' , yy)
    %pause(0.0005);
    drawnow;
end

figure()
% Plot of diagram of phasespace
subplot(2,2,1);
plot(x(:,1),x(:,3));
title('oberes Pendel');
xlabel('$\varphi_1$','interpreter','latex');
ylabel('$\dot{\varphi_1}$','interpreter','latex');
set(get(gca,'YLabel'),'Rotation',0)
subplot(2,2,2);
plot(x(:,2),x(:,4));
title('unteres Pendel');
xlabel('$\varphi_2$','interpreter','latex');
ylabel('$\dot{\varphi_2}$','interpreter','latex');
set(get(gca,'YLabel'),'Rotation',0)
subplot(2,2,3);
plot(t,x(:,1));
title('oberes Pendel');
xlabel('$t$','interpreter','latex');
ylabel('$\varphi_1$','interpreter','latex');
set(get(gca,'YLabel'),'Rotation',0)
subplot(2,2,4);
plot(t,x(:,2));
title('unteres Pendel');
xlabel('$t$','interpreter','latex');
ylabel('$\varphi_2$','interpreter','latex');
set(get(gca,'YLabel'),'Rotation',0)

end