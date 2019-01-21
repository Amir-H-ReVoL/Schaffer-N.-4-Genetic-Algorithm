%% initial settings
format long;

%% GA Parameters
N=150;
Pc=1;
Pm=0.045;
scale=0.8;
m=2;
Lo=[-10 -10];
Hi=[10 10];
Iteration = 500;

%% Average Parameters
mulBestSoFar = NaN(runs);
mulAverageFitness = NaN(runs);
mulFinalSol = NaN(runs,m);

%% run GA
for r = 1 : runs
    
    %% Create First Generation
    Population=first_generation(N,m,Lo,Hi);
    
    %% initial best so far, average fitness, base it value, logical value for end condotion 
    best_so_far=[];
    Average_fitness=[];
    it =1;
    s =true;
    
    %% GA
    while(s)
        
        %% Calculate SB, fitness
        [selection_probability,fit,ave_fit,max_fit,opt_sol]=fitness_evaluation(Population,N);
        
        %% Check Fitness Value
        if it==1
            best_so_far(it)=max_fit;
            final_sol=opt_sol;
        elseif max_fit>best_so_far(it-1)
            best_so_far(it)=max_fit;
            final_sol=opt_sol;
        else
            best_so_far(it)=best_so_far(it-1);
        end
        
        %%
        Average_fitness(it)=ave_fit;
        mulBestSoFar(r,it) = best_so_far(it);
        mulAverageFitness(r,it) = Average_fitness(it);
        for h=1:m
            mulFinalSol(r,h) = final_sol(h);
        end
        
        %% 
        [mating_pool]=roulette_wheel(Population,N,m,selection_probability);
        [new_pop]=crossover(mating_pool,Pc,N,m,Hi,Lo);
        [Population]=mutation(new_pop,Pm,N,m,scale,Hi,Lo);
        
        %% end condition
        temp = func(final_sol(1),final_sol(2));
        if (((abs(final_sol(1)) < 0.009)&&(abs(final_sol(2)) < 1.2539)) || it == Iteration)
            s = false;
        end
        it = it+1;
        totalIter = totalIter + 1;
    end
    
    %% plot & results
    %{
    x=1:it-1;
    figure,plot(x,best_so_far,'r',x,Average_fitness,'.-b');
    xlabel('Generation');
    ylabel('Fitness Function')
    legend('best-so-far','average fitness')
    %}
    disp(final_sol);
    if (it <Iteration + 1)
        total_succ = total_succ + 1;
    end
    disp(it);
    disp(func(final_sol(1),final_sol(2)));
end