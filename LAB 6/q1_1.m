fs = 5000;
fm = 50;
T = 1/fm;

t = 0:0.00001:T;

xt = sin(2*pi*fm.*t);

partition = [-1:(2/31):1];

codebook = [-1: (2/31): 1+(2/31)];

[index,quantz] = quantiz(xt,partition,codebook);

plot(t,xt,'r',t,quantz,'b');
figure;

pcmt = zeros(5,length(t));

code = zeros(5,1);

rmse = sqrt(mean((xt - quantz).^2));