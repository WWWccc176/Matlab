function TrefoilSpring(f)
    % draws the surface of a 'spring' stretched along the path of a trefoil
    % knot with a compression wave travelling through it
        persistent N n H t x y z X Y Z u v w R nT F CM U MC L C S D p

        % setup
        if f == 1

            %% helper functions

            F = @cellfun;
            CM = @cell2mat;
            MC = @mat2cell;
            L = @linspace;
            C = @cos;
            S = @sin;
            U = 'UniformOutput';
            D = {'XData','YData','ZData','CData'};
            p = 2*pi;

            %% figure/axes

            % set axes props
            set(gca,'Visible','off','Units','Normalized','InnerPosition',[0 0 1 1],'XLim',[-4 4],'YLim',[-4.4 3.6],'ZLim',[-4 4],'NextPlot','Add');
            pbaspect([1 1 1]);daspect([1 1 1]);

            % set figure background color
            set(gcf,'Color',[0 0 0]);

            % lighting
            lighting gouraud;
            camlight headlight;

            %% tube/spiral properties

            % number of circles used to define the tube surface
            N = 1000;
            % number of points to create each circle cross-section
            n = 20;
            % radius of the central rube, defines the distance of the spiral
            % from the central path
            R = .5;
            % Number of spiral turns around the central tube
            nT = 48;
            % parameter for the trefoil knot curve
            t = L(0, p, N);
            % trefoil knot parametric equations
            x = S(t) + 2 * S(2 * t);
            y = C(t) - 2 * C(2 * t);
            z = -S(3 * t);
            % tube surface
            H = surf(D{1},[],D{2},[],D{3},[],D{4},[],'EdgeColor','none','FaceAlpha',1);

        end


        %% set up compression wave

        % index shift for this frame
        I = mod((f - 1) * (N / 96), N); % Shift by fixed amount per frame
        % modify t with cosine shaped compression effect, centered on mod((f-1)/96,95)*2*pi, intensity 0.4
        tM = cumsum(1-.4*C(t-mod((f-1)/96,95)*p));
        tM = tM / max(tM) * p;
        % shift the compressed t
        tS = [I+1:N,1:I];
        tSh = tM(tS);
        % interpolate x, y, and z using the compressed, shifted t values
        Q = @(a) interp1(t,a(tS),tSh,'pchip');
        xC = Q(x); yC = Q(y); zC = Q(z);

        %% create the tube and the spiral

        % anonymous func to set last column equal to first column
        W = @(a) a(:,[1:N-1,1]);
        % get trefoil tube surface (X,Y,Z) and spiral path (u,v,w) coordinates
        [X,Y,Z,u,v,w] = ST(xC,yC,zC,R);
        % match spiral endpoints
        u = W(u); v = W(v); w = W(w);
        % create another tube that follows the spiral path
        [X,Y,Z,~,~,~] = ST(u,v,w,.1);
        % match endpoints
        X = W(X); Y = W(Y); Z = W(Z);
        % reorder the circle points to correct overtwisting
        % -> for each circle, i, rotate circle i+1 until distance between
        %    points minimized
        for i = 1:N-1
            j = i+1;
            [~,l] = min(sqrt((X(:,j)-X(1,i)).^2+(Y(:,j)-Y(1,i)).^2+(Z(:,j)-Z(1,i)).^2));
            k = [l:n,1:l-1];
            X(:,j) = X(k,j); Y(:,j) = Y(k,j); Z(:,j) = Z(k,j);
        end

        % sometimes need the swap below if the spiral tube radius is very small
        % X(:,1) = X(:,end);
        % Y(:,1) = Y(:,end);
        % Z(:,1) = Z(:,end);
        % make sure the last point of each circle is identical to the first point
        X(n,:) = X(1,:);
        Y(n,:) = Y(1,:);
        Z(n,:) = Z(1,:);

        %% update surface
        
        % update tube surface coordinates
        set(H,D{1},X,D{2},Y,D{3},Z,D{4},repmat(L(0,1,N),n,1));
        % shift the colormap to move colors along the spiral
        M = hsv;
        Ci = round((f/96)*256);
        colormap(M([Ci+1:end,1:Ci],:));

        drawnow
        
        function [TX,TY,TZ,SX,SY,SZ] = ST(PX,PY,PZ,CR)
        % returns surface coordinates for a tube (TX, TY, & TZ) traveling along the path 
        % defined by PX, PY, and PZ. Also returns coordinates for the path of a
        % spiral (SX, SY, & SZ) traveling along the outside of the tube.
        
            c = @cross;
            g = @norm;
            d = @diff;

            % points along the path
            P = [PX',PY',PZ'];
        
            % cell array of normalized tangent vectors at each point along the path
            tN = F(@(a) a/g(a),MC([d(P([1:N,1],1)) d(P([1:N,2],2)) d(P([1:N,3],3))],ones(N,1),3),U,0);
        
            % find two vectors normal to each tangent to form a basis for each circle
            N1 = F(@(a) c(a,[1 0 0]),tN,U,0);
            N1 = F(@(a) a/g(a),N1,U,0);
            N2 = F(@(a,b) c(a,b),tN,N1,U,0);
        
            % generate circle points around each point on the path
            T = L(0, p, n);
            % coordinates for each circle
            cPt = F(@(a,b) CR*(a'*C(T)+b'*S(T))',N1,N2,U,0);
            % make sure the endpoints exactly match
            cPt = F(@(a) a([1:end-1,1],:),cPt,U,0);
        
            % cell array of tube surface points
            K = F(@(a,b) a+b,MC(P,ones(N,1),3),cPt,U,0);
        
            % matrices of tube surface points
            TX = CM(F(@(a) a(:,1),K,U,0)');
            TY = CM(F(@(a) a(:,2),K,U,0)');
            TZ = CM(F(@(a) a(:,3),K,U,0)');
        
            % spiral angles
            A = p * nT * (1:N) / (N-1);
            % spiral points
            SP = CM(F(@(a,b,i) [P(i,1)+CR*C(A(i))*a(1)+CR*S(A(i))*b(1);P(i,2)+CR*C(A(i))*a(2)+CR*S(A(i))*b(2);P(i,3)+CR*C(A(i))*a(3)+CR*S(A(i))*b(3)],N1',N2',arrayfun(@(i) i,1:N,U,0),U,0));
            SX = SP(1,:);
            SY = SP(2,:);
            SZ = SP(3,:);
        
        end

    end