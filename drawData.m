figure;
% imagesc(FList);
imagesc( min( FList, 5 ));
xlabel('Cell Number');
ylabel('Cell Number');
% title('Cell-To-Cell Connections');
title('Cell Connections For TTX Data');
set(gca, 'Fontsize', 20);