% % a = [1 3 5 7];
% % b = [2 4 6 8;1 3 5 7;1 2 3 4];
% % c = [2 4 6 8];
% close all;
% im = imread('a.jpg');
% % imshow(im);
% imR = im;
% imR(:,:,2) = 0;imR(:,:,3) = 0;
% % figure, imshow(imR);
% % title('RED');
% 
% imG = im;
% imG(:,:,1) = 0;imG(:,:,3) = 0;
% % figure, imshow(imG);
% % title('GREEN');
% 
% imB = im;
% imB(:,:,1) = 0;imB(:,:,2) = 0;
% % figure, imshow(imB);
% % title('BLUE');
% 
% imGray = rgb2gray(im);
% % figure, imshow(imGray);
% % title('GRAY');
% 
% face = im(1:145,150:280,:);

% a = [1 2 3 4 5; 5 6 7 8 9; 9 10 11 12 13];
% mask = true(size(a));
% 
% b=a(mask);

% true
% meshgrid
% find

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % Half image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear all;
% clc;
% 
% im = imread('a.jpg');
% sizes = size(im);
% imH = im;
% imH(:,(sizes(2)/2):sizes(2),1) = 0;
% imH(:,(sizes(2)/2):sizes(2),3) = 0;
% imshow(imH);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % Circle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

im = imread('test.jpg');
size = size(im);

half1 = size(1)/2;
half2 = size(2)/2;
half = min(half1, half2);

[X Y] = meshgrid(1:size(2), 1:size(1));
mask = half^2 - (X - half2).^2 - (Y - half1).^2;
mask = uint8(mask > 0);

newIm = im;

newIm(:,:,1) = newIm(:,:,1).*mask;
newIm(:,:,2) = newIm(:,:,2).*mask;
newIm(:,:,3) = newIm(:,:,3).*mask;

imshow(newIm);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


