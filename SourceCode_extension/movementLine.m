
function [] = movementLine(videoName)

video = VideoReader('2014-10-10 17.38.38.mp4'); 
size = video.NumberOfFrames;

%  for i = 1:size
%      frame1 = read(video,i);  % read a single frame
%      f = imresize(frame1,[640,400]); %resize the frame
%      g = rgb2gray(f);     % lets make it the rgb grayscale now
%      imwrite(g,['motionCapture/frame' int2str(i) 'g.png']); % write the new grayscale image
%  end
% 
% directory1 = dir('motionCapture');
% previousName = ' ';
% direcSize = length(directory1);
% first = 1;
% nameA = 'motionCapture/frame1g.png';
% imageA = imread(nameA);
% 
% for j = 2:size
%     nameB = ['motionCapture/frame' int2str(j) 'g.png'];
%     imageB = imread(nameB);
%     
%     toGreenies(nameB,nameA);
%     nameA = nameB;
% end

writerObj = VideoWriter('motionCapture/Green_Lines');
open(writerObj);

for k = 2:size
        filename2 = ['motionCapture/Motion/frame' int2str(k) 'g_lines.png'];
        image = imread(filename2);
        writeVideo(writerObj,im2frame(image));
end
close(writerObj);
end

