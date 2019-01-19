function[scores]=func(X,Y)
numeratorcomp = (cos(sin(abs(X .^ 2 - Y .^ 2))) .^ 2) - 0.5; 
denominatorcomp = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
scores = 0.5 + numeratorcomp ./ denominatorcomp;
return;