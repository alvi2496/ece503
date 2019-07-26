function h_x = hessian(x)
    format compact
    format long
    a = x(1);
    b = x(2);
    m = 6 + 8.5*b^2 - 4*b - 4*b^3;
    n = 17*a*b - 4*a + 3 + 4*b^3 + 9*b + 6*b^5 - 12*a*b^2;
    o = 8.5*a^2 + 12*a*b^2 + 9*a + 30*a*b^4 - 12*a^2*b;
    h_x = [m o; o n];
%     disp(h_x);
end

