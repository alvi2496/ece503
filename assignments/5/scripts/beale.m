function f_x = beale(x)
    format compact
    format long
    a = x(1);
    b = x(2);
    f_x = 3*(a^2) - 4.25*(a^2)*(b^2) - 2*(a^2)*b + 3*a*b + a*(b^4) + 4.5*a*(b^2) + a*(b^6) - 2*(a^2)*(b^3) + 14.2125;
%     disp(f_x);
end

