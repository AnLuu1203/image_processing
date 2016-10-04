close all;
clear all;

im = imread('test.jpg');

[R C CH] = size(im);
LEFT = - round(C/2, 0);
RIGHT = LEFT + C - 1;
TOP = - round(R/2, 0);
BOTTOM = TOP + R - 1;
RADIUS = min(abs(LEFT), abs(TOP));

[x, y] = meshgrid(LEFT:RIGHT, TOP:BOTTOM);
z = x.*x + y.*y;

mask = z > RADIUS * RADIUS;