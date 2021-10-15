a=20;

nsim =5 ;
rng(45);
x_0 = unifrnd(0,a/2,nsim,1);
x_0 = sort(x_0);

iter_vec = zeros(nsim, 1);

figure(1);
for k=1:nsim
    [~, path, iter] = heron_method(a,x_0(k));
    iter_vec(k)= iter;
    
    plot(0:iter,path,'-square');
    hold on;
end

hold off;
xlabel('Количество итераций');
ylabel('x_0');

figure(2);
plot(x_0,iter_vec,'-s');
xlabel('x_0');
ylabel('Количество итераций');