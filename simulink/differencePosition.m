
%open full screen figure
figure;



%comparaison trajectory
subplot(3,2,1)
plot([x_markers,x_odom,x_tf])
legend('markers','odometry','transforms')
title('Comparison of markers, odometry and transforms on the x axis')
xlabel('time [10ms]')
ylabel('x [mm]')

subplot(3,2,3)
plot([y_markers,y_odom,y_tf])
legend('markers','odometry','transforms')
title('Comparison of markers, odometry and transforms on the y axis')
xlabel('time [10ms]')
ylabel('y [mm]')

subplot(3,2,5)
plot([th_markers,th_odom,th_tf])
legend('markers','odometry','transforms')
title('Comparison of markers, odometry and transforms on rotation')
xlabel('time [10ms]')
ylabel('th [rad]')

%difference
subplot(3,2,2)
plot([dx_mo,dx_mtf])
title('Difference between transforms and odometry compared to markers on the x axis')
xlabel('time [10ms]')
ylabel('dx [mm]')
yline(mean(dx_mo),'--', ['avg d_{odom}: ', num2str(mean(dx_mo)), ' mm'])
yline(mean(dx_mtf),'--', ['avg d_{tf}: ', num2str(mean(dx_mtf)), ' mm'])
legend('d_{odom}','d_{tf}','Location','northwest')
%ylim([-200 100])

subplot(3,2,4)
plot([dy_mo,dy_mtf])
title('Difference between transforms and odometry compared to markers on the y axis')
xlabel('time [10ms]')
ylabel('dy [mm]')
yline(mean(dy_mo),'--', ['avg d_{odom}: ', num2str(mean(dy_mo)), ' mm'])
yline(mean(dy_mtf),'--', ['avg d_{tf}: ', num2str(mean(dy_mtf)), ' mm'])
legend('d_{odom}','d_{tf}','Location','northwest')
%ylim([-100 300])

subplot(3,2,6)
plot([dth_mo,dth_mtf])
title('Difference between transforms and odometry compared to markers on rotation')
xlabel('time [10ms]')
ylabel('dth [rad]')
yline(mean(dth_mo),'--', ['avg d_{odom}: ', num2str(mean(dth_mo)), ' rad'])
yline(mean(dth_mtf),'--', ['avg d_{tf}: ', num2str(mean(dth_mtf)), ' rad'])
legend('d_{odom}','d_{tf}','Location','northwest')
%ylim([-0.4 0.2])




suptitle(['Comparaison odometry, ROS transforms and Optotrak on position and rotation - experiment n°' ,n_txt]);
saveas(gcf, ['./results/diffPos',n_txt,'.png'])


