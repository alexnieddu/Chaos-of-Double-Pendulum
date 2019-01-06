% ODE System of double pendulum y' = f(t,y)
function x_ = dpend(t, x, m, l)

g = 9.81;

phi1   = x(1) ;
phi2   = x(2) ;
omega1 = x(3) ;
omega2 = x(4) ;

s = sin(phi1-phi2) ;

a11 = l(1)^2 * (m(1) + m(2));
a12 = m(2) * l(2) * l(1) * cos(phi1 - phi2);
a22 = m(2)*l(2)^2;
b1  = -omega2^2*m(2)*l(1)*l(2)*s - ( m(1)+m(2) )*g*l(1)*sin(phi1);
b2  = omega1^2*m(2)*l(1)*l(2)*s - m(2)*g*l(2)*sin(phi2);

detA = a11 * a22 - a12^2 ;

x_(1)   = omega1 ;
x_(2)   = omega2 ;
x_(3) = (b1 * a22 - b2 * a12)/detA;
x_(4) = (b2 * a11 - b1 * a12)/detA;

x_ = x_';
end