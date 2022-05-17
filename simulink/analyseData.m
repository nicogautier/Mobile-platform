%load datas from file
data = load('loop/experiment12.mat');

%remove values before init position
i = 1;
while abs(data.ans.Data(i,4))>0.01  && i<length(data.ans.Data())
    i = i + 1;
end

%markers position
x_markers = data.ans.Data(i:end,1);
y_markers = data.ans.Data(i:end,2);
th_markers = data.ans.Data(i:end,3);

%odometry position
x_odom = data.ans.Data(i:end,4);
y_odom = data.ans.Data(i:end,5);
th_odom = data.ans.Data(i:end,6);


%filter wrong values markers
for j=1:length(x_markers)
    if abs(x_markers(j))>5000
        x_markers(j)=x_markers(j-1);
        y_markers(j)=y_markers(j-1);
        th_markers(j)=th_markers(j-1);
    end
end


%vectors theta
thx_odom = cos(th_odom);
thy_odom = -sin(th_odom);
thx_markers = cos(th_odom);
thy_markers = -sin(th_odom);

%difference
dx = x_markers - x_odom;
dy = y_markers - y_odom;
dv = sqrt(dx.^2 + dy.^2);
dth = th_markers - th_odom;


sc = 20;  
scale = 0.5;

subplot(3,2,1);
quiver(x_markers(1:sc:end), y_markers(1:sc:end), thx_markers(1:sc:end), thy_markers(1:sc:end),scale)
axis equal
legend('markers')
title('Trajectory markers')
xlabel('x [mm]')
ylabel('y [mm]')



subplot(3,2,3);
quiver(x_odom(1:sc:end), y_odom(1:sc:end), thx_odom(1:sc:end), thy_odom(1:sc:end),scale, 'color', [0.8500, 0.3250, 0.0980])
axis equal
legend('odometry')
title('Trajectory odometry')
xlabel('x [mm]')
ylabel('y [mm]')

subplot(3,2,[5,6]);

plot(x_markers, y_markers, x_odom, y_odom)
axis equal
legend('markers','odometry')
title('Comparaison markers/odometry trajectories')
xlabel('x [mm]')
ylabel('y [mm]')



subplot(3,2,2);
plot([dx,dy,dv])
legend('dx','dy', 'dpos')
title('Difference position markers and odometry')
xlabel('time [ms]')
ylabel('difference [mm]')



subplot(3,2,4);
plot(dth)
legend('dth')
title('Difference rotation markers and odometry')
xlabel('time [ms]')
ylabel('difference [rad]')

disp(['pos: ' num2str(sqrt(x_markers(end)^2 + y_markers(end)^2)),' x: ' , num2str(x_markers(end)), ' y: ', num2str(y_markers(end)), ' th: ' ,num2str(th_markers(end))])







