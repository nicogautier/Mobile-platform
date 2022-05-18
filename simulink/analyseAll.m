n_expe = 10;

dx_odom_opto = zeros( n_expe,1 );
dy_odom_opto = zeros( n_expe,1 );
dth_odom_opto = zeros( n_expe,1 );

dx_odom = zeros( n_expe,1 );
dy_odom = zeros( n_expe,1 );
dth_odom = zeros( n_expe,1 );

dx_opto = zeros( n_expe,1 );
dy_opto = zeros( n_expe,1 );
dth_opto = zeros( n_expe,1 );


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
    


dx_odom_opto(n)= abs(abs(x_markers(end))-abs(x_odom(end)));
dy_odom_opto(n)= abs(abs(y_markers(end))-abs(y_odom(end)));
dth_odom_opto(n)= abs(abs(th_markers(end)-abs(th_markers(1)))-abs(th_odom(end)-th_odom(1)));


dx_opto(n)= abs(x_markers(end));
dy_opto(n)= abs(y_markers(end));
dth_opto(n)= abs(th_markers(end))-abs(th_markers(1));

dx_odom(n)= abs(x_odom(end));
dy_odom(n)= abs(y_odom(end));
dth_odom(n)= abs(th_odom(end))-abs(th_odom(1));
    
    
end


subplot(3,2,1);
plot([dx_odom,dy_odom]);
yline(mean(dx_odom),'--', ['avg dx: ', num2str(mean(dx_odom)), ' mm'])
yline(mean(dy_odom),'--', ['avg dy: ', num2str(mean(dy_odom)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference odometry position  initial/final position')
legend('dx','dy')


subplot(3,2,2);
plot(dth_odom);
yline(mean(dth_odom),'--', ['avg dth: ', num2str(mean(dth_odom)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference odometry rotation initial/final position')
legend('dth')

subplot(3,2,3);
plot([dx_opto,dy_opto]);
yline(mean(dx_opto),'--', ['avg dx: ', num2str(mean(dx_opto)), ' mm'])
yline(mean(dy_opto),'--', ['avg dy: ', num2str(mean(dy_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference optotrak position initial/final position')
legend('dx','dy')

subplot(3,2,4);
plot(dth_opto);
yline(mean(dth_opto),'--', ['avg dth: ', num2str(mean(dth_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference optotrak rotation initial/final rotation')
legend('dth')

subplot(3,2,5);
plot([dx_odom_opto,dy_odom_opto]);
yline(mean(dx_odom_opto),'--', ['avg dx: ', num2str(mean(dx_odom_opto)), ' mm'])
yline(mean(dy_odom_opto),'--', ['avg dy: ', num2str(mean(dy_odom_opto)), ' mm'])
xlabel('experiment')
ylabel('difference [mm]')
title('Difference position odometry/optotrak final position')
legend('dx','dy')

subplot(3,2,6);
plot(dth_odom_opto);
yline(mean(dth_odom_opto),'--', ['avg dth: ', num2str(mean(dth_odom_opto)), ' rad'])
xlabel('experiment')
ylabel('difference [rad]')
title('Difference rotation odometry/optotrak final position')
legend('dth')


suptitle(['Comparaison initial and final position on ' ,num2str(n_expe) , ' experiments' ]);