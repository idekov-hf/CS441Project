f = load( 'Jan_data.mat' );

% To show the locations of the cells
x_pos = f.cell_positions(:,1);
y_pos = f.cell_positions(:,2);
figure;
scatter( x_pos, y_pos );

% To plot the time-series for the 649 cells.
% These are the data from an SCN before treatment with a toxin.
% The sampling rate is once per hour.
figure;
plot( 1:size(f.base_data,1), f.base_data );
xlabel( 'Time (h)' );
ylabel( 'Bioluminescence (counts)' );
title( 'Before any treatment' );

% To plot the time-series for the 649 cells.
% These are the data from an SCN during treatment with a toxin.
% The sampling rate is once per hour.
figure;
plot( 1:size(f.TTX_data,1), f.TTX_data );
xlabel( 'Time (h)' );
ylabel( 'Bioluminescence (counts)' );
title( 'During TTX treatment' );

% To plot the time-series for the 649 cells.
% These are the data from an SCN after the toxin has been washed out.
% The sampling rate is once per hour.
figure;
plot( 1:size(f.wash_data,1), f.wash_data );
xlabel( 'Time (h)' );
ylabel( 'Bioluminescence (counts)' );
title( 'After the Wash' );
