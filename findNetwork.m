function net = findNetwork(data)
K = size(data, 2);
nt = size(data, 1);
net = zeros(K, K);

for i = 0:K-1
    for 