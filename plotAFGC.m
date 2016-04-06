figure;
% imagesc(FList);
imagesc( min( FList, 5 ));
xlabel('Cell Number');
ylabel('Cell Number');
title('Cell-To-Cell Connections');
set(gca, 'Fontsize', 20);