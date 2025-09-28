function Maze

% 地图基础信息设置
mazeSize=[110,110];
SPos=[2,5];
showMap=true;
showSurf=true;

% 初始化可达迷宫及上下左右围墙矩阵
mazeMat=ones(mazeSize);
mazeMat(sub2ind(mazeSize,SPos(:,1),SPos(:,2)))=0;
zerosMat=zeros(mazeSize);
disMat=zeros(mazeSize);
[UMat,DMat,LMat,RMat]=...
    deal(ones(mazeSize),ones(mazeSize),ones(mazeSize),ones(mazeSize));

if showMap
    wallHdl=drawMap(UMat,DMat,LMat,RMat);
end

while any(any(mazeMat))
    % 找到全部已经走到过且周围至少有一个门的房间
    UMazeMat=zerosMat;UMazeMat(2:end,:)=mazeMat(1:end-1,:);
    DMazeMat=zerosMat;DMazeMat(1:end-1,:)=mazeMat(2:end,:);
    LMazeMat=zerosMat;LMazeMat(:,2:end)=mazeMat(:,1:end-1);
    RMazeMat=zerosMat;RMazeMat(:,1:end-1)=mazeMat(:,2:end);
    maze4Mat=UMazeMat+DMazeMat+LMazeMat+RMazeMat;
    [acRow,acCol]=find(mazeMat==0&maze4Mat>0);
    % 随机选择一个当前已经走到过的房间
    tempInd=randi(size(acRow,1),[1,1]);
    tempRow=acRow(tempInd);
    tempCol=acCol(tempInd);
    % 删掉地图外房间位置和不可达房间位置
    nextPos=[tempRow,tempCol]+[-1,0;1,0;0,-1;0,1];
    nextPos(nextPos(:,1)<1,:)=[];
    nextPos(nextPos(:,2)<1,:)=[];
    nextPos(nextPos(:,1)>mazeSize(1),:)=[];
    nextPos(nextPos(:,2)>mazeSize(2),:)=[];
    nextBool=mazeMat(sub2ind(mazeSize,nextPos(:,1),nextPos(:,2)))>0;
    nextPos=nextPos(nextBool,:);
    % 随机选择下一个房间
    nextInd=randi(size(nextPos,1),[1,1]);
    nextRow=nextPos(nextInd,1);
    nextCol=nextPos(nextInd,2);
    mazeMat(nextRow,nextCol)=0;
    disMat(nextRow,nextCol)=disMat(tempRow,tempCol)+1;
    % 打破墙壁
    switch true
        case isequal([nextRow,nextCol]-[tempRow,tempCol],[-1,0])
            UMat(tempRow,tempCol)=0;DMat(nextRow,nextCol)=0;
        case isequal([nextRow,nextCol]-[tempRow,tempCol],[1,0])
            DMat(tempRow,tempCol)=0;UMat(nextRow,nextCol)=0;
        case isequal([nextRow,nextCol]-[tempRow,tempCol],[0,-1])
            LMat(tempRow,tempCol)=0;RMat(nextRow,nextCol)=0;
        case isequal([nextRow,nextCol]-[tempRow,tempCol],[0,1])
            RMat(tempRow,tempCol)=0;LMat(nextRow,nextCol)=0;
    end
    % 用来显示地迷宫的代码
    if showMap
    refreshMap(wallHdl,UMat,DMat,LMat,RMat)
    drawnow
    end
end
% =========================================================================
% 绘制颜色映射图
if showSurf
sax=gca;hold on
[sM,sN]=size(UMat);
sax.XLim=[0,sN]+.5;
sax.YLim=[0,sM]+.5;
sax.DataAspectRatio=[1,1,1];
surf(flipud(disMat),'EdgeColor','none')
colormap(pink)

% 自定义色带
if 0
Cmap=[89,214,179
140,181,195
177,156,206
241,189,239
215,193,244
178,199,253
140,189,234
145,166,229
106,85,202]./255;
Ci=1:size(Cmap,1);Cq=linspace(1,size(Cmap,1),300);
Cmap=[interp1(Ci,Cmap(:,1),Cq,'linear')',...
     interp1(Ci,Cmap(:,2),Cq,'linear')',...
     interp1(Ci,Cmap(:,3),Cq,'linear')'];
colormap(Cmap)
end
end
% =========================================================================
% CODE: test drawMap
% UMat(2,3)=0;
% DMat(1,3)=0;
% drawMap(UMat,DMat,LMat,RMat)
    function wallHdl=drawMap(UMat,DMat,LMat,RMat)
        ax=gca;hold on
        [M,N]=size(UMat);
        ax.XLim=[0,N]+.5;
        ax.YLim=[0,M]+.5;
        ax.DataAspectRatio=[1,1,1];
        % 绘制上方围墙
        [Y,X]=find(UMat);Y=M+1-Y;
        X=[X.'+[.5;-.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[.5;.5];nan.*(ones(1,length(Y)))];
        wallHdl{1}=plot(X(:),Y(:),'LineWidth',1,'Color','k');
        % 绘制下方围墙
        [Y,X]=find(DMat);Y=M+1-Y;
        X=[X.'+[.5;-.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[-.5;-.5];nan.*(ones(1,length(Y)))];
        wallHdl{2}=plot(X(:),Y(:),'LineWidth',1,'Color','k');
        % 绘制左侧围墙
        [Y,X]=find(LMat);Y=M+1-Y;
        X=[X.'+[-.5;-.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[.5;-.5];nan.*(ones(1,length(Y)))];
        wallHdl{3}=plot(X(:),Y(:),'LineWidth',1,'Color','k');
        % 绘制右侧围墙
        [Y,X]=find(RMat);Y=M+1-Y;
        X=[X.'+[.5;.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[.5;-.5];nan.*(ones(1,length(Y)))];
        wallHdl{4}=plot(X(:),Y(:),'LineWidth',1,'Color','k');
    end
% -------------------------------------------------------------------------
    function refreshMap(wallHdl,UMat,DMat,LMat,RMat)
        [M,~]=size(UMat);
        % 绘制上方围墙
        [Y,X]=find(UMat);Y=M+1-Y;
        X=[X.'+[.5;-.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[.5;.5];nan.*(ones(1,length(Y)))];
        wallHdl{1}.XData=X(:);
        wallHdl{1}.YData=Y(:);
        % 绘制下方围墙
        [Y,X]=find(DMat);Y=M+1-Y;
        X=[X.'+[.5;-.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[-.5;-.5];nan.*(ones(1,length(Y)))];
        wallHdl{2}.XData=X(:);
        wallHdl{2}.YData=Y(:);
        % 绘制左侧围墙
        [Y,X]=find(LMat);Y=M+1-Y;
        X=[X.'+[-.5;-.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[.5;-.5];nan.*(ones(1,length(Y)))];
        wallHdl{3}.XData=X(:);
        wallHdl{3}.YData=Y(:);
        % 绘制右侧围墙
        [Y,X]=find(RMat);Y=M+1-Y;
        X=[X.'+[.5;.5];nan.*(ones(1,length(X)))];
        Y=[Y.'+[.5;-.5];nan.*(ones(1,length(Y)))];
        wallHdl{4}.XData=X(:);
        wallHdl{4}.YData=Y(:);
    end
end