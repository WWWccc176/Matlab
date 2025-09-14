function jellyfish25
% The mathematical formula is from: @yuruyurau
figure('Position',[300,50,900,900], 'Color','k', ...
    'UserData',[98,121,32,115,108,97,110,100,97,114,101,114]);
axes(gcf, 'NextPlot','add', 'Position',[0,0,1,1], 'Color','k');
axis([0, 400, 0, 400])
i = (12*200:1e4).';
mi = [12*200 + 1, (30*200 + 1):200:(1e4 + 1)].' - 12*200;
rT = @(Mat, t) Mat*[cos(t), sin(t); - sin(t), cos(t)];
k = 5.*cos(mod(i, 200)./14).*cos(i./1290);
e = i./344 - 13;
d = (k.^2 + e.^2)./59 + 4; t = 0; Pos=[0, 300];
bXY = [200 - 3.*sin(atan2(k, e).*e) + k.*(3 + 4./d.*sin(d.^2 - t.*2)), ... 
       400 - (d./2 + e./99).*80]; XY = bXY;
baseT = [mi.*0, mi.*0 + 1];
baseM = baseT.*0;
baseM(:,1) = mean(XY(:,1));
for ii1 = 1:(length(mi) - 1)
    baseM(ii1,2) = max(XY(mi(ii1):(mi(ii1 + 1) - 1), 2));
end
baseM(1,2) = .1.*max(XY(:,2)) + .9.*max(XY(mi(2):(mi(3) - 1), 2));
baseM0 = baseM;
baseD = diff(baseM(:,2)); Pos=[200,300];
SHdl = scatter(XY(:,1), XY(:,2), 1, 'filled','o', 'w', 'MarkerEdgeColor','none', 'MarkerFaceAlpha',.4);
set(gcf, 'WindowButtonMotionFcn',@jellyfishFcn); disp(char(get(gcf, 'UserData')))
fps = 16; warning off
game = timer('ExecutionMode', 'FixedRate', 'Period',1/fps, 'TimerFcn', @jellyfishGame);
start(game)
set(gcf,'tag','co','CloseRequestFcn',@clo);
    function clo(~,~)
        stop(game);delete(findobj('tag','co'));clf;close
    end
    function jellyfishGame(~,~)
        t = t + pi/10;
        bXY = [200 - 3.*sin(atan2(k, e).*e) + k.*(3 + 4./d.*sin(d.^2 - t.*2)), ...  
               400 - (d./2 + e./99).*80];
        Dir = Pos - baseM(1,:);
        Dir = Dir./norm(Dir);
        baseT = (baseT(1:end,:) + [Dir; baseT(1:end-1,:)])./2;
        baseT = baseT./(vecnorm(baseT')');
        theta = atan2(baseT(:,2), baseT(:,1)) - pi/2;
        baseM(1,:) = baseM(1,:) + (Pos - baseM(1,:))./30;
        baseM(2:end,:) = baseM(1,:) + [cumsum(baseD.*baseT(2:end,1)), cumsum(baseD.*baseT(2:end,2))];
        for ii = 1:(length(mi) - 1)
            XY(mi(ii):(mi(ii + 1) - 1), :) = rT(bXY(mi(ii):(mi(ii + 1) - 1), :) - baseM0(ii,:), theta(ii)) + baseM(ii,:);
        end
        SHdl.XData = XY(:,1);
        SHdl.YData = XY(:,2);
    end
    function jellyfishFcn(~,~)
        xy = get(gca,'CurrentPoint');
        x = xy(1,1); y = xy(1,2);
        Pos = [x,y];
        Pos(Pos > 400) = 400;
        Pos(Pos < -400) = -400;
    end

end
