% Extract center of ellipse by solving non-homogeneous linear equation
% ay^2 + bx + cy + d = -x^2 using least square.
function center = extractEllipseCenter(e)

%% Check if e is longer than 3.
if length(e) < 4
    error('Error. e should be longer than 3.')
end

%% Initialize 
center = zeros(1,2);
NumberOfPoints = length(e);
A = zeros(NumberOfPoints,4);
B = zeros(NumberOfPoints,1);
for i = 1:NumberOfPoints
    xi = e(i,2); yi = e(i,1);
    A(i,:) = [yi*yi xi yi 1];
    B(i) = -xi*xi;
end
v=A\B;
center(1) = -v(3)/(2*v(1));     % y-coordinate of center = -c/(2a)
center(2) = -v(2)/2;            % x-coordinate of center = -b/2

end


    
