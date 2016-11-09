close all;
clear;

ideal_low_pass_filter(10);
ideal_high_pass_filter(10);
band_reject_filter(10, 8);