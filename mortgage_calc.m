%mortgage calc CS504 Jennifer Carr
%https://www.bankrate.com/mortgages/mortgage-calculator/#how-mortgage-calculator-help
%does not include property tax, home owners insurance, hoa
%property tax = home value x rate (by county) 
%https://www.nerdwallet.com/article/taxes/property-tax#:~:text=Property%20tax%20is%20typically%20determined,the%20property%20x%20tax%20rate.
%https://taxfoundation.org/property-taxes-by-state-county-2022/

% 2023	2.121025583	220740.2446
% 2000	2.164669171	87289.45295
%avg tax rate 

clc
clear

%read in property tax values
[tax,  OpenedFile] = GetData105('property-tax-by-state.txt','C:\Users\Jennifer\Documents\GMU\CS 504\Project\scripts\',1);

%calculate monthly payment
% %user provide
h = 500000; %home price
d = h*0.2; %down payment - could be standard 20% of home price
r = 0.07; %mortgage rate
s = 20; %enter state index for property tax

%----------calc----------
txr = tax(s); %tax rate for given state
tx = h*txr; %total tax per yr
txm = tx/12; %tax paid by month
n = 30*12; %number of monthly payments - 30 yr loan
p = h - d; %principle loan amount
mr = r/12; %monthly mortgage rate

M = p*(mr*((1+mr)^n))/(((1+mr)^n)-1) + txm


%how much house can I afford
%spending 28% of income on housing
%without property tax

% %user provide
% gmi = 4000; %gross monthly income
% d = 20000; %down payment
% r = 0.07; %mortgage rate
% 
% %----------calc----------
% n = 30*12; %number of monthly payments
% mr = r/12; %monthly mortgage rate
% M = gmi*0.28;
% 
% p = M/((mr*((1+mr)^n))/(((1+mr)^n)-1));
% h = p + d %home price









