clear all;
clc;

% nodes.txt and element.txt are copied from abaqus_stress.inp
fileDir = './sq_crack0/';
meshDir = './mesh/';
node = importdata([fileDir, 'node.txt']);
element = importdata([fileDir, 'ele.txt']);

p = node(:, 2:4);
p = p';

t = element(:, 2:5);
t = t';

%% change mesh to from 1*1 to 100*100
% p(1, :) = 100 * p(1, :);
% p(2, :) = 100 * (p(2, :) + 0.2);

%% save mesh
save([meshDir, './sq_mesh0.mat'], 'p', 't');
