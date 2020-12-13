clc, clear

%
% d4 = 0.0263;
% d8 = 0.2064;
% g_d4 = (1 - d4)^2;
% g_d8 = (1 - d8)^2;

% load abaqus data
fileDir = './Plot/multi-load/shear12/';

sq_0 = load([fileDir, '0_stress_strain.mat']);
e_0 = sq_0.MacroStrain'; % nominal strain
s_0 = sq_0.HomoStress; % nominal stress
e_0t = log(1 + e_0); % ture strain
s_0t_22 = s_0(:, 3) .* (1 + e_0); % ture stress s22

sq_0d4 = load([fileDir, '0d4_stress_strain.mat']);
e_4 = sq_0d4.MacroStrain';
s_4 = sq_0d4.HomoStress;
e_4t = log(1 + e_4);
s_4t_22 = s_4(:, 3) .* (1 + e_4);

sq_0d8 = load([fileDir, '0d8_stress_strain.mat']);
e_8 = sq_0d8.MacroStrain';
s_8 = sq_0d8.HomoStress;
e_8t = log(1 + e_8);
s_8t_22 = s_8(:, 3) .* (1 + e_8);

% sq_u = load('./Plot/load_unload/0_stress_strain_11.mat'); % uniaxial tension in 1
% e_u = sq_u.MacroStrain';
% s_u = sq_u.HomoStress;
% e_ut = log(1 + e_u);
% s_ut_22 = s_u(:, 3) .* (1 + e_u);

%% compute and plot Homogenized Von Misess stress
vm_0 = von_mises(s_0);
vm_4 = von_mises(s_4);
vm_8 = von_mises(s_8);
% vm_u = von_mises(s_u);

% plot(e_0, s_0(:, 3), 'r',e_u, s_u(:,2), 'g', e_4, s_4(:, 3), 'b', e_8, s_8(:, 3)); % 1: mises, 2-7: s11-s23
% plot(e_0t, s_0t_22, 'r', e_4t, s_4t_22, 'b', e_8t, s_8t_22);
vm_plot = figure(1);
[sign_0, sign_4, sign_8] = deal(ones(size(e_0)));
sign_0(29:71) = -1;
sign_4(29:71) = -1;
sign_8(29:71) = -1;% sign is manually set
plot(e_0, vm_0 .* sign_0, 'r', e_4, vm_4 .* sign_4, 'b', e_8, vm_8 .* sign_8); % von misess of homogenized stress
grid on;
title('Multi-loading - shear1212 - Von Mises');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{12}');
ylabel('\pm Von Mises [Pa]');

%% plot s11 - e22
s11e22_plot = figure(2);
plot(e_0, s_0(:, 1), 'r', e_4, s_4(:, 1), 'b', e_8, s_8(:, 1));
grid on;
title('Multi-loading, shear1212, \sigma_{11} - \epsilon_{12}');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{22}');
ylabel('Stress \sigma_{11} [Pa]');

%% plot s22 - e22
s22e22_plot = figure(3);
plot(e_0, s_0(:, 2), 'r', e_4, s_4(:, 2), 'b', e_8, s_8(:, 2));
grid on;
title('Multi-loading, shear1212, \sigma_{22} - \epsilon_{12}');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{22}');
ylabel('Stress \sigma_{22} [Pa]');

%% plot s33 - e22
s33e22_plot = figure(4);
plot(e_0, s_0(:, 3), 'r', e_4, s_4(:, 3), 'b', e_8, s_8(:, 3));
grid on;
title('Multi-loading, shear1212, \sigma_{33} - \epsilon_{12}');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{22}');
ylabel('Stress \sigma_{33} [Pa]');

%% plot s12 - e22
s12e22_plot = figure(5);
plot(e_0, s_0(:, 4), 'r', e_4, s_4(:, 4), 'b', e_8, s_8(:, 4));
grid on;
title('Multi-loading, shear1212, \sigma_{12} - \epsilon_{12}');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{22}');
ylabel('Stress \sigma_{12} [Pa]');

%% plot s13 - e22
s13e22_plot = figure(6);
plot(e_0, s_0(:, 5), 'r', e_4, s_4(:, 5), 'b', e_8, s_8(:, 5));
grid on;
title('Multi-loading, shear1212, \sigma_{13} - \epsilon_{12}');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{22}');
ylabel('Stress \sigma_{13} [Pa]');

%% plot s23 - e22
s23e22_plot = figure(7);
plot(e_0, s_0(:, 6), 'r', e_4, s_4(:, 6), 'b', e_8, s_8(:, 6));
grid on;
title('Multi-loading, shear1212, \sigma_{23} - \epsilon_{12}');
legend('d=0', 'd=0.0263', 'd=0.2064', 'Location', 'best');
xlabel('Strain \epsilon_{22}');
ylabel('Stress \sigma_{23} [Pa]');

%% save plot
savefig(vm_plot, [fileDir, 'vm.fig']);
savefig(s11e22_plot, [fileDir, 's11e12.fig']);
savefig(s22e22_plot, [fileDir, 's22e12.fig']);
savefig(s33e22_plot, [fileDir, 's33e12.fig']);
savefig(s12e22_plot, [fileDir, 's12e12.fig']);
savefig(s13e22_plot, [fileDir, 's13e12.fig']);
savefig(s23e22_plot, [fileDir, 's23e12.fig']);

%% save plot .svg
saveas(vm_plot, [fileDir, 'vm.svg']);
saveas(s11e22_plot, [fileDir, 's11e12.svg']);
saveas(s22e22_plot, [fileDir, 's22e12.svg']);
saveas(s33e22_plot, [fileDir, 's33e12.svg']);
saveas(s12e22_plot, [fileDir, 's12e12.svg']);
saveas(s13e22_plot, [fileDir, 's13e12.svg']);
saveas(s23e22_plot, [fileDir, 's23e12.svg']);

%%
% compute von mises
function [vm] = von_mises(s)
    % compute von mises stress from stress component
    % s = [s11, s22, s33, s12, s13, s23]
    [s11, s22, s33, s12, s13, s23] = deal(s(:, 1), s(:, 2), s(:, 3), ...
        s(:, 4), s(:, 5), s(:, 6));
    vm = 1 / sqrt(2) * sqrt((s11 - s22).^2 + (s22 - s33).^2 + ...
        (s33 - s11).^2 + 6 * (s12.^2 + s23.^2 + s13.^2));
end
