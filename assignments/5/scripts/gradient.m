function g_x = gradient(x)
    format compact
    format long
    a = x(1);
    b = x(2);
    m = 6*a + 8.5*a*b^2 - 4*a*b + 3*b + b^4 + 4.5*b^2 + b^6 - 4*a*b^3;
    n = 8.5*a^2*b + 3*a - 2*a^2 + 4*a*b^3 + 9*a*b + 6*a*b^5 - 6*a^2*b^2;
    g_x = [m; n];
%     disp(g_x);
end

