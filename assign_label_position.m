% % % @Author: lingyu
% % % @Date:   2019-06-14 12:32:44
% % % @Last Modified by:   lingyu
% % % @Last Modified time: 2019-09-12 11:44:10
subdirname = 'D';
filename = 'filename';
v = VideoReader(strcat('G:\video_dir\',subdirname,'\videos\', filename, '.avi'));
fileID = fopen(strcat('G:\video_dir\',subdirname,'\gd_dir\',filename,'.txt'),'wt');
Obj = VideoReader(strcat('G:\video_dir\',subdirname,'\videos\',filename,'.avi'));
lastFrame = read(Obj, inf);
imshow(lastFrame);
numFrames = Obj.NumberOfFrames;
numFrames
frame = 0;
while frame<=numFrames
    frame
    if frame >0
        video = read(v,frame);
        imshow(video);
        positionA_1 = 0;
        positionA_2 = 0;
        positionA = 0;
        positionA = menu('Choose positionA','No','positionA','Cancel')-1;
        if positionA == 2
            fprintf('Cancel, deleting the last 5 frames.');
            fprintf('Frames written %d\n', frame-5);
            frame = frame - 5;
            fprintf('Frames after deleting %d\n', frame-5);
            fclose(fileID);
            M = dlmread(strcat('G:\video_dir\',subdirname,'\gd_dir\',filename,'.txt'));
            M2 = M(1:frame-5,:);
            dlmwrite(strcat('G:\video_dir\',subdirname,'\gd_dir\',filename,'.txt'),M2);
            fileID = fopen(strcat('G:\video_dir\',subdirname,'\gd_dir\',filename,'.txt'),'a+');
            video = read(v,frame);
            imshow(video);
            frame
            positionA = menu('Choose positionA','No','positionA','Cancel')-1;
        end
        
        if positionA == 1
            positionA_1 = menu('Choose positionA_1','No','positionA_1')-1;
            positionA_2 = menu('Choose positionA_2','No','positionA_2')-1;
        end
            for i=1:1:5 
                fprintf(fileID, '%d,%d,%d\n',positionA,positionA_2, positionA_1);
            end
        
    end
    frame = frame + 5;
end
fclose(fileID);