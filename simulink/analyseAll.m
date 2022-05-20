n_expe = 38;

%prepare arrays
dx_odom_opto = zeros( n_expe,1 );
dy_odom_opto = zeros( n_expe,1 );
dth_odom_opto = zeros( n_expe,1 );

dx_tf_opto = zeros( n_expe,1 );
dy_tf_opto = zeros( n_expe,1 );
dth_tf_opto = zeros( n_expe,1 );

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

%compute differences
dx_odom_opto(n)= abs(abs(x_markers(end))-abs(x_odom(end)));
dy_odom_opto(n)= abs(abs(y_markers(end))-abs(y_odom(end)));
dth_odom_opto(n)= abs(abs(th_markers(end)-abs(th_markers(1)))-abs(th_odom(end)-th_odom(1)));

dx_tf_opto(n)= abs(abs(x_markers(end))-abs(x_tf(end)));
dy_tf_opto(n)= abs(abs(y_markers(end))-abs(y_tf(end)));
dth_tf_opto(n)= abs(abs(th_markers(end)-abs(th_markers(1)))-abs(th_tf(end)-th_tf(1)));


dx_opto(n)= abs(x_markers(end));
dy_opto(n)= abs(y_markers(end));
dth_opto(n)= abs(th_markers(end))-abs(th_markers(1));

dx_odom(n)= abs(x_odom(end));
dy_odom(n)= abs(y_odom(end));
dth_odom(n)= abs(th_odom(end))-abs(th_odom(1));

dx_tf(n)= abs(x_tf(end));
dy_tf(n)= abs(y_tf(end));
dth_tf(n)= abs(th_tf(end))-abs(th_tf(1));
    
end

%plot diff initial/final positions
subplot(3,2,1);
plot([dx_odom,dy_odom]);
yline(mean(dx_odom),'--', ['avg dx: ', num2str(mean(dx_odom)), ' mm'])
yline(mean(dy_odom),'--', ['avg dy: ', num2str(mean(dy_odom)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference odometry position  initial/final position')
legend('dx','dy')

subplot(3,2,3);
plot([dx_tf,dy_tf]);
yline(mean(dx_tf),'--', ['avg dx: ', num2str(mean(dx_tf)), ' mm'])
yline(mean(dy_tf),'--', ['avg dy: ', num2str(mean(dy_tf)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference transforms position initial/final position')
legend('dx','dy')

subplot(3,2,5);
plot([dx_opto,dy_opto]);
yline(mean(dx_opto),'--', ['avg dx: ', num2str(mean(dx_opto)), ' mm'])
yline(mean(dy_opto),'--', ['avg dy: ', num2str(mean(dy_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference optotrak position initial/final position')
legend('dx','dy')


subplot(3,2,2);
plot([dth_odom, dth_tf,dth_opto]);
yline(mean(dth_odom),'--', ['avg odom: ', num2str(mean(dth_odom)), ' rad'])
yline(mean(dth_tf),'--', ['avg tf: ', num2str(mean(dth_odom)), ' rad'])
yline(mean(dth_opto),'--', ['avg opto: ', num2str(mean(dth_odom)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference odometry, transforms and optotrak rotation initial/final position')
legend('odometry', 'tranforms', 'optotrak')


%plot diff with optotrak
subplot(3,2,4);
plot([dx_odom_opto,dy_odom_opto]);
yline(mean(dx_odom_opto),'--', ['avg dx: ', num2str(mean(dx_odom_opto)), ' mm'])
yline(mean(dy_odom_opto),'--', ['avg dy: ', num2str(mean(dy_odom_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position odometry/optotrak final position')
legend('dx','dy')

subplot(3,2,6);
plot([dx_tf_opto,dy_tf_opto]);
yline(mean(dx_tf_opto),'--', ['avg dx: ', num2str(mean(dx_tf_opto)), ' mm'])
yline(mean(dy_tf_opto),'--', ['avg dy: ', num2str(mean(dy_tf_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position transforms/optotrak final position')
legend('dx','dy')

suptitle(['Comparaison between initial and final position on ' ,num2str(n_expe) , ' experiments' ]);