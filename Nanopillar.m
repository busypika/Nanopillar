%%  Clear Enviroment Variables
clear all
clc

%%  Load Data
% Read 'Nanopillar_M.txt' & 'Nanopillar_P.txt'
% Please ensure 'Nanopillar_M.txt', 'Nanopillar_P.txt' & this script are both in the same directory 
[n_M, M_x, M_y, M_z] = textread('Nanopillar_M.txt','%f%f%f%f', 'headerlines',2,'emptyvalue', NaN);
[n_P, P_x, P_y, P_z] = textread('Nanopillar_P.txt','%f%f%f%f', 'headerlines',2,'emptyvalue', NaN);

%%  Plot Nanopillar Figure
% plot3(M_x,M_y,M_z,'k.')                         % plot M with '.' & black
% hold on
plot3(P_x,P_y,P_z,'r.','MarkerFaceColor','r')   % plot P with 'o' & red
box on
axis equal
% hold off

%% Plot a Unit Cell
% hold on
% plot3([0 1], [0 0], [0 0],'k')
% plot3([0 0], [0 1], [0 0],'k')
% plot3([0 0], [0 0], [0 1],'k')
% 
% plot3([0 1], [1 1], [0 0],'k')
% plot3([0 1], [0 0], [1 1],'k')
% plot3([0 1], [1 1], [1 1],'k')
% 
% plot3([1 1], [0 1], [0 0],'k')
% plot3([0 0], [0 1], [1 1],'k')
% plot3([1 1], [0 1], [1 1],'k')
% 
% plot3([1 1], [0 0], [0 1],'k')
% plot3([0 0], [1 1], [0 1],'k')
% plot3([1 1], [1 1], [0 1],'k')
% hold off
