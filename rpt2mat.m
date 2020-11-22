%
% %         Read data from *.rpt file which includes text and data
% %         information.Content example is listed as following:
% % ********************************************************************************
% % Field Output Report, written Thu Feb  6 13:02:48 2020
% %
% % Source 1
% % ---------
% %
% %    ODB: C:/temp/sq_0d4_22_plastic.odb
% %    Step: Step-1
% %    Frame: Increment      0: Step Time =    0.000
% %
% % Loc 1 : Centroidal values from source 1
% %
% % Output sorted by column "Element Label".
% %
% % Field Output reported at element centroid for part: PART-1-1
% %
% %    Element Label           S.S11           S.S22           S.S33           S.S12           S.S13           S.S23
% %                           @Loc 1          @Loc 1          @Loc 1          @Loc 1          @Loc 1          @Loc 1
% % -----------------------------------------------------------------------------------------------------------------
% %                1              0.              0.              0.              0.              0.              0.
% %                2              0.              0.              0.              0.              0.              0.
% %                3              0.              0.              0.              0.              0.              0.
% % ...
% INPUT:
%       fname--File name
% OUTPUT:
%            d:nX8 sized data array:
%              1st col stores element id;
%              2th col stores Mises;
%              3nd col stores S11;
%              4rd col stores S22;
%              5th col stores S33;
%              6nd col stores S12;
%              7rd col stores S13;
%              8th col stores S23;
%
% Author: Yangyuanchen Liu; Email:liuyangyuanchen@outlook.com
% Modified from: PRTRead.m by Li Haixing; Email:windchaser_lhx@163.com

% check number and type of arguments
% if nargin < 1
%     error('Function requires one input argument');
% elseif ~ischar(fname)
%     error('Input argument must be a string representing a filename');
% end
clc, clear

% Open file
fname = './ReportFile/sq_0d8_tf_iso_ex.rpt';
fid = fopen(fname);
if fid==-1
    error('File not found or permission denied.');
end

% Initialize data array,
d = [];
iFrame = 0;
% Process
while ~feof(fid)
    s = fgets(fid);

    if contains(s, 'Step: Step')
        iStep = str2double(s(15:end));
    elseif contains(s, 'Frame: Increment')
        iFrame = str2double(s(24:26));
        iStepTime = str2double(s(44:end));
    elseif contains(s, 'Total')
        spath = './MatFile/';
        % sname = ['Step-', num2str(iStep), 'Frame-', num2str(iFrame, '%02.0f'), '-StepTime-', num2str(iStepTime), '%02.0f'];
        sname = ['Step-', num2str(iStep), '-Frame-', num2str(iFrame, '%02.0f')];
        d = d';
        save([spath, sname, '.mat'], 'd');
        d = [];
    end

    data = sscanf(s, '%f');

    if ~isempty(data)
        dline = data(1);
        d(:, dline) = data;
    end

end

fclose(fid);
