function scores = inversed_function(input)
X = input(:, 1);
Y = input(:, 2);
scores = 1./(cos(sin(abs(X.^2 - Y.^2))).^2 - 1./(2*(X.^2/1000 + Y.^2/1000 + 1).^2) + 1./2);
return;