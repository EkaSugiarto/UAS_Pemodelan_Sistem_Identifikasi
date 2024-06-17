% Prepare data for export to Excel
T = table(out.Time, out.InputSignal, out.SystemResponse, 'VariableNames', {'Time', 'InputSignal', 'SystemResponse'});

% Export data to Excel file
filename = 'simulation_data.xlsx';
writetable(T, filename);

sprintf('Simulation data exported!')