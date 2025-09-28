% --- TrefoilSpring_precompute.m ---

total_frames = 96;

% 1. Pre-computation Phase
fprintf('Pre-computing all frames... Please wait.\n');
X_all = cell(1, total_frames);
Y_all = cell(1, total_frames);
Z_all = cell(1, total_frames);
C_all = cell(1, total_frames);

% Create a temporary figure to run the setup part of the function
figure;
compute_frame_data(1); % Run once to initialize persistent variables

for f = 1:total_frames
    [X_all{f}, Y_all{f}, Z_all{f}, C_all{f}] = compute_frame_data(f);
    fprintf('Computed frame %d/%d\n', f, total_frames);
end

fprintf('Computation complete. Starting animation.\n');

% 2. Playback Phase
% Setup figure for playback
figure;
clf;
set(gca,'Visible','off','Units','Normalized','InnerPosition',[0 0 1 1],'XLim',[-4 4],'YLim',[-4.4 3.6],'ZLim',[-4 4],'NextPlot','Add');
pbaspect([1 1 1]);daspect([1 1 1]);
set(gcf,'Color',[0 0 0]);
lighting gouraud;
camlight headlight;

% Create the surface object with the data from the first frame
H = surf(X_all{1}, Y_all{1}, Z_all{1}, C_all{1}, 'EdgeColor','none','FaceAlpha',1);

M = hsv;

% Loop for playback - this will be VERY fast
while true % Loop indefinitely
    for f = 1:total_frames
        % Update surface data (very fast operation)
        set(H, 'XData', X_all{f}, 'YData', Y_all{f}, 'ZData', Z_all{f});
        
        % Update colormap
        Ci = round((f/96)*256);
        colormap(M([Ci+1:end,1:Ci],:));
        
        drawnow; % Or pause(0.01) for controlled speed
    end
end