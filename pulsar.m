%% Code adapted from 
% https://blogs.mathworks.com/graphics-and-apps/2024/01/10/creating-ridgeline-plots-from-pulsars-to-pop-culture/

%%  Get data from the web
filename = 'https://github.com/MATLAB-Graphics-and-App-Building/matlab-gaab-blog-2024/raw/3eb648f40f1ba8e5517138f34d23567ab3af6d29/RidgelinePlotsJoyDivision/pulsar.csv';
pulsar = readmatrix(filename).';

%% Set viariables for plotting
[nSamples,nPulses] = size(pulsar);
interval = 8;
vertOffsets = (nPulses-1)*interval : -interval : 0;
ydata = pulsar + vertOffsets;
xdata = linspace(-220,220,nSamples);
colours=rand(80,1);

%% Plot
h = figure('NumberTitle','off', 'Color', 'k', Name='Pulsar');
axes(Units='normalized',Position=[0 0.03 1 1]);

h.Position = [100 100 450 750];
colormap colorcube % available colourmaps: https://uk.mathworks.com/help/matlab/ref/colormap.html
[az,el]=view(0,45);

set(gcf,'color','k');
set(gca,'color','k');
axis equal tight off

hold on

% v = VideoWriter("pulsar_video.mp4", "MPEG-4");
% open(v)

for i = 1:nPulses
    yvec = vertOffsets(i) .* ones(nSamples,1);
    patch(xdata, yvec, pulsar(:,i), colours(i), 'FaceAlpha',.4,EdgeColor='none');
    h=plot3(xdata,yvec,pulsar(:,i),'w-');
    drawnow limitrate
    pause(0.05);
    % view(az, el-i*0.4375); % move POV as the graph is generated
    % writeVideo(v, getframe(gcf))
end
% close(v)
