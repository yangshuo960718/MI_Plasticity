clc, clear all

% check this in Abaqus!
lbda = 1.1538e9;
mu = 0.7692e9;
a = lbda + 2 * mu;

<<<<<<< HEAD
% load mesh
=======
% mesh
<<<<<<< HEAD
>>>>>>> parent of 01dabef... add sq_0d4
=======
>>>>>>> parent of 01dabef... add sq_0d4
load('./mesh/sq_mesh0.mat');
p = p';
t = t';
[S] = GetEleArea(p, t); % S is area

% load file
fileFolder = fullfile('./MatFile/'); % get full dir of input or output file
dirOutput = dir(fullfile(fileFolder, '*.mat'));
HomoStress = [];
nFrame = length(dirOutput);

% homogenization
for i = 1:nFrame
    EleStress = importdata([fileFolder, dirOutput(i).name]);
    EleStress = EleStress(1:end, 2:end);

    S11 = 0;
    S22 = 0;
    S33 = 0;
    S12 = 0;
    S13 = 0;
    S23 = 0;
    Mises = 0;

    for i = 1:size(EleStress, 1)
        Mises = Mises + EleStress(i, 1) * S(i);
        S11 = S11 + EleStress(i, 2) * S(i);
        S22 = S22 + EleStress(i, 3) * S(i);
        S33 = S33 + EleStress(i, 4) * S(i);
        S12 = S12 + EleStress(i, 5) * S(i);
        S13 = S13 + EleStress(i, 6) * S(i);
        S23 = S23 + EleStress(i, 7) * S(i);
    end

    mises = Mises / sum(S);
    s11 = S11 / sum(S);
    s22 = S22 / sum(S);
    s33 = S33 / sum(S);
    s12 = S12 / sum(S);
    s13 = S13 / sum(S);
    s23 = S23 / sum(S);
    frame_stress = [mises, s11, s22, s33, s12, s13, s23];
    HomoStress = [HomoStress; frame_stress];

end

%% plot stress-strain curve
% StepTime = [0:0.02:1];
% HomoStrain = StepTime * 0.004; % E = 200GPa = 2e11
Load1 = 0:0.05:1; % 20 frames
Unload1 = 1:-0.05:0; % 20 frames
Load2 = 0:-0.05:-1;
Unload2 = -1:0.05:0;
Load3 = 0:0.05:1;
MacroStrain = [Load1, Unload1, Load2, Unload2, Load3] * 0.004;
<<<<<<< HEAD
<<<<<<< HEAD
save('./Plot/trace-free/pp/0_stress_strain.mat', 'MacroStrain', 'HomoStress');
%%
%load('./Plot/trace-free/pp/0_stress_strain.mat', 'MacroStrain', 'HomoStress');
plot(MacroStrain, HomoStress(:, 2), '-o');
=======
%save('./Plot/expo_hardening/0_stress_strain.mat', 'MacroStrain', 'HomoStress');
plot(MacroStrain, HomoStress(:, 1), '-o');
>>>>>>> parent of 01dabef... add sq_0d4
=======
%save('./Plot/expo_hardening/0_stress_strain.mat', 'MacroStrain', 'HomoStress');
plot(MacroStrain, HomoStress(:, 1), '-o');
>>>>>>> parent of 01dabef... add sq_0d4
grid on;