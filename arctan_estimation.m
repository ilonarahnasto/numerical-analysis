
ind = linspace(0,2,100);
v = linspace(0,2,100);
v_r = linspace(0,2,100);

for i=1:100
    v(i) = arctan(ind(i));
    v_r(i) = atan(ind(i));
end

% absolute and relative errors for numerical arctan evaluation
err_abs = abs(v - v_r);
err_rel = abs(v - v_r)./v_r;

mean(err_abs)
nanmean(err_rel)

% evaluates arctan numerically in radians
function arc = arctan(x)
    if (x >= 0) && (x <= 1.7*10^(-9))
        arc = x;
    elseif (x > 1.7*10^(-9)) && (x <= 2*10^(-2))
        arc = x - x^3/3 + x^5/5 - x^7/7;
    else
        if (x >= 0) && (x <= 1)
            y = x;
            a = 0;
            b = 1;
        elseif (x > 1)
            y = 1/x;
            a = pi/2;
            b = 1;
        end
        if (y >= 0) && (y <= sqrt(2) -1)
            c = pi/16;
            d = tan(c);
        elseif (y > sqrt(2) -1) && (y <= 1)
            c = 3*pi/16;
            d = tan(c);
        end
        u = (y-d)/(1+d*y)
        arct_u = u*(135135 + 171962.46*u^2 + 52490.4832*u^4 + 2218.1*u^6)/(135135 + 217007.46*u^2 + 97799.3033*u^4 + 10721.3745*u^6)
        arc = a + b * (c + arct_u)
    end
end