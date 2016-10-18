clear;
close all;

h_prewitt_x = [-1 0 1;
               -1 0 1;
               -1 0 1];
           
h_sobel = [-1 0 1;
           -2 0 2;
           -1 0 1];

h_robert = [-1 0;
            0 -1];

H_prewitt = abs(fft2(h_prewitt_x));
H_sobel = abs(fft2(h_sobel));
H_robert = abs(fft2(h_robert));

figure, surf(H_prewitt), title('Prewitt');
figure, surf(H_sobel), title('Sobel');
figure, surf(H_robert), title('Robert');