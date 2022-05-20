
%n = 2;

%do for each experiment
for n=1:38

if n<10
    n_txt = ['0' , num2str(n)];
else
    n_txt = num2str(n);
end

%open full screen figure
figure;
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

%load datas from file
data = load(['experiments/experiment',n_txt,'.mat']);

%remove values before init position
i = 1;
while abs(data.ans.Data(i,1))>0.01  && i<length(data.ans.Data())
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

%transform position
x_tf = data.ans.Data(i:end,7);
y_tf = data.ans.Data(i:end,8);
th_tf = data.ans.Data(i:end,9);


%filter wrong values markers
for j=1:length(x_markers)
    if abs(x_markers(j))>5000
        x_markers(j)=x_markers(j-1);
        y_markers(j)=y_markers(j-1);
    end
end



%vectors theta
thx_odom = cos(th_odom);
thy_odom = -sin(th_odom);
thx_markers = cos(th_odom);
thy_markers = -sin(th_odom);
thx_tf = cos(th_tf);
thy_tf = -sin(th_tf);

%differences
dx_mo = x_markers - x_odom;
dy_mo = y_markers - y_odom;
dth_mo = th_markers - th_odom;

dx_mtf = x_markers - x_tf;
dy_mtf = y_markers - y_tf;
dth_mtf = th_markers - th_tf;


%filter noise differences  due to difference in reception frequencies
size = 100;
b = (1/size)*ones(1,size);
dx_mo = filter(b,1,dx_mo);
dy_mo = filter(b,1,dy_mo);
dth_mo = filter(b,1,dth_mo);
dx_mtf = filter(b,1,dx_mtf);
dy_mtf = filter(b,1,dy_mtf);
dth_mtf = filter(b,1,dth_mtf);

%plots difference position over time
subplot(4,3,[1,2]);
plot([ dx_mo,dy_mo])
yline(mean(dx_mo),'--', ['avg dx: ', num2str(mean(dx_mo)), ' mm'])
yline(mean(dy_mo),'--', ['avg dy: ', num2str(mean(dy_mo)), ' mm'])
legend('dx','dy','Location','northwest')
title('Difference position between odometry and markers')
xlabel('time [10 ms]')
ylabel('difference [mm]')

subplot(4,3,[4,5]);
plot([dx_mtf,dy_mtf])
yline(mean(dx_mtf),'--', ['avg dx: ', num2str(mean(dx_mtf)), ' mm'])
yline(mean(dy_mtf),'--', ['avg dy: ', num2str(mean(dy_mtf)), ' mm'])
legend('dx','dy','Location','northwest')
title('Difference position between transforms and markers')
xlabel('time [10 ms]')
ylabel('difference [mm]')

subplot(4,3,[7,8]);
plot([dth_mo, dth_mtf])
legend('dth odom', 'dth transforms')
title('Difference rotation between markers and odometry and between markers and transforms')
xlabel('time [10 ms]')
ylabel('difference [rad]')



%plot trajectories with vector
sc = 100;  
subplot(4,3,3);
quiver(x_markers(1:sc:end), y_markers(1:sc:end), thx_markers(1:sc:end), thy_markers(1:sc:end),0.5)
axis equal
title('Trajectory markers')
xlabel('x [mm]')
ylabel('y [mm]')


subplot(4,3,6);
quiver(x_odom, y_odom, thx_odom, thy_odom,3)
axis equal
title('Trajectory odometry')
xlabel('x [mm]')
ylabel('y [mm]')


subplot(4,3,9);
quiver(x_tf, y_tf, thx_tf, thy_tf,3)
axis equal
title('Trajectory transforms')
xlabel('x [mm]')
ylabel('y [mm]')


%plot all trajectories
subplot(4,3,[11,12]);
plot(x_markers, y_markers, x_odom, y_odom, x_tf, y_tf)
hold on
plot(0,0,'-k.', 'MarkerSize',20)
hold on
plot(0,500,'-k.', 'MarkerSize',20)
hold on
plot(1000,500,'-k.', 'MarkerSize',20)
hold on
plot(1000,0,'-k.', 'MarkerSize',20)
axis equal
legend('markers','odometry','transforms')
title('Comparaison markers, odometry and transforms trajectories')
xlabel('x [mm]')
ylabel('y [mm]')



%title and informations
suptitle(['Comparaison odometry, ROS transforms and Optotrak - experiment n°' ,n_txt]);

txt_diff_mo = ['Difference odometry/markers:',newline,'x [mm]:  max: ' , num2str(max(max(dx_mo), abs(min(dx_mo)))), '  avg: ',num2str(mean(dx_mo)), '  final position: ', num2str(dx_mo(end)),newline,'y [mm]:  max: ' , num2str(max(max(dy_mo), abs(min(dy_mo)))), '  avg: ',num2str(mean(dy_mo)), '  final position: ', num2str(dy_mo(end)),newline,'th [rad]:  max: ' , num2str(max(max(dth_mo), abs(min(dth_mo)))), '  avg: ',num2str(mean(dth_mo)), '  final position: ', num2str(dth_mo(end)),newline,newline];
txt_diff_mtf = ['Difference transforms/markers:',newline,'x [mm]:  max: ' , num2str(max(max(dx_mtf), abs(min(dx_mtf)))), '  avg: ',num2str(mean(dx_mtf)), '  final position: ', num2str(dx_mtf(end)),newline,'y [mm]:  max: ' , num2str(max(max(dy_mtf), abs(min(dy_mtf)))), '  avg: ',num2str(mean(dy_mtf)), '  final position: ', num2str(dy_mtf(end)),newline,'th [rad]:  max: ' , num2str(max(max(dth_mtf), abs(min(dth_mtf)))), '  avg: ',num2str(mean(dth_mtf)), '  final position: ', num2str(dth_mtf(end)),newline,newline];
txt_diff_init = ['Difference between initial and final positions:',newline, 'markers:  x [mm]: ', num2str(x_markers(end)), '  y [mm]: ', num2str(y_markers(end)) , '  th [rad]: ', num2str(th_markers(end)), newline, 'odometry:  x [mm]: ', num2str(x_odom(end)), '  y [mm]: ', num2str(y_odom(end)) , '  th [rad]: ', num2str(th_odom(end)), newline, 'transforms:  x [mm]: ', num2str(x_tf(end)), '  y [mm]: ', num2str(y_tf(end)) , '  th [rad]: ', num2str(th_tf(end)) ];
annotation('textbox', [0.14, 0.27, 0.25, 0], 'string', [txt_diff_mo,txt_diff_mtf,txt_diff_init])

%save as png
saveas(gcf, [n_txt,'.png'])

end
