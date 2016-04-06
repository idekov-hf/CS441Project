%% Cell 1 This is code that will go in the outer loop. I don't have the outer loop.

% load in all the data (includes, base, TTX and wash data)
f = load( 'Jan_data.mat' );
% data = f.base_data;
% data = f.TTX_data;
data = f.wash_data;

% Set up data on which to do the testing.

NT = size(data,1); % number of time steps
NCELL = size(data,2); % number of cells aka time series
Ii = 1; % cell of interest (% in line b of the algorithm, it loops over all values of i. I am just doing this for one).
time = 1:NT; % set up time
FList = zeros(NCELL, NCELL);

% We will look back up to 4 time steps
P = 4;

% Solve the full model for cell i. (eq 11 in paper)
for Ii = 1 : NCELL,
    
    % Begin code for row c of the algorithm
    Y = data(P+1:end,Ii)';
    Z = ones(1,NT-P);
    for i = 1 : P,
        Z = [Z; data(P-i+1:end-i,:)'];
    end;
    % Solve Z'*BT = Y' for BT.
    BT = Z'\Y'; % This does the least squares solving (BT means B transpose). B contains the alphas.
    % End code for row c of the algorithm
    % Begin code for row d of the algorithm
    resid1 = Z'*BT-Y';
    sigma_squared1 = resid1'*resid1/(size(Z',1)-(size(Z',2)-1)-1);
    % End code for row d of the algorithm

    % Row e is the loop control line. Here it is.
    for Jj = 1 : NCELL,
        % Begin row f of the algorithm
        % Solve the partial model to test i's dependence on j. (eq 12 in paper)
        % So we compute it without the j'th cell considered in Z.
        Y = data(P+1:end,Ii)';
        Z = ones(1,NT-P);
        cell_idxs = setdiff(1:NCELL,Jj);
        for i = 1 : P,
            Z = [Z; data(P-i+1:end-i,cell_idxs)'];
        end;
        BT = Z'\Y';
        % End row f of the algorithm
        % Begin row g of the algorithm
        resid0 = Z'*BT-Y';
        sigma_squared0 = resid0'*resid0/(size(Z',1)-(size(Z',2)-1)-1);
        % End row g of the algorithm

        % In row h of the algorithm, it mentions the F-statistic. This is where
        % things get a little confusing. The definition they describe of the
        % F-statistic is basically sigma_squared0/sigma_squared1, but I don't
        % see that definition in any stats book.
        % We could do this: F = sigma_squared0/sigma_squared1.
        % If F is big (you need to decide what "big" is -- maybe bigger than 2?), 
        % then we say there is a connection from cell Ii to cell Jj.
        % Right now, I am just printing out both sigma_squared values.
        % The threshold should be larger than 1. Maybe 1.5?
        F = sigma_squared0/sigma_squared1;
%         disp( ['sigma squared for full is ',num2str(sigma_squared1),' and partial when JJ=',num2str(Jj),' is ',num2str(sigma_squared0), ', F= ',num2str(F)]);
        FList(Ii, Jj) = F;
    end;
end;
% disp(FList);
% hist(FList);

save('AFGC_wash_data.mat','FList');

% figure;
% imagesc(FList);
% imagesc( min( FList, 5 ));
% xlabel('Cell Number');
% ylabel('Cell Number');
% title('Cell-To-Cell Connections');
% set(gca, 'Fontsize', 20);
