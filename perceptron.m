
% Goldsmiths University of London
% Author....: Carlos Manuel de Oliveira Alves
% Student...: cdeol003
% Created...: 02/02/2023


% This code implements a Perceptron algorithm for binary classification. 
% The Perceptron is trained on a randomly generated training set of two-dimensional points and their class labels. 
% The training set is first plotted and then the Perceptron algorithm is used to adjust the weights of the 
% Perceptron until the output of the Perceptron matches the desired output.

% The Perceptron algorithm updates the weights by computing the output of the Perceptron, comparing it to the desired output, 
% and adjusting the weights if the output is not correct. The process repeats until the output of the Perceptron matches the 
% desired output or a maximum number of iterations is reached. The decision boundary of the Perceptron is plotted after each 
% iteration so that the evolution of the decision boundary can be observed.

% The code uses several helper functions, such as PlotPats and PlotBoundary, that are not included in this code snippet. 
% These functions are used to plot the training set and the decision boundary of the Perceptron, respectively.

% perceptron - Perceptron demo with random training set.

% Calculate the number of training examples in the training set.
NPATS = 10 + floor(rand(1)*30); % The number of training examples is randomly generated between 10 and 39.


