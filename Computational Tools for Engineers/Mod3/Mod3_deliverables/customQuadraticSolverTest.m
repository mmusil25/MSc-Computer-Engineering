function tests = customQuadraticSolverTest
tests = functiontests(localfunctions);
end

function testImaginarySolution(testCase)
a = 1; b = 1; c = 1;
fprintf('(A) Imaginary Test case  a = %4.2f, b = %4.2f, c = %4.2f\n',a,b,c)
actSolution = customQuadraticSolver(a,b,c);
expSolution = [-1+3i -1-3i];
verifyEqual(testCase,actSolution,expSolution)
end

function testRealSolutions(testCase)
a = 2; b = 4; c = 2;
fprintf('(B) Real test case 1 a = %4.2f, b = %4.2f, c = %4.2f \n',a,b,c)
actSolution = customQuadraticSolver(a,b,c);
expSolution = [2 1];
verifyEqual(testCase,actSolution,expSolution)

a = 2; b = 2; c = -12;
fprintf('(C) Real test case 2 a = %4.2f, b = %4.2f, c = %4.2f \n',a,b,c)
actSolution = customQuadraticSolver(a,b,c);
expSolution = [2 1];
verifyEqual(testCase,actSolution,expSolution)
end
