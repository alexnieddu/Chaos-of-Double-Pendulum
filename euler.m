% Euler Method (Runge Kutta 1. Order)
function [ t, y ] = euler ( f, tRange, x0, h )
t(1) = tRange(1);
numSteps = ( tRange(2) - tRange(1) ) / h;
y(:,1) = x0;
for k = 1 : numSteps
    t(1,k+1) = t(1,k) + h;
    y(:,k+1) = y(:,k) + h * f( t(k), y(:,k) );
end
t = t';
y = y';