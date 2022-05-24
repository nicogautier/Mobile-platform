set(groot, 'defaultFigureWindowState', 'maximized');

n = 45;

%do for each experiment
for n=1:48



if n<10
    n_txt = ['0' , num2str(n)];
else
    n_txt = num2str(n);
end

%load datas from file
data = load(['experiments/experiment',n_txt,'.mat']);

prepareData;
differencePosition;
differenceTrajectory;

close all
end
