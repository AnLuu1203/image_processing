clear;
close all;

%(120 100)
%(450 100)
%(120 600)
%(450 600)

f1 = [
    120 100;
    450 100;
    120 600;
    450 700
    ];

f2 = [
    1 1;
    1000 1;
    1 700;
    1000 700
    ];


A = [
    f2(1,1) f2(1,2) 1 0 0 0 -f2(1,1)*f1(1,1) -f2(1,2)*f1(1,1);
    0 0 0 f2(1,1) f2(1,2) 1 -f2(1,1)*f1(1,2) -f2(1,2)*f1(1,2);
    f2(2,1) f2(2,2) 1 0 0 0 -f2(2,1)*f1(2,1) -f2(2,2)*f1(2,1);
    0 0 0 f2(2,1) f2(2,2) 1 -f2(2,1)*f1(2,2) -f2(2,2)*f1(2,2);
    f2(3,1) f2(3,2) 1 0 0 0 -f2(3,1)*f1(3,1) -f2(3,2)*f1(3,1);
    0 0 0 f2(3,1) f2(3,2) 1 -f2(3,1)*f1(3,2) -f2(3,2)*f1(3,2);
    f2(4,1) f2(4,2) 1 0 0 0 -f2(4,1)*f1(4,1) -f2(4,2)*f1(4,1);
    0 0 0 f2(4,1) f2(4,2) 1 -f2(4,1)*f1(4,2) -f2(4,2)*f1(4,2)
    ];

b = [
    f1(1,1);
    f1(1,2);
    f1(2,1);
    f1(2,2);
    f1(3,1);
    f1(3,2);
    f1(4,1);
    f1(4,2)
   ];

h = A\b;
M = ones(3,3);

for i = 1:8
    x = floor((i-1) / 3) + 1;
    y = mod(i -1, 3) + 1;
    M(x,y) = h(i);
end
