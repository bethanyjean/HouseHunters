%CS504 Project Jennifer Carr
%BdRm	RegionNameI	StateI	MetroI	Date (eg 2/28/2023)

clc
clear all
close all

[sdata,  OpenedFile] = GetData105('state_region.txt','C:\Users\Jennifer\Documents\GMU\CS 504\Project\scripts\',2);
[data0,  OpenedFile] = GetData105('housing_data_all.txt','C:\Users\Jennifer\Documents\GMU\CS 504\Project\scripts\',5);
% data = data0(data0(:,1)<=3,:); % 1-3 bedroom data only
data = data0(data0(:,1)==3,:); % X bedroom data only
data2 = data(:,5:end); %price data only

%average each year
m = [];
for i = 1:size(data2,1) %rows
    for j = 1:round(size(data2,2)/12) %years
        tmp = [];
        for k = 1:12 %months
            tmp = [tmp;data2(i,j*k)];
        end
        m(i,j) = mean(tmp);
    end
end

%average by region
m2 = [];
for i = 1:max(sdata(:,2)) %loop on region
    r = sdata((sdata(:,2)==i),:);
    tmp = [];
    for k = 1:size(r,1)
        tmp = [tmp;m(data(:,3)==r(k,1),:)]; %matrix with all yrs all states in x region
    end
    for j = 1:size(tmp,2) %loop on year
        m2(i,j) = mean(tmp(tmp(:,j)>0,j)); %average of value greater than 0
    end
    scatter(1:size(m2,2),m2(i,:),'LineWidth',1.5)
    hold on
end

for i = 1:size(m2,1)
    tbl = m2(i,:);
    tbl = tbl(tbl>0); %vector of all house prices for given county/bedroom#
    mdl = fitlm(1:length(tbl),tbl);
%     plot(mdl)
    out = [];
    for j = 1:length(tbl)
        y = (mdl.Coefficients{2,1}*j) + mdl.Coefficients{1,1};
        out = [out;j y];
    end
    plot(out(:,1),out(:,2),'LineWidth',1.5)
    hold on
end

% %average each state
% m2 = [];
% for i = 1:max(data(:,3))
%     tmp = m(data(:,3)==i,:); %single out by state
%     for j = 1:size(tmp,2) %loop on year
%         m2(i,j) = mean(tmp(:,j));
%     end
% end
% 
% for i = 1:size(m2,1)
%     tbl = m2(i,:);
%     tbl = tbl(tbl>0); %vector of all house prices for given county/bedroom#
%     mdl = fitlm(1:length(tbl),tbl);
%     %     plot(mdl)
%     out = [];
%     for j = 1:length(tbl)
%         y = (mdl.Coefficients{2,1}*j) + mdl.Coefficients{1,1};
%         out = [out;j y];
%     end
%     plot(out(:,1),out(:,2))
%     hold on
% end


% %national average calc
% m2 = [];
% for j = 1:size(m,2) %loop on year
%     m2 = [m2 mean(m(m(:,j)>0,j))];
% end
% 
% mdl = fitlm(1:length(m2),m2);














