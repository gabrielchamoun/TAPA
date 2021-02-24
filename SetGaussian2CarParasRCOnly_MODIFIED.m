Coupled = 1;        % This dictates whether the material will conduct.
TwoCarriers = 1;    % Changing this removes the concentration of holes.
RC = 1;             % imposes a time varying effect to the carriers.

nx = 201;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

% Nd = 1e16 * 1e6; % Const. 1/cm3 (100 cm/m)^3
% NetDoping = ones(1,nx).*Nd; % doping


% ***************** CHANGE HERE *****************
% Create a linear doping from 1e16-20e16
Nd = linspace(1e16 * 1e6,20e16 * 1e6,nx);	% range of values
NetDoping = ones(1,nx).*Nd;     % doping profile
%
% Making this change effects the net doping profile
% The transistion shows how as the doping change effects the relative
% conductivity which in turn creates the voltage over the region.
% 

x0 = l/2;
nw = l/20;
npDisturbance = 1e16*1e6*exp(-((x-x0)/nw).^2);

% ***************** CHANGE HERE *****************
% npDisturbance = 0;
%
% Turning off npDisturbance removes the extra added on offset to the
% concentration of the holes in the material. Now the doping of holes is in
% line with the linear gradient created.
%

LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

% Commenting out to make sure plot is visible
% PlotYAxis = {[-1e-15 2e-15] [-2e-9 2e-9] [-1.5e-12 1.5e-12]...
%     [1e22 2e22] [0 1e22] [0 20e43]...
%     [-20e33 15e33] [-2.5e34 2e34] [-1.1e8 1.1e8] ...
%     [-1e8 1e8] [-10e-3 10e-3] [0 2e22]};

doPlotImage = 0;
PlotFile = 'Gau2CarRC.gif';
