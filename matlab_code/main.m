%% 
% Seyed AmirHossein Adhami MirHosseini
% adhamiamirhossein@gmail.com
% https://github.com/Amir-H-ReVoL
% the exact value of function in minimum point: 0.292578632045530
%%

clc;
clear all;
close all;
totalIter = 0;
total_succ = 0;
runs = 100;
ga();
disp("mean of total Iterations->");
disp(totalIter/runs);
disp("successful runs->");
disp(total_succ);
plots();