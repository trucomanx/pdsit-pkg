%  If we analyze the sample vectors X_1, X_2 and X_3 of signals x_1, x_2 and x_3 
%  respectively. Then, the experimental joint probability P, between them,
%  can be calculated as.

X_1=[ 1  2  3  4  5  6  7  8  8  7  6  5  4  3  2  1];
X_2=[ 2  3  4  2  3  4  2  3  4  2  3  4  2  3  4  2];
X_3=[-1 -1  1  1 -1 -1  1  1  1  1 -1 -1  1  1 -1 -1];

X = [ X_1; X_2; X_3]
[P CONF]= exp_joint_prob(X)

%  Thus, the sparse matrix P represent a 3D matrix. So that the probability of 
%  Pr(x_1=a,x_2=b,x_3=c) is equal to prob:

VEC=[7 2 1]
[prob idl]=scv2prob(P,CONF,VEC);
prob
disp(sprintf('With linear index %d',idl));

% [ 1 2 -1 ] -> 2/16
% [ 2 3 -1 ] -> 1/16
% [ 3 4  1 ] -> 1/16
% [ 4 2  1 ] -> 2/16
% [ 5 3 -1 ] -> 1/16
% [ 6 4 -1 ] -> 1/16
% [ 7 2  1 ] -> 2/16
% [ 8 3  1 ] -> 1/16
% [ 8 4  1 ] -> 1/16
% [ 6 3 -1 ] -> 1/16
% [ 5 4 -1 ] -> 1/16
% [ 3 3  1 ] -> 1/16
% [ 2 4 -1 ] -> 1/16
