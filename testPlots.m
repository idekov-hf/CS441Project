NT = 201; % 201 time steps
NCELL = 30; % 30 time series (i.e. biuluminescence data for 30 cells)
Ii = 1; % cell of interest (% in line b of the algorithm, it loops over all values of i. I am just doing this for one).
Jjtarget = 3; % cell to see if it affects cell Ii. (This is constructed so that we can detect a dependence)
time = linspace(0, 200, NT); % set up time
data = zeros(NT,NCELL); % initialize the data matrix
for i = 1 : NCELL,
    % Each time series is a sine curve with a slightly different period
    % near 24 h.
    data(:,i) = sin( time ./ (24+i*0.1)*(2*pi) )';
end;
% Each time series has noise in the signal
data = data + randn( size(data) );
% Cell 1's timeseries is really just a shifted version of the timeseries
% from Cell 3. So we expect Cell 3 to look connected to Cell 1.
data(3:end,Ii) = data(1:end-2,Jjtarget);
data(3:end,Ii) = data(3:end,Ii) + randn(size(data(3:end,Ii)))*0.5;

figure;
plot(data(:,Ii));
hold;
plot(data(:,Jjtarget));
legend('Cell 1', 'Cell 3');
title('Time Series Data for Cell 1 and 3');

% plot(data);
% title('Time Series Data For 30 Cells');

ylabel('y');
xlabel('Time Steps');
set(gca,'fontsize', 20);