% Read and plot output of the Lorenz-63 model
filename=input('Model output file:','s');
data=load(filename);
x=data(:,1);
y=data(:,2);
z=data(:,3);

figure
t=1:length(x);
plot(t,x,t,y,t,z)
xlim([t(1) t(end)]);
title('Timeseries')
legend({'X','Y','Z'})

figure
plot3(x,y,z)
xlabel('X')
ylabel('Y')
zlabel('Z')
title('Lorenz-63 Butterfly')