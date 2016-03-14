t = 0:0.1:24;
y = sin(t);
y(10) = y(10)+2;
randVal = rand(1);
plot(t, y), grid on;