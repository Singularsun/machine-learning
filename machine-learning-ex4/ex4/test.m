%% Machine Learning - Neural Network Learning

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 216;  % 216 Input
hidden_layer_size = 25;   % 25 hidden units
num_labels = 3;           % 3 labels, from 1 to 3

%% load train data;
X = load('/Users/sun/Downloads/lyy/train/train.csv');
y = load('/Users/sun/Downloads/lyy/train/label.csv');
% data = csvread('/Users/sun/Downloads/python/DigitRecognizer/input/train.csv',1, 0);
% X = data(:, 2:end);
% y = data(:, 1) + 1;
m = size(X, 1);

%% Initializing Pameters
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% Training NN
%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 500);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
    input_layer_size, ...
    hidden_layer_size, ...
    num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

%% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
    hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
    num_labels, (hidden_layer_size + 1));


%% Visualize Weights

fprintf('\nVisualizing Neural Network... \n')
displayData(Theta1(:, 2:end), 18);

%% Implement Predict
pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f%%\n', mean(double(pred == y)) * 100);
X_test = load('/Users/sun/Downloads/lyy/test/test.csv');
y_test = load('/Users/sun/Downloads/lyy/test/label.csv');
pred_test = predict(Theta1, Theta2, X_test);
fprintf('\nTest Set Accuracy: %f%%\n', mean(double(pred_test == y_test)) * 100);
[score, report] = classification_report(y_test, pred_test, num_labels);
report