% % % @Author: lingyu
% % % @Date:   2019-06-14 12:32:44
% % % @Last Modified by:   lingyu
% % % @Last Modified time: 2019-09-12 11:44:10

D = 'G:\train\';
fileID = fopen('G:\train_labels.txt','wt');
% % % Note by lingyu: use 'wt' instead of 'w', 
% % % otherwise when opening the file with notepad, 
% % % there is not return to the line... everything is written on one line.
% D = 'G:\test\';
% fileID = fopen('G:\test_labels.txt','wt');
S = dir(fullfile(D,'*.png')); % pattern to match filenames.
% for k = 1:numel(S)
for k = 1:10
    F = fullfile(D,S(k).name);
    I = imread(F);
    imshow(I)
    choice = menu('Choose a label','Open','Close','Point','Others');
    label = choice -1;
    fprintf(fileID, '%d\n',label);
end
fclose(fileID);