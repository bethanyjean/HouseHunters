%CS504 Project Jennifer Carr
%BdRm	RegionNameI	StateI	MetroI	2/28/2023

clc
clear all
close all

%[data,  OpenedFile] = GetData105('housing_data_legacy.txt','C:\Users\Jennifer\Documents\GMU\CS 504\Project\scripts\',5);
[data,  OpenedFile] = GetData105('housing_data_reccent.txt','C:\Users\Jennifer\Documents\GMU\CS 504\Project\scripts\',5);
data = data(data(:,5)<500000,:); %only look at homes less than $500,000
data = data(data(:,1)<=3,:); %data with less than 3 bedrooms

%kmeans clustering on each state (price v. region)
out = [];
for i = unique(data(:,3))'
    tmp = data(data(:,3)==i,:); %data by state
    % kmeans clustering
    [idx,c] = kmeans([tmp(:,1) tmp(:,5)],1);
    out = [out;i c];
    scatter(tmp(:,1),tmp(:,5),[],tmp(:,3))
    hold on    
    scatter(c(:,1),c(:,2),'r','filled')
end

%kmeans on result from all states
[idx2,c2] = kmeans([out(:,2) out(:,3)],1);
scatter(c2(:,1),c2(:,2),'magenta','filled')


% %kmedoids clustering on each state (price v. region)
% out = [];
% for i = unique(data(:,3))'
%     tmp = data(data(:,3)==i,:); %data by state
%     % kmedoids clustering
%     [idx,c] = kmedoids([tmp(:,1) tmp(:,5)],1);
%     out = [out;i c];
% %     scatter(tmp(:,1),tmp(:,5),[],tmp(:,3))
%     hold on    
%     scatter(c(:,1),c(:,2),'r','filled')
% end


% data = data(data(:,1)<3,:); %data with less than 3 bedrooms

% %bedroom and price scatter colored by state
% scatter(data(:,1),data(:,5),[],data(:,3))

%region and price scatter colored by state
% scatter(data(:,2),data(:,5),[],data(:,3))



