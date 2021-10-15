function [z_root, z_path] = NewtonMethod(f, df, z_0)
    eps=1e-6;
    max_iter=250;
    
    z_path = NaN(max_iter + 1, 1);
    z_path(1) = z_0;
    
    z_path(2) = z_0 - f(z_0)/df(z_0);
    k=1;
    
    while(abs(z_path(k+1)-z_path(k)) > eps)
        k = k + 1;
        if(k > max_iter)
            error('Method did not converge');
        end
        
        z_path(k+1) = z_path(k) - f(z_path(k)) / df(z_path(k));
    end
    z_path = z_path(~isnan(z_path));
    z_root = z_path(end);
end