%open full screen figure
figure;


%plot trajectories with vector
sc = 40;  
subplot(3,3,1);
quiver(x_markers(1:sc:end), y_markers(1:sc:end), thx_markers(1:sc:end), thy_markers(1:sc:end),0.5)
axis equal
title('Trajectory markers')
xlabel('x [mm]')
ylabel('y [mm]')


subplot(3,3,4);
quiver(x_odom(1:sc:end), y_odom(1:sc:end), thx_odom(1:sc:end), thy_odom(1:sc:end),0.5)
axis equal
title('Trajectory odometry')
xlabel('x [mm]')
ylabel('y [mm]')


subplot(3,3,7);
quiver(x_tf(1:sc:end), y_tf(1:sc:end), thx_tf(1:sc:end), thy_tf(1:sc:end),0.5)
axis equal
title('Trajectory transforms')
xlabel('x [mm]')
ylabel('y [mm]')



%plot all trajectories
subplot(4,3,[2,3,5,6,8,9]);
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
xlim([-400 1400])
ylim([-400 900])


suptitle(['Comparaison trajectory odometry, ROS transforms and Optotrak - experiment n°' ,n_txt]);
saveas(gcf, ['./results/diffTraj',n_txt,'.png'])