function [S] = GetEleArea(p, t)
    %load mesh.mat

    S = zeros(1, size(t, 1));

    if size(p, 2) == 2

        for i = 1:size(t, 1)
            x = zeros(1, size(t, 2));
            y = zeros(1, size(t, 2));

            for j = 1:size(t, 2)
                x(j) = p(t(i, j), 1);
                y(j) = p(t(i, j), 2);
            end

            a = sqrt((x(1) - x(2))^2 + (y(1) - y(2))^2);
            b = sqrt((x(2) - x(3))^2 + (y(2) - y(3))^2);
            c = sqrt((x(1) - x(3))^2 + (y(1) - y(3))^2);
            P = (a + b + c) / 2;
            S(i) = sqrt(P * (P - a) * (P - b) * (P - c)); % Hallen - Qin Jiushao formula
        end

    elseif size(p, 2) == 3

        for i = 1:size(t, 1)
            x = zeros(1, size(t, 2));
            y = zeros(1, size(t, 2));
            z = zeros(1, size(t, 2));

            for j = 1:size(t, 2)
                x(j) = p(t(i, j), 1);
                y(j) = p(t(i, j), 2);
                z(j) = p(t(i, j), 3);
            end

            S(i) = 1/6 * det([1 1 1 1; x(1) x(2) x(3) x(4); y(1) y(2) y(3) y(4); z(1) z(2) z(3) z(4)]);
        end

    end

    % clc,clear
    % x=[0 50 100 200];
    % y = [250 250 200 0];
    % x=[x,x(1)];
    % y=[y,y(1)];
    % figure
    % plot(x,y)
    % s=0;
    % for i=1:length(x)-1
    %     a=x(i)*y(i+1)-x(i+1)*y(i);
    %     s=s+a;
    % end
    % S=1/2*s;
    %
