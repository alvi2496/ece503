f = load('building256.mat');
f = f.building256;
A = f / 255;

% a
[U, S, V] = svd(A);

% b
A1 = sum(S(:,1)) * U(:,1) * V(:,1)';
A2 = A1 + sum(S(:,2)) * U(:,2) * V(:,2)';
A3 = A2 + sum(S(:,3)) * U(:,3) * V(:,3)';
A4 = A3 + sum(S(:,4)) * U(:,4) * V(:,4)';
A5 = A4 + sum(S(:,5)) * U(:,5) * V(:,5)';

% c
e1 = norm(A1-A, 'fro') / norm(A, 'fro');
e2 = norm(A2-A, 'fro') / norm(A, 'fro');
e3 = norm(A3-A, 'fro') / norm(A, 'fro');
e4 = norm(A4-A, 'fro') / norm(A, 'fro');
e5 = norm(A5-A, 'fro') / norm(A, 'fro');

% d
figure(1)
subplot(221)
imshow(A)
title('original building256')
subplot(222)
imshow(A1) 
title('rank-1 approximation')
subplot(223)
imshow(A3)
title('rank-3 approximation')
subplot(224)
imshow(A5)
title('rank-5 approximation')