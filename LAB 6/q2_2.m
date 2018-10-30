clc
clear all

fs = 5000;
fm = 50;
T = 1/fm;

t = 0:0.00001:T;

xt = sin(2*pi*fm.*t);
xtd = zeros(1,length(xt));

xtd(1) = 0;
xtd(2:length(xt)) = xt(1:length(xt)-1);

dt = xt - xtd;

mx = max(dt);
mn = min(dt);

%partition = [-31/32,-29/32,-27/32,-25/32,-23/32,-21/32,-19/32,-17/32,-15/32,-13/32,-11/32,-9/32,-7/32,-5/32,-3/32,0,3/32,5/32,7/32,9/32,11/32,13/32,15/32,17/32,19/32,21/32,23/32,25/32,27/32,29/32,31/32];

partition = [mn:(mx-mn)/31:mx];

codebook = [mn:(mx-mn)/31: mx+(mx-mn)/31];

[index,quantz] = quantiz(dt,partition,codebook);

ans = zeros(1,length(quantz));

ans(1) = quantz(1);

for i = 2:length(quantz)
    ans(i) = ans(i-1) + quantz(i);
end

plot(t,xt,t,ans);
figure();
plot(t,dt);


pcmt = zeros(5,length(t));

code = zeros(5,1);

rmse = sqrt(mean((xt - ans).^2));