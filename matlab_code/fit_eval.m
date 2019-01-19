function [selection_probability,fit,ave_fit,max_fit,opt_sol]=fit_eval(Population,N,m)
fit = NaN(N,1);
for i=1:N
    x(1)=Population(i,1);
    x(2)=Population(i,2);
    fit(i)=inversed_function(x);
end
selection_probability=fit/sum(fit);
ave_fit=mean(fit);
[max_fit,max_loc]=max(fit);
opt_sol=Population(max_loc,:);
if (abs(opt_sol(1)) > abs(opt_sol(2)))
    alt(1) = opt_sol(1);
    alt(2) = opt_sol(2);
    opt_sol(1) = alt(2);
    opt_sol(2) = alt(1);
end
return;


