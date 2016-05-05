load('AFGC_base_data.mat')

figure('Color', 'white');
% imagesc(FList);
imagesc( min( FList, 5 ));
xlabel('Influencer Cells');
ylabel('Influenced Cells');
% title('Cell-To-Cell Connections');
title('Cell Connections For Base Data');
set(gca, 'Fontsize', 30);