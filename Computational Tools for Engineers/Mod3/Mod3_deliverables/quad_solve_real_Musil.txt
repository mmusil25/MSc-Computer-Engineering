%  EE 5003
%  Mark Musil
%  January 29
%
%  Solve for real roots of monomials

function [root1, root2] = customQuadraticSolver(a,b,c)
%QUADRATICESOLVER find roots of three term quadratic equation. 
root1 = 0;
root2 = 0;
if a == 0
    if b == 0
        if c == 0
            fprintf('Solution Indeterminate\n')
        else
            fprintf('There is no solution\n')
        end
    else
        x = -c/b;
        root1 = x; root2 = x;
        fprintf(" There is only one root and it is %4.2f \n", x);
    end
elseif(b^2 < 4*a*c)
    fprintf('complex roots \n')
   root1 = (-b + sqrt((b^2) - (4*a*c)))/(2*a);
   root2 = (-b - sqrt((b^2) - (4*a*c)))/(2*a);
    fprintf('The roots are %f+%fj and %f+%fj \n', real(root1), imag(root1), real(root2), imag(root2));
elseif(b^2 == 4*a*c)
    x = -b/(2*a);
    root1 = x; root2 = x;
    fprintf('Equal roots of %4.2f \n', x)
else
   root1 = (-b + sqrt((b^2) - (4*a*c)))/(2*a);
   root2 = (-b - sqrt((b^2) - (4*a*c)))/(2*a);
   fprintf('The roots are %4.2f and %4.2f \n', root1, root2);
    
end
end

