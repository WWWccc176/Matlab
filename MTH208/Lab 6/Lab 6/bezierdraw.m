%Program 3.7 Freehand Draw Program Using Bezier Splines
%Click in Matlab figure window to locate first point, and click 
%     three more times to specify 2 control points and the next 
%     spline point. Continue with groups of 3 points to add more
%     to the curve. Press return to terminate program.
function bezierdraw
plot([-1 1],[0,0],'k',[0 0],[-1 1],'k');hold on
t=0:.02:1;
[x,y]=ginput(1);            % get one mouse click
plot(x(1),y(1),'bo'); drawnow;
while(0 == 0)        
  [xnew,ynew] = ginput(1);  % get one mouse click
  if length(xnew) < 1
    break                   % if `return' pressed, terminate
  end
  x=[x;xnew];y=[y;ynew];    % plot spline points and control pts
  plot([x(1) x(2)],[y(1) y(2)],'r:',x(2),y(2),'rs'); drawnow;
  [xnew,ynew] = ginput(1);  % get one mouse click
  if length(xnew) < 1
    break                   % if `return' pressed, terminate
  end
  x=[x;xnew];y=[y;ynew];    % plot spline points and control pts
  plot([x(2) x(3)],[y(2) y(3)],'r:',x(3),y(3),'rs'); drawnow;
  [xnew,ynew] = ginput(1);  % get one mouse click
  if length(xnew) < 1
    break                   % if return pressed, terminate
  end
  x=[x;xnew];y=[y;ynew];    % plot spline points and control pts
  plot([x(3) x(4)],[y(3) y(4)],'r:',x(4),y(4),'bo'); drawnow;
  bx=3*(x(2)-x(1)); by=3*(y(2)-y(1)); % spline equations ...
  cx=3*(x(3)-x(2))-bx;cy=3*(y(3)-y(2))-by;
  dx=x(4)-x(1)-bx-cx;dy=y(4)-y(1)-by-cy;
  xp=x(1)+t.*(bx+t.*(cx+t*dx));    % Horner's method
  yp=y(1)+t.*(by+t.*(cy+t*dy));
  plot(xp,yp,'b')             % plot spline curve
  x=x(4);y=y(4);            % promote last to first and repeat
end
hold off
