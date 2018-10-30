clear all;
close all;
clc;

fs = 5000;
t1 = 1/50;
ts = 1/fs;
t = 0:ts:t1-ts;
mt = sin(2*pi*50*t);
stem(mt);

mat = zeros(1,33);
mat(1,1)= -1;

for i=2:33
    mat(1,i) = mat(1,i-1) + 2/32;
end

mat2 = zeros(1,32);

for i=1:32
    mat2(1,i) = (mat(1,i) + mat(1,i+1))/2;
end

temp = zeros(1,length(mt));

for i=1:length(mt)
        if mt(1,i) <= mat2(1,1)
            temp(1,i) = (-1-1 + 2/32)/2;
        elseif mt(1,i) >= mat2(1,32)
            temp(1,i) = (1+1-2/32)/2 ;
        else
            for j=2:32
                if mt(1,i) <= mat2(1,j) && mt(1,i)> mat2(1,j-1)
                    if abs(mt(1,i) - mat2(1,j)) < abs(mt(1,i) - mat2(1,j-1))
                        temp(1,i) = mat2(1,j);
                    else
                        temp(1,i) = mat2(1,j-1);
                    end
                end
          
            end
        end
end

temp2 = zeros(1,5*length(temp));
st = 1;
for i=1:length(temp)
    for j=1:32
        if temp(1,i) == mat2(1,j)
            b = decimalToBinaryVector(j-1, 5, 'MSBFirst');
        end
    end
    for j=1:5
        temp2(1,st) = b(1,j);
        st = st+1;
    end
end


% decoding the signal

%origmt;
temp3 = zeros(1,length(temp));
st = 1;
for i=1:+5:length(temp2)
    c = zeros(1,5);
    for j=1:5
        c(1,j) = temp2(1,i+j-1);
        %i = i+1;
    end
    temp3(1,st) = binaryVectorToDecimal(c); 
    st = st+1;
    %i = i-1;
end
subplot(2,1,1);
stem(temp2);
hold on;
subplot(2,1,2);
stem(temp3);
