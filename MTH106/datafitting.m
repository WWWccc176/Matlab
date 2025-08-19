function coefficients=datafitting(x,y)
coefficients = [x.^3 x.^2 x ones(length(x),1)]\y
end
