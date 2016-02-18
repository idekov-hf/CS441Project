function net = findNetwork(data)
k = size(data, 2);
nt = size(data, 1);
net = zeros(k, k);
