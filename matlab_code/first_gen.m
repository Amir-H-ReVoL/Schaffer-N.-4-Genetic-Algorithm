function[Pop]=first_gen(N,m,Lo,Hi)
Pop = NaN(N,m);
for j=1 : m
    Pop(:,j)=Lo(j)+(Hi(j)-Lo(j))*rand(N,1);
end
return;