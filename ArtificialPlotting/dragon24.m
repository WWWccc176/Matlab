function dragon24
% Copyright (c) 2024, Zhaoxu Liu / slandarer
baseV=[ -.016,.822; -.074,.809; -.114,.781; -.147,.738; -.149,.687; -.150,.630;
          -.157,.554; -.166,.482; -.176,.425; -.208,.368; -.237,.298; -.284,.216;
          -.317,.143; -.338,.091; -.362,.037;-.382,-.006;-.420,-.051;-.460,-.084;
         -.477,-.110;-.430,-.103;-.387,-.084;-.352,-.065;-.317,-.060;-.300,-.082;
         -.331,-.139;-.359,-.201;-.385,-.262;-.415,-.342;-.451,-.418;-.494,-.510;
         -.533,-.599;-.569,-.675;-.607,-.753;-.647,-.829;-.689,-.932;-.699,-.988;
         -.639,-.905;-.581,-.809;-.534,-.717;-.489,-.642;-.442,-.543;-.393,-.447;
         -.339,-.362;-.295,-.296;-.251,-.251;-.206,-.241;-.183,-.281;-.175,-.350;
         -.156,-.434;-.136,-.521;-.128,-.594;-.103,-.677;-.083,-.739;-.067,-.813;-.039,-.852];
% 基础比例、上色方式数据
baseV=[0,.82;baseV;baseV(end:-1:1,:).*[-1,1];0,.82];
baseV=baseV-mean(baseV,1);
baseF=1:size(baseV,1);
baseY=baseV(:,2);
baseY=(baseY-min(baseY))./(max(baseY)-min(baseY));
N=120;
baseR=sin(linspace(pi/4,5*pi/6,N))./1.2;
baseR=[baseR',baseR'];baseR(1,:)=[1,1];
baseR(5,:)=[2,.6];
baseR(10,:)=[3.7,.4];
baseR(15,:)=[1.8,.6];
baseT=[zeros(N,1),ones(N,1)];
baseM=zeros(N,2);
baseD=baseM;
ratioT=@(Mat,t)Mat*[cos(t),sin(t);-sin(t),cos(t)];
% 配色数据
CList=[211,56,32;56,105,166;253,209,95]./255;
% CList=bone(4);CList=CList(2:4,:);
% CList=flipud(bone(3));
% CList=lines(3);
% CList=colorcube(3);
% CList=rand(3)
baseC1=CList(2,:)+baseY.*(CList(1,:)-CList(2,:));
baseC2=CList(3,:)+baseY.*(CList(1,:)-CList(3,:));
% 构建图窗
fig=figure('units','normalized','position',[.1,.1,.5,.8],...
    'UserData',[98,121,32,115,108,97,110,100,97,114,101,114]);
axes('parent',fig,'NextPlot','add','Color',[0,0,0],...
    'DataAspectRatio',[1,1,1],'XLim',[-6,6],'YLim',[-6,6],'Position',[0,0,1,1]);
% 构造龙每个部分句柄
dragonHdl(1)=patch('Faces',baseF,'Vertices',baseV,'FaceVertexCData',baseC1,'FaceColor','interp','EdgeColor','none','FaceAlpha',.95);disp(char(fig.UserData))
for i=2:N
    dragonHdl(i)=patch('Faces',baseF,'Vertices',baseV.*baseR(i,:)-[0,i./2.5-.3],'FaceVertexCData',baseC2,'FaceColor','interp','EdgeColor','none','FaceAlpha',.7);
end
set(dragonHdl(5),'FaceVertexCData',baseC1,'FaceAlpha',.7)
set(dragonHdl(10),'FaceVertexCData',baseC1,'FaceAlpha',.7)
set(dragonHdl(15),'FaceVertexCData',baseC1,'FaceAlpha',.7)
for i=N:-1:1,uistack(dragonHdl(i),'top');end
for i=1:N
    baseM(i,:)=mean(get(dragonHdl(i),'Vertices'),1);
end
baseD=diff(baseM(:,2));Pos=[0,2];
% 主循环及旋转、运动计算
set(gcf,'WindowButtonMotionFcn',@dragonFcn)
fps=8;
game=timer('ExecutionMode', 'FixedRate', 'Period',1/fps, 'TimerFcn', @dragonGame);
start(game)
% Copyright (c) 2023, Zhaoxu Liu / slandarer
set(gcf,'tag','co','CloseRequestFcn',@clo);
    function clo(~,~)
        stop(game);delete(findobj('tag','co'));clf;close
    end
    function dragonGame(~,~)
        Dir=Pos-baseM(1,:);
        Dir=Dir./norm(Dir);
        baseT=(baseT(1:end,:)+[Dir;baseT(1:end-1,:)])./2;
        baseT=baseT./(vecnorm(baseT')');
        theta=atan2(baseT(:,2),baseT(:,1))-pi/2;
        baseM(1,:)=baseM(1,:)+(Pos-baseM(1,:))./30;
        baseM(2:end,:)=baseM(1,:)+[cumsum(baseD.*baseT(2:end,1)),cumsum(baseD.*baseT(2:end,2))];

        for ii=1:N
            set(dragonHdl(ii),'Vertices',ratioT(baseV.*baseR(ii,:),theta(ii))+baseM(ii,:))
        end
    end
    function dragonFcn(~,~)
        xy=get(gca,'CurrentPoint');
        x=xy(1,1);y=xy(1,2);
        Pos=[x,y];
        Pos(Pos>6)=6;
        Pos(Pos<-6)=6;
    end
end