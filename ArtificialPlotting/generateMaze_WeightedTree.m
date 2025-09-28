function [UMat,DMat,LMat,RMat] = generateMaze_WeightedTree(sz, pNew, extraLoopRate)
% sz = [M,N], pNew 为使用 newest 策略的概率（0~1），
% extraLoopRate 是生成后再打通墙的比例（0~1）。

M = sz(1); N = sz(2);
% 初始化
visited = false(M,N);
UMat = ones(M,N); DMat = ones(M,N);
LMat = ones(M,N); RMat = ones(M,N);

% cellList 存放所有已挖通且“有未访问邻居”的格子
cellList = [];

% 从随机起点开始
r0 = randi(M); c0 = randi(N);
visited(r0,c0)=true;
cellList = [cellList; r0, c0];

% 四连方向
dirs = [-1,0; 1,0; 0,-1; 0,1];

while ~isempty(cellList)
    % 1）选当前要扩展的 cell
    if rand < pNew
        idx = size(cellList,1);            % newest
    else
        idx = randi(size(cellList,1));     % random
    end
    cur = cellList(idx,:);
    r = cur(1); c = cur(2);
    % 2）找未访问邻居
    neigh = [];
    for k=1:4
        rn=r+dirs(k,1); cn=c+dirs(k,2);
        if rn>=1 && rn<=M && cn>=1 && cn<=N && ~visited(rn,cn)
            neigh(end+1,:) = [rn,cn,k];  %#ok<AGROW>
        end
    end
    if isempty(neigh)
        % 3）回溯：如果没有可访问邻居，就删出 cellList
        cellList(idx,:) = [];
    else
        % 4）打通墙
        pick = neigh(randi(size(neigh,1)),:);
        rn = pick(1); cn = pick(2); d = pick(3);
        switch d
            case 1 % 上
                UMat(r,c)=0; DMat(rn,cn)=0;
            case 2 % 下
                DMat(r,c)=0; UMat(rn,cn)=0;
            case 3 % 左
                LMat(r,c)=0; RMat(rn,cn)=0;
            case 4 % 右
                RMat(r,c)=0; LMat(rn,cn)=0;
        end
        visited(rn,cn)=true;
        % 5）新格子入队
        cellList(end+1,:) = [rn,cn];
    end
end

% B.1：随机加回路（打通额外墙壁）
allWalls = [];
for i=1:M
  for j=1:N
    % 只枚举每个单元右边和下边的墙
    if j<N, allWalls = [allWalls; i,j,4]; end % 单元(i,j)的 4=右
    if i<M, allWalls = [allWalls; i,j,2]; end % 单元(i,j)的 2=下
  end
end
% 随机打乱
sh = randperm(size(allWalls,1));
nExtra = round(extraLoopRate * numel(sh));
for i=1:nExtra
    w = allWalls(sh(i),:);
    r=w(1); c=w(2); d=w(3);
    % 如果当前这堵墙还存在，就删掉
    switch d
      case 4 % 右墙
        if RMat(r,c)==1
          RMat(r,c)=0; LMat(r,c+1)=0;
        end
      case 2 % 下墙
        if DMat(r,c)==1
          DMat(r,c)=0; UMat(r+1,c)=0;
        end
    end
end

end