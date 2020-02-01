clc;
clear all;
clear vars;

load faceimages;

x = data(:,1:end-1)';
m = mean(x,2);
x = x - m;

[U , S , V] = svd(x);

ex = randi([1,400]);
H=112;
W=92;

figure(1);
imagesc(reshape(x(:,ex)+m,H,W));


p = 400;
 
A = U(:,1:p);
 
y = A'*x;

newx = A*y;

figure(2);
imagesc(reshape(newx(:,ex)+m,H,W)); 
e = mean(mean((newx - x).^2))


lambda = diag(S);
figure(6);
plot(lambda);
 
