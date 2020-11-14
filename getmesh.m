clear all;
clc;

% nodes.txt and element.txt are copied from abaqus_stress.inp
node = importdata('./sq_crack0/nodes.txt');
element = importdata('./sq_crack0/elements.txt');

p = node(:, 2:4);
p = p';

t = element(:, 2:5);
t = t';

%% change mesh to from 1*1 to 100*100
% p(1, :) = 100 * p(1, :);
% p(2, :) = 100 * (p(2, :) + 0.2);
<<<<<<< HEAD
<<<<<<< HEAD
%% save mesh
save('./mesh/sq_mesh0d4.mat', 'p', 't');
=======
save('./mesh/sq_mesh0.mat', 'p', 't');
>>>>>>> parent of 01dabef... add sq_0d4
=======
save('./mesh/sq_mesh0.mat', 'p', 't');
>>>>>>> parent of 01dabef... add sq_0d4
