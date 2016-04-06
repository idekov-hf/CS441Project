f = load( 'Jan_data.mat' );
d = f.base_data;
load( 'AFGC_base_data.mat' );
% Find list of indices of strong influencers. These are the cells that
% have high values of F.. We look at columns because the column
% index indicates the index of the cells that do the influencing.
idx = find( mean(FList,1) > 1.1 );
% There are 52 influencers, but it is easy to show 49 in a square,
% so lets ignore the final 3.
for i = 1 : 49, influencerIdx = idx(i); 
    [~, influencedIdx] = max( FList(:,influencerIdx) ); 
    subplot( 7, 7, i ); 
    plot( 1:90, d(:, [influencerIdx,influencedIdx] ) ); 
end; 
