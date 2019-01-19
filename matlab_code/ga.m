%% Initial Settings And Strings
format long 

%% initial Genetic Algorithm Parameters
m=2;
Pc = 0.8;
Pm = 0.04;
scale = 0.1;
N=150;
Lo = [-10 -10];
Hi = [10 10];

%% Vectors best fitness and average fitness for every iteration of genetic algorithm 
best_so_far = [];
Average_fitness = [];
it = 1;
s = true;

%% Creating Firtst Generation of Population
[Population] = first_gen(N,m,Lo,Hi);

%% Genetic Algorithm Body
while (s) 
    [selection_probability,fit,ave_fit,max_fit,opt_sol]=fit_eval(Population,N);
    Average_fitness(it) = ave_fit;
    
    %% Creating next generation 
    [mating_pool]=g_roulette_wheel(Population,N,m,selection_probability);
    [new_pop]=g_crossover(mating_pool,Pc,N,m,Hi,Lo);
    [Population]=g_mutation(new_pop,Pm,N,m,scale,Hi,Lo);
    %% Compare value fitness of current iteration with last one
    if it == 1
        best_so_far(it) = max_fit;
        final_sol = opt_sol;
    elseif max_fit>best_so_far(it-1)
        best_so_far(it) = max_fit;
        final_sol = opt_sol;
    else 
        best_so_far(it)=best_so_far(it-1);
    end
    %% Ending condition 
    if (it == 1000)
        s=false;
    end
    it = it +1;
end

%% Show results and plot
disp('');
result = [final_sol,func(final_sol(1),final_sol(2))]

%% Draw polt for genetic algorithm performance
x=1:it-1;
figure,plot(x,best_so_far,'r',x,Average_fitness,'.-b');
xlabel('Generation');
ylabel('Fitness Function')
legend('best-so-far','average fitness')
