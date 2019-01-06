% Bifurcation
function bifurkation()
interval = [0 30];
% Bifurcationparameter
bi_par = 0:0.01:pi;
% Length/Mass
l = [1 1];
m = [1 1];

figure();
yy = [];
% Loop each parameter
for i = bi_par
    % Integrator
    [t, y] = runge4(@(t,y) dpend(t,y,m,l), interval, [i, i, 0, 0], 10e-3);
    
    % a
    y(:,1) = trim(y(:,1));
    y(:,2) = trim(y(:,2));
    
    % Poincare section \omega_2 = 0
    ind = [];
    y2 = y(:,4);
    for k=2:length(y2)
        k1 = k-1;
        if (y2(k1) > 0 && y2(k) < 0)
            ind = [ind k];
        end
    end
    
    % Plot of bifurcation
    yy = y(ind,3);
    plot((i*180/pi)*ones(length(yy),1), yy, 'black.', 'markersize', 2);
    title('Bifurcation');
    xlabel('$\varphi_1$','interpreter','latex');
    ylabel('$\dot{\varphi_1}$','interpreter','latex');
    hold on;
    i/max(bi_par)
    y = [];
    yy = [];
end