function[z]=func(X,Y)
up = (cos(sin(abs(X .^ 2 - Y .^ 2))) .^ 2) - 0.5; 
down = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
z = 0.5 + up ./ down;
return;