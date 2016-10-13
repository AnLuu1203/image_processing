v = rand([9000000, 1]);
h = hist(v, 100);
plot(h);

vn = randn([9000000,1]);

hn = hist(vn,100);        
figure, plot(hn);