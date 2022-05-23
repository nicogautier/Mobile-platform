for n=1:38
    
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


%filter wrong values markers
for j=1:length(x_markers)
    if abs(x_markers(j))>5000
        x_markers(j)=x_markers(j-1);
        y_markers(j)=y_markers(j-1);
    end
end

plot(x_markers, y_markers)
hold on
    
end

plot(0,0,'-k.', 'MarkerSize',40)
hold on
plot(0,500,'-k.', 'MarkerSize',40)
hold on
plot(1000,500,'-k.', 'MarkerSize',40)
hold on
plot(1000,0,'-k.', 'MarkerSize',40)


%title and informations
suptitle(['Comparison of  ',n_txt , ' trajectories computed by ROS navigation using TEB local-planner' ]);