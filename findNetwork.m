function net = findNetwork(data)
K = size(data, 2);
nt = size(data, 1);
% initialize graph G = (V, A) with vertex for each of the K cells and no
% edges
net = zeros(K, K);

for i = 0:K-1
    % estimate coefficients 
    
    % use these coefficients to estimate standard error of full model
    
    for j = 0 : K-1
        % estimate coefficients for nested Model(12) not including
        % coefficients for cell j
        
        % use these coefficients to estimate standard error of nested model
        
        % calculate F-statistics
        
        % if F statistic > significance threshold then
            % insert directed edge e = (j, i) into E, i.e. cell j influence
            % cell i;
        % end
    end
end