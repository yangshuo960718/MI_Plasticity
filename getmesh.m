clear all;
clc;

% nodes.txt and element.txt are copied from abaqus_stress.inp
FileDir = './sq_crack0/';
MeshDir = './mesh/';
node = importdata([FileDir, 'node.txt']);
element = importdata([FileDir, 'ele.txt']);

p = node(:, 2:4);
p = p';

t = element(:, 2:5);
t = t';

%% change mesh to from 1*1 to 100*100
% p(1, :) = 100 * p(1, :);
% p(2, :) = 100 * (p(2, :) + 0.2);

%% save mesh
save([MeshDir, './sq_mesh0.mat'], 'p', 't');
