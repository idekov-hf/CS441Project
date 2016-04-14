figure('Color', 'white');
% imagesc(FList);
imagesc( min( FList, 5 ));
xlabel('Cell Number');
ylabel('Cell Number');
% title('Cell-To-Cell Connections');
title('Cell Connections For Wash Data');
set(gca, 'Fontsize', 20);