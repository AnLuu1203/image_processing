close all;
clear;

im = imread('test.jpg');
im = rgb2gray(im);

x = 500;
y = 500;

min_theta = 0;
max_theta = pi;
L_theta = 500;
delta_theta = (max_theta - min_theta) / L_theta;

r_min = 1;
r_max = 300;
L_r = (r_max - r_min) + 1;

im_out = zeros(L_r, L_theta);

for r = r_min:r_max
    for theta_index = 1:L_theta
        theta = theta_index * delta_theta + min_theta;
        x_im = ceil(x + r*cos(theta));
        y_im = ceil(y + r*sin(theta));
        im_out(r, theta_index) = im(x_im, y_im);
    end
end

figure, imshow(im);
figure, imshow(uint8(im_out));