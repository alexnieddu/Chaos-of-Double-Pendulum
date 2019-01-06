% Visualisation of chaos
function chaos(numberOfPendulums)
time = [0 15];
count = numberOfPendulums;
step = 10e-3;
m = [1 1];
l = [1 1];

% Save as 'out.avi'
% writer = VideoWriter('out.avi');
% writer.FrameRate = 60;
% open(writer);

% Allocate memory
dat = zeros(1501, count * 4);

% Integrator with slightly different inital conditions
% Phi 0,028 degree
for i=1:count
[t, x]  = runge4 (@(t,y) dpend(t,y,[m(1) m(2)],[l(1) l(2)]), time, [(pi/1.5 + i*0.0005) (pi/1.5 + i*0.0005) 0 0], step);
% Save matrix
dat(:,(1:4)+((i-1)*4)) = x;
end

% Initial conditions in cartesian
xx = [0*dat(i,1:4:end)  l(1)*sin(dat(1,1:4:end))  l(1)*sin(dat(1,1:4:end))+l(2)*sin(dat(1,2:4:end))];
yy = [0*dat(i,1:4:end) -l(1)*cos(dat(1,1:4:end)) -l(1)*cos(dat(1,1:4:end))-l(2)*cos(dat(1,2:4:end))];

figure()
p = [];
% Create plot
for J=1:count
    pl = plot(xx(i:count:end),yy(i:count:end), '.-', 'MarkerSize', 30, 'LineWidth', 2);
    p = [p pl];
    hold on
end
axis([-(l(1)+l(2))*1.1 (l(1)+l(2))*1.1 -(l(1)+l(2))*1.1 (l(1)+l(2))*1.1]);

% Animation
for i=1:1501
    xx = [0*dat(i,1:4:end)  l(1)*sin(dat(i,1:4:end))  l(1)*sin(dat(i,1:4:end))+l(2)*sin(dat(i,2:4:end))];
    yy = [0*dat(i,1:4:end) -l(1)*cos(dat(i,1:4:end)) -l(1)*cos(dat(i,1:4:end))-l(2)*cos(dat(i,2:4:end))];
    for j=1:count
        set(p(j), 'XData' , xx(j:count:end) , 'YData' , yy(j:count:end));
        hold on
    end
    drawnow limitrate 
    
%     Save each frame
%     frame = getframe(gcf);
%     writeVideo(writer, frame);
end

end