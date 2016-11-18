clc;
clear;
close all;
im = imread('test.jpg');
%65:352  306:526
R = round(sqrt(size(im,1)^2+ size(im,2)^2));
newImage = uint8(zeros(R,R, 3));
x = round((R-size(im,1))/2);
y = round((R-size(im,2))/2);
for i = 1:size(im,1)
    for j = 1:size(im,2)
        newImage(i+x, j+y, 1) = im(i,j, 1);
        newImage(i+x, j+y, 2) = im(i,j, 2);
        newImage(i+x, j+y, 3) = im(i,j, 3);
    end;
end;
figure, imshow(im), title ('origin');
figure, imshow(newImage), title ('new image');
theta = pi/4;

img = rgb2gray(im);
P = [1 0 -R/2
0 1 -R/2 
0 0 1];
P2 = [cos(theta) -sin(theta) 0
sin(theta) cos(theta) 0 
0 0 1];
P3 = [1 0 R/2
0 1 R/2 
0 0 1];
P4 = P3*P2*P;
outputImage = uint8(zeros(R,R,3));
for i = 1:R
    for j = 1:R
        a = P4* [i j 1]';
        x = round(a(1)/a(3));
        y = round(a(2)/a(3));
        if (x>0 && x<=R &&y>0 && y<=R )
            outputImage(i,j,1) = newImage (x,y,1);
            outputImage(i,j,2) = newImage (x,y,2);
            outputImage(i,j,3) = newImage (x,y,3);
        end;
    end
end

figure, imshow(outputImage), title ('rotation')