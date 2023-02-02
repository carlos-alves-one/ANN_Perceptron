
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

    % Update the weights of the Perceptron.
    Weights = Weights + (Desired-Result) * Inputs'; % If the output does not match the desired output, the weights are updated using the update rule.

    % Output the iteration number and the current weights.
    fprintf('%2d. Weights = ',i);
    disp(Weights); % The fprintf statement outputs the iteration number and the current weights to the console.

    % Plot the decision boundary of the Perceptron.
    PlotBoundary(Weights,i,0) % The PlotBoundary function plots the decision boundary of the Perceptron in the 2-dimensional input space.
    pause(1) % The pause function adds a delay of 1 second to allow for visual inspection of the decision boundary after each iteration.

end

% Plot the final decision boundary of the Perceptron.
PlotBoundary(Weights,i,1) % The PlotBoundary function is called one more time to plot the final decision boundary of the Perceptron.

% Plot the target function.
x = [-1 1]; % The x vector stores the x-coordinates of the points that define the target function.
y = slope*x + yint; % The y vector stores the y-coordinates of the points that define the target function.
plot(x,y,'k') % The plot function plots the target function in black.

% Output the final weights.
fprintf('Final Weights = ');
disp(Weights); % The fprintf statement outputs the final weights to the console.

% Plot the training set.
function PlotPats(Patterns,Desired)
    % Plot the training set.
    plot(Patterns(1,Desired==1),Patterns(2,Desired==1),'ro') % The plot function plots the training examples with class label 1 in red.
    hold on % The hold on function holds the current plot so that the next plot is added to it.
    plot(Patterns(1,Desired==0),Patterns(2,Desired==0),'bo') % The plot function plots the training examples with class label 0 in blue.
    axis([-1 1 -1 1]) % The axis function sets the axis limits of the plot.
    grid on % The grid on function adds a grid to the plot.
    xlabel('x_1') % The xlabel function adds a label to the x-axis.
    ylabel('x_2') % The ylabel function adds a label to the y-axis.
    title('Training Set') % The title function adds a title to the plot.
    hold off % The hold off function releases the current plot so that it can be modified.
end
