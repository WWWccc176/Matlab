function Maze2
    % 地图基础信息设置
    mazeSize = [300, 300];
    SPos = [1, 1];             % 入口固定为左上角
    showMap  = true;
    showSurf = true;

    % 初始化可达迷宫标记及上下左右围墙矩阵
    mazeMat = ones(mazeSize);                           
    mazeMat(sub2ind(mazeSize, SPos(1), SPos(2))) = 0;  
    disMat  = zeros(mazeSize);                        
    [UMat, DMat, LMat, RMat] = deal(ones(mazeSize));  

    % 初始绘图
    if showMap
        wallHdl = drawMap(UMat, DMat, LMat, RMat);
    end

    % ------------------------------------------------
    % 下面整段替换原来的 while…end 生成逻辑，改成 Wilson 算法
    dirs = [-1,0; 1,0; 0,-1; 0,1];  % 上、下、左、右

    while any(mazeMat(:))  % 还有未访问的格子
        % 1) 从所有未访问格子中随机取一个做游走起点
        [rList, cList] = find(mazeMat==1);
        idx = randi(numel(rList));
        path = [rList(idx), cList(idx)];
        pr = path(1,1); pc = path(1,2);

        % 2) Loop‐Erased Random Walk：一直游走，直到踩到已访问格子
        while mazeMat(pr,pc)==1
            k = randi(4);
            pr2 = pr + dirs(k,1);
            pc2 = pc + dirs(k,2);
            % 边界检查
            if pr2<1 || pr2>mazeSize(1) || pc2<1 || pc2>mazeSize(2)
                continue
            end
            % 如果新格在当前 path 中，删除环
            dup = find(path(:,1)==pr2 & path(:,2)==pc2, 1);
            if ~isempty(dup)
                path(dup:end, :) = [];
            end
            % 扩展 path
            path = [path; pr2, pc2]; %#ok<AGROW>
            pr = pr2; pc = pc2;
        end

        % 3) 路径上所有格子都打通并标为已访问
        for t = 1:size(path,1)-1
            r1 = path(t,1);   c1 = path(t,2);
            r2 = path(t+1,1); c2 = path(t+1,2);
            % 破墙
            if r2==r1-1 && c2==c1     % 上
                UMat(r1,c1)=0; DMat(r2,c2)=0;
            elseif r2==r1+1 && c2==c1 % 下
                DMat(r1,c1)=0; UMat(r2,c2)=0;
            elseif r2==r1 && c2==c1-1 % 左
                LMat(r1,c1)=0; RMat(r2,c2)=0;
            elseif r2==r1 && c2==c1+1 % 右
                RMat(r1,c1)=0; LMat(r2,c2)=0;
            end
            % 标记已访问（生成阶段的标记，不再做距离累加）
            mazeMat(r1,c1)=0;
            mazeMat(r2,c2)=0;
        end

        % 4) 如果开启动画，每次更新都刷新一次图
        if showMap
            refreshMap(wallHdl, UMat, DMat, LMat, RMat);
            drawnow limitrate;
        end
    end
    % ------------------------------------------------

    % 迷宫生成完毕后，用 BFS 从入口重新计算最短路径长度
    exitPos = [mazeSize(1), mazeSize(2)-1];  % 出口设为底部边界上临近右下角的一点
    % 初始化距离矩阵
    disMat = inf(mazeSize);
    disMat(SPos(1), SPos(2)) = 0;
    % BFS 队列
    Q = [SPos, 0];  % [行, 列, 距离]
    head = 1;
    while head <= size(Q,1)
        r = Q(head,1); c = Q(head,2); d0 = Q(head,3);
        head = head + 1;
        % 四个方向检查通路并更新
        % 下
        if DMat(r,c)==0 && disMat(r+1,c)==inf
            disMat(r+1,c) = d0 + 1;
            Q(end+1, :) = [r+1, c, d0+1];
        end
        % 上
        if UMat(r,c)==0 && disMat(r-1,c)==inf
            disMat(r-1,c) = d0 + 1;
            Q(end+1, :) = [r-1, c, d0+1];
        end
        % 右
        if RMat(r,c)==0 && disMat(r,c+1)==inf
            disMat(r,c+1) = d0 + 1;
            Q(end+1, :) = [r, c+1, d0+1];
        end
        % 左
        if LMat(r,c)==0 && disMat(r,c-1)==inf
            disMat(r,c-1) = d0 + 1;
            Q(end+1, :) = [r, c-1, d0+1];
        end
    end

    % 绘制颜色映射图
    if showSurf
        sax = gca; hold on
        [sM, sN] = size(UMat);
        sax.XLim = [0, sN] + .5;
        sax.YLim = [0, sM] + .5;
        sax.DataAspectRatio = [1,1,1];
        surf(flipud(disMat), 'EdgeColor','none')
        colormap(pink)
    end

% =============================================================================
% 以下为 drawMap / refreshMap 函数，与原版完全相同
    function wallHdl = drawMap(UMat,DMat,LMat,RMat)
        ax = gca; hold on
        [M,N] = size(UMat);
        ax.XLim = [0, N] + .5;
        ax.YLim = [0, M] + .5;
        ax.DataAspectRatio = [1,1,1];
        % 上墙
        [Y,X] = find(UMat); Y = M+1 - Y;
        X = [X.'+[.5;-.5]; nan(1,length(X))];
        Y = [Y.'+[.5;.5];   nan(1,length(Y))];
        wallHdl{1} = plot(X(:),Y(:),'k','LineWidth',1);
        % 下墙
        [Y,X] = find(DMat); Y = M+1 - Y;
        X = [X.'+[.5;-.5]; nan(1,length(X))];
        Y = [Y.'+[-.5;- .5]; nan(1,length(Y))];
        wallHdl{2} = plot(X(:),Y(:),'k','LineWidth',1);
        % 左墙
        [Y,X] = find(LMat); Y = M+1 - Y;
        X = [X.'+[-.5;- .5];nan(1,length(X))];
        Y = [Y.'+[.5;-.5];nan(1,length(Y))];
        wallHdl{3} = plot(X(:),Y(:),'k','LineWidth',1);
        % 右墙
        [Y,X] = find(RMat); Y = M+1 - Y;
        X = [X.'+[.5;.5]; nan(1,length(X))];
        Y = [Y.'+[.5;-.5]; nan(1,length(Y))];
        wallHdl{4} = plot(X(:),Y(:),'k','LineWidth',1);
    end

    function refreshMap(wallHdl,UMat,DMat,LMat,RMat)
        [M,~] = size(UMat);
        % 上墙
        [Y,X] = find(UMat); Y = M+1 - Y;
        X = [X.'+[.5;-.5]; nan(1,length(X))];
        Y = [Y.'+[.5;.5];   nan(1,length(Y))];
        wallHdl{1}.XData = X(:);
        wallHdl{1}.YData = Y(:);
        % 下墙
        [Y,X] = find(DMat); Y = M+1 - Y;
        X = [X.'+[.5;-.5]; nan(1,length(X))];
        Y = [Y.'+[-.5;-.5]; nan(1,length(Y))];
        wallHdl{2}.XData = X(:);
        wallHdl{2}.YData = Y(:);
        % 左墙
        [Y,X] = find(LMat); Y = M+1 - Y;
        X = [X.'+[-.5;-.5]; nan(1,length(X))];
        Y = [Y.'+[.5;-.5]; nan(1,length(Y))];
        wallHdl{3}.XData = X(:);
        wallHdl{3}.YData = Y(:);
        % 右墙
        [Y,X] = find(RMat); Y = M+1 - Y;
        X = [X.'+[.5;.5]; nan(1,length(X))];
        Y = [Y.'+[.5;-.5]; nan(1,length(Y))];
        wallHdl{4}.XData = X(:);
        wallHdl{4}.YData = Y(:);
    end
end