clear
fun =@(t,y) (t-y)*t/2;
tmax = 0.2; 
initial_value = 1; 
h = 0.01; 
time_interval = [0, 0.2];
[t,y] = NumericSolver(fun,time_interval,initial_value,h);
y(end)