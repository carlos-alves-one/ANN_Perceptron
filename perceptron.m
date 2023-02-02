
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

% Generate the 2-dimensional training examples.
Patterns = rand(2,NPATS)*2-1; % The values of the training examples are randomly generated between -1 and 1.

% Determine the target function of the training set.
slope = log(rand(1)*10); % The slope of the target function is randomly generated between 0 and 10.

yint = rand(1)*2-1; % The y-intercept of the target function is randomly generated between -1 and 1.

% Determine the desired output of the Perceptron.
Desired = Patterns(2,:) - Patterns(1,:)*slope - yint > 0; % The desired output is set to 1 if the point is above the target function and 0 otherwise.

% Plot the training set.
PlotPats(Patterns,Desired) % The PlotPats function plots the training set with colored markers to indicate the class of each example.

% Store the inputs to the Perceptron.
Inputs = [ones(1,NPATS); Patterns]; % The Inputs matrix stores the inputs to the Perceptron. It includes a row of ones to account for the bias term.

% Initialize the weights of the Perceptron.
Weights = [0 0 0]; % The Weights vector stores the weights of the Perceptron and is initialized to [0 0 0].

% Train the Perceptron.
for i = 1:50 % The loop runs 50 times or until convergence, whichever comes first.

    % Compute the output of the Perceptron.
    Result = (Weights * Inputs) > 0; % The Perceptron computes the output by multiplying the weights with the inputs and thresholding the result.

    % Check for convergence.
    if Result == Desired, break, end % If the output matches the desired output, the loop terminates.