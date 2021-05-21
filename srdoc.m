%% Smooth functions
% We derive here the smooth functions for step and ramp
%
% Let us limit the n-th derivative, i.e. (n-1)-th derivative is smooth.
% Then the polynomial will take a form
% 
% $$p(x) = \sum_{k=1}^{n}a_k\frac{x^{n-1+k}}{(n-1+k)!}, \qquad
%   p^{(m)}(x) = \sum_{k=1}^{n}a_k\frac{x^{n-1+k-m}}{(n-1+k-m)!}
%   \quad\mathrm{for}\quad 0\leq m \leq n-1$$
%
% Then $p^{(m)}(0) = 0$ for $0\leq m \leq n-1$. At $x=1$ we get
%
% $$p^{(m)}(1) = \sum_{k=1}^{n}a_k\frac{1}{(n-1+k-m)!} = 0 
%   \quad\mathrm{for}\quad 1\leq m \leq n-1$$
% 
% so that $p^{(1\leq m \leq n-1)}(1) = 0$ and $p(1)=1$.

n = 3;
k = 1:n;
A = 1./factorial(n+k-k.');
y = zeros(n,1);
y(1) = 1;
a = [flip((A\y).'./factorial(n-1+k)) zeros(1,n)];
disp(a)

%%
% The plot is

t = linspace(.15, .85, 150);
y = fcn(t, .3, .6, .15, .85, false, a);
dy = gradient(y)./diff(t(1:2));
d2y = gradient(dy)./diff(t(1:2));
%d3y = gradient(d2y)./diff(t(1:2));
plot(t, y, 'x', t, dy./(2*n), '+', t, d2y./(2*n)^2, 'o')%, t, d3y, '.')
snapnow
%% Ramp
% So for the ramp we get
%
% $$p(x) = \sum_{k=1}^{n-1}a_k\frac{x^{n-1+k}}{(n-1+k)!}, \qquad
%   p^{(m)}(x) = \sum_{k=1}^{n-1}a_k\frac{x^{n-1+k-m}}{(n-1+k-m)!}
%   \quad\mathrm{for}\quad 1\leq m \leq n-1$$
%
% Same as before $p^{(m)}(0) = 0$ for $0\leq m \leq n-1$. At $x=1$ we get
%
% $$p^{(m)}(1) = \sum_{k=1}^{n-1}a_k\frac{1}{(n-1+k-m)!} = 0 
%   \quad\mathrm{for}\quad 1\leq m \leq n-1$$
% 
% so that $p^{(2\leq m \leq n-1)}(1) = 0$ and $p^{(1)}(1)=1$. The vaule 
% $p(1)$ can be any.

n = 3;
k = 1:(n-1);
A = 1./factorial(n-1+k-k.');
y = zeros(n-1,1);
y(1) = 1;
a = [flip((A\y).'./factorial(n-1+k)) zeros(1,n)];
disp(a)

%%
% The plot is


% t = linspace(0,1);
% y = polyval(a,t);
% dy = gradient(y)./diff(t(1:2));
% plot(t, y, 'x', t, dy,'+')

t = linspace(.15, .85, 150);
y = fcn(t, .3, .6, .15, 1.2, true, a);
dy = gradient(y)./diff(t(1:2));
%d2y = gradient(dy)./diff(t(1:2));
%d3y = gradient(d2y)./diff(t(1:2));
plot(t, y, 'x', t, dy./(2*n), '+')%, t, d2y./(2*n)^2, 'o')%, t, d3y, '.')
snapnow
%%
function value = fcn(time, startTime, endTime, startValue, endValue, rampType, coeff)
    
if rampType
    value = startValue + ...
            endValue .*  (endTime-startTime).* ...
            arrayfun(@(t) scalarramp(t, endTime-startTime, coeff), ...
                                time-startTime );
else
    value = startValue + ...
            endValue .* ...
            arrayfun(@(t) scalarstep(t, endTime-startTime, coeff), ...
                                time-startTime );
end
end

function y = scalarstep(t, dt, a)
    if t>= dt
        y = 1;
    elseif t <= 0
        y = 0;
    else
        y =  polyval(a, t/dt);
    end
end

function y = scalarramp(t, dt, a)
    if t>= dt
        y = t-dt + dt.*polyval(a, 1);
    elseif t <= 0
        y = 0;
    else
        y = dt.*polyval(a, t/dt);
    end
end
