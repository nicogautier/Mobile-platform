n_expe = 48;

%prepare arrays
dx_odom_opto = zeros( n_expe,1 );
dy_odom_opto = zeros( n_expe,1 );
dth_odom_opto = zeros( n_expe,1 );

dx_tf_opto = zeros( n_expe,1 );
dy_tf_opto = zeros( n_expe,1 );
dth_tf_opto = zeros( n_expe,1 );

avg_dx_odom_opto = zeros( n_expe,1 );
avg_dy_odom_opto = zeros( n_expe,1 );
avg_dth_odom_opto = zeros( n_expe,1 );

avg_dx_tf_opto = zeros( n_expe,1 );
avg_dy_tf_opto = zeros( n_expe,1 );
avg_dth_tf_opto = zeros( n_expe,1 );

dx_odom = zeros( n_expe,1 );
dy_odom = zeros( n_expe,1 );
dth_odom = zeros( n_expe,1 );

dx_opto = zeros( n_expe,1 );
dy_opto = zeros( n_expe,1 );
dth_opto = zeros( n_expe,1 );

dx_tf = zeros( n_expe,1 );
dy_tf = zeros( n_expe,1 );
dth_tf = zeros( n_expe,1 );



%for each experiment
for n=1:n_expe
    
    if n<10
        n_txt = ['0' , num2str(n)];
    else
        n_txt = num2str(n);
    end
    

%load datas from file
data = load(['experiments/experiment',n_txt,'.mat']);

prepareData;

%compute differences
dx_odom_opto(n)= dx_mo(end);
dy_odom_opto(n)= dy_mo(end);
dth_odom_opto(n)= (th_markers(end)-th_markers(1))-(th_odom(end)-th_odom(1));

dx_tf_opto(n)= dx_mtf(end);
dy_tf_opto(n)= dy_mtf(end);
dth_tf_opto(n)= (th_markers(end)-th_markers(1))-(th_tf(end)-th_tf(1));


dx_opto(n)= x_markers(end);
dy_opto(n)= y_markers(end);
dth_opto(n)= th_markers(end)-th_markers(1);

dx_odom(n)= x_odom(end);
dy_odom(n)= y_odom(end);
dth_odom(n)= th_odom(end)-th_odom(1);

dx_tf(n)= x_tf(end);
dy_tf(n)= y_tf(end);
dth_tf(n)= th_tf(end)-th_tf(1);

avg_dx_odom_opto(n)= mean(dx_mo);
avg_dy_odom_opto(n)= mean(dy_mo);
avg_dth_odom_opto(n)= mean(dth_mo);

avg_dx_tf_opto(n)= mean(dx_mtf);
avg_dy_tf_opto(n)= mean(dy_mtf);
avg_dth_tf_opto(n)= mean(dth_mtf);
    
end

figure;

%plot diff initial/final positions
subplot(2,2,1);
plot([dx_odom,dy_odom]);
yline(mean(dx_odom),'--', ['avg dx: ', num2str(mean(dx_odom)), ' mm'])
yline(mean(dy_odom),'--', ['avg dy: ', num2str(mean(dy_odom)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference odometry position  initial/final position')
legend('dx','dy','Location','southwest')

subplot(2,2,2);
plot([dx_tf,dy_tf]);
yline(mean(dx_tf),'--', ['avg dx: ', num2str(mean(dx_tf)), ' mm'])
yline(mean(dy_tf),'--', ['avg dy: ', num2str(mean(dy_tf)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference transforms position initial/final position')
legend('dx','dy','Location','southwest')

subplot(2,2,3);
plot([dx_opto,dy_opto]);
yline(mean(dx_opto),'--', ['avg dx: ', num2str(mean(dx_opto)), ' mm'])
yline(mean(dy_opto),'--', ['avg dy: ', num2str(mean(dy_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference optotrak position initial/final position')
legend('dx','dy','Location','southwest')


subplot(2,2,4);
plot([dth_odom, dth_tf,dth_opto]);
yline(mean(dth_odom),'--', ['avg odom: ', num2str(mean(dth_odom)), ' rad'])
yline(mean(dth_tf),'--', ['avg tf: ', num2str(mean(dth_tf)), ' rad'])
yline(mean(dth_opto),'--', ['avg opto: ', num2str(mean(dth_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference odometry, transforms and optotrak rotation initial/final position')
legend('odometry', 'tranforms', 'optotrak','Location','southwest')




suptitle(['Comparaison between initial and final position on ' ,num2str(n_expe) , ' experiments' ]);


figure;

%plot diff with optotrak final pos
subplot(3,2,1);
plot([dx_odom_opto,dy_odom_opto]);
yline(mean(dx_odom_opto),'--', ['avg dx: ', num2str(mean(dx_odom_opto)), ' mm'])
yline(mean(dy_odom_opto),'--', ['avg dy: ', num2str(mean(dy_odom_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position odometry/optotrak final position')
legend('dx','dy','Location','southwest')

subplot(3,2,3);
plot([dx_tf_opto,dy_tf_opto]);
yline(mean(dx_tf_opto),'--', ['avg dx: ', num2str(mean(dx_tf_opto)), ' mm'])
yline(mean(dy_tf_opto),'--', ['avg dy: ', num2str(mean(dy_tf_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position transforms/optotrak final position')
legend('dx','dy','Location','southwest')

subplot(3,2,5);
plot([dth_odom_opto,dth_tf_opto]);
yline(mean(dth_odom_opto),'--', ['avg d_{odom}: ', num2str(mean(dth_odom_opto)), ' rad'])
yline(mean(dth_tf_opto),'--', ['avg d_{tf}: ', num2str(mean(dth_tf_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference rotation odometry/optotrak and transforms/optotrak final position')
legend('d_{odom}','d_{tf}','Location','southwest')



%plot diff with optotrak avg
subplot(3,2,2);
plot([avg_dx_odom_opto,avg_dy_odom_opto]);
yline(mean(avg_dx_odom_opto),'--', ['avg dx: ', num2str(mean(avg_dx_odom_opto)), ' mm'])
yline(mean(avg_dy_odom_opto),'--', ['avg dy: ', num2str(mean(avg_dy_odom_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position odometry/optotrak average')
legend('dx','dy','Location','southwest')

subplot(3,2,4);
plot([avg_dx_tf_opto,avg_dy_tf_opto]);
yline(mean(avg_dx_tf_opto),'--', ['avg dx: ', num2str(mean(avg_dx_tf_opto)), ' mm'])
yline(mean(avg_dy_tf_opto),'--', ['avg dy: ', num2str(mean(avg_dy_tf_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position transforms/optotrak average')
legend('dx','dy','Location','southwest')

subplot(3,2,6);
plot([avg_dth_odom_opto,avg_dth_tf_opto]);
yline(mean(avg_dth_odom_opto),'--', ['avg d_{odom}: ', num2str(mean(avg_dth_odom_opto)), ' rad'])
yline(mean(avg_dth_tf_opto),'--', ['avg d_{tf}: ', num2str(mean(avg_dth_tf_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference rotation odometry/optotrak and transforms/optotrak average')
legend('d_{odom}','d_{tf}','Location','southwest')

suptitle(['Comparaison between odometry/optotrak and transforms/optotrak on ' ,num2str(n_expe) , ' experiments' ]);




figure;

d_odom = sqrt(dx_odom.*dx_odom + dy_odom.*dy_odom);
d_tf = sqrt(dx_tf.*dx_tf + dy_tf.*dy_tf);
d_opto = sqrt(dx_opto.*dx_opto + dy_opto.*dy_opto);

%plot diff initial/final positions
subplot(2,2,1);
plot([d_odom,d_tf,d_opto]);
yline(mean(d_odom),'--', ['avg d_{odom}: ', num2str(mean(d_odom)), ' mm'])
yline(mean(d_tf),'--', ['avg d_{tf}: ', num2str(mean(d_tf)), ' mm'])
yline(mean(d_opto),'--', ['avg d_{opto}: ', num2str(mean(d_opto)), ' mm'])

xlabel('experiment')
ylabel('difference [mm]')
title('Difference odometry, transforms and optotrak position initial/final position')
legend('d_{odom}','d_{tf}','d_{opto}','Location','southwest')



subplot(2,2,3);
plot([dth_odom, dth_tf,dth_opto]);
yline(mean(dth_odom),'--', ['avg odom: ', num2str(mean(dth_odom)), ' rad'])
yline(mean(dth_tf),'--', ['avg tf: ', num2str(mean(dth_tf)), ' rad'])
yline(mean(dth_opto),'--', ['avg opto: ', num2str(mean(dth_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference odometry, transforms and optotrak rotation initial/final position')
legend('odometry', 'tranforms', 'optotrak','Location','southwest')


avg_odom_opto = sqrt(avg_dx_odom_opto.*avg_dx_odom_opto + avg_dy_odom_opto.*avg_dy_odom_opto);
avg_tf_opto = sqrt(avg_dx_tf_opto.*avg_dx_tf_opto + avg_dy_tf_opto.*avg_dy_tf_opto);

subplot(2,2,2);
plot([avg_odom_opto,avg_tf_opto]);
yline(mean(avg_odom_opto),'--', ['avg d_{odom/opto}: ', num2str(mean(avg_odom_opto)), ' mm'])
yline(mean(avg_tf_opto),'--', ['avg d_{tf/opto}: ', num2str(mean(avg_tf_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Average difference in position odometry and transforms compared to optotrak')
legend('d_{odom/opto}','d_{tf/opto}','Location','southwest')


subplot(2,2,4);
plot([avg_dth_odom_opto,avg_dth_tf_opto]);
yline(mean(avg_dth_odom_opto),'--', ['avg d_{odom}: ', num2str(mean(avg_dth_odom_opto)), ' rad'])
yline(mean(avg_dth_tf_opto),'--', ['avg d_{tf}: ', num2str(mean(avg_dth_tf_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference rotation odometry/optotrak and transforms/optotrak average')
legend('d_{odom}','d_{tf}','Location','southwest')

