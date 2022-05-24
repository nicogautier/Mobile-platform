

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
        th_markers(j)=th_markers(j-1);
    end
end

%filter unexpected remained spikes
windowSize = 50; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;

x_markers = filter(b,a,x_markers);
y_markers = filter(b,a,y_markers);
th_markers = filter(b,a,th_markers);



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

