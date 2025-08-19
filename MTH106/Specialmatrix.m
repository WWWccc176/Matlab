function [A]= Specialmatrix(n)
A = ones(n);
    for r = 1:n
        for c = 1:n
            if (r>1)&&(c>1)
                s=A(r-1,c)+A(r,c-1);
                if s<30
                A(r,c)=s;
                else
                A(r,c)=A(r-1,c)-A(r,c-1);
                end
            end
        end
    end
end
