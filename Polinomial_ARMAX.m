% Generate some sample data for demonstration purposes
% Replace this with your actual input-output data
t = out.Time;
u = out.InputSignal;
y = out.SystemResponse;

% Prepare the data in iddata format
data = iddata(y, u, 0.01); % The third argument is the sample time

% Define the orders of the ARMAX model
na = 2; % Order of the autoregressive part
nb = 2; % Order of the exogenous input part (number of B coefficients)
nc = 1; % Order of the moving average part
nk = 1; % Input-output delay

% Estimate the ARMAX model
sys = armax(data, [na nb nc nk]);

% Display the estimated model
disp('Estimated ARMAX model:');
sys

% Predict the output using the identified model
y_pred = predict(sys, data);

% Extract the predicted output to the workspace
y_predicted = y_pred.OutputData;

% Prepare data for export to Excel
T = table(out.Time, out.InputSignal, out.SystemResponse, y_predicted, 'VariableNames', {'Time', 'InputSignal', 'SystemResponse', 'ARMAX_Predicted'});

% Export data to Excel file
filename = 'simulation_and_prediction_data.xlsx';
writetable(T, filename);

sprintf('Data exported!')