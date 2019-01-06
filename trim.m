% Trim (-pi,pi)
function y = trim(x)
for j=1:length(x)
    if x(j)>0 
        x(j) = mod((x(j)+pi),(2*pi))-pi;           
    else 
        if mod(x(j),2*pi) > pi 
            x(j) = mod(x(j),(2*pi))-2*pi;
        else
            x(j) = mod(x(j),(2*pi));
        end
    end
end
y = x;
end