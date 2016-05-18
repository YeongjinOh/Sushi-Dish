% checkEdgeinSameGroup check if e2 belongs to the same group with e1.
% It check associated convexity of two edges and check if e2 belongs
% to the search region of e1.
function bool = checkEdgeInSameGroup(e1, e2)
    bool = checkAssociatedConvexity(e1, e2) && checkSearchRegion(e1, e2);% && checkSearchRegion(e2, e1);
end


%% checkAssociatedConvexity check if an associated convexity looks
% reasonalbe to consider them as one ellipse.
function bool = checkAssociatedConvexity(e1, e2)

%% Initialize 
mid_idx1 = ceil(length(e1)/2);
mid_idx2 = ceil(length(e2)/2);
p1_mid = e1(mid_idx1,:);
p2_mid = e2(mid_idx2,:);

% p1_mid and p2_mid should be located in different area
b1 = ~checkSameArea(e1(1,:), e1(end,:), p1_mid, p2_mid);
b2 = ~checkSameArea(e2(1,:), e2(end,:), p2_mid, p1_mid);
bool = b1&b2;
end


%% checkSearchRegion check if e2 belongs to the search region of e1
function bool = checkSearchRegion(e1, e2)

%% Initialize
p1 = e1(1,:);
p2 = e1(2,:);
pn_1 = e1(end-1,:);
pn = e1(end,:);
mid_idx1 = ceil(length(e1)/2);
p_mid = e1(mid_idx1,:);

%% Check if e2 is inside of the search region.
bool = true;
for i= 1:length(e2)
    % Check l1
    b1 = checkSameArea(p1, p2, pn, e2(i,:));
    % Check l2
    b2 = checkSameArea(pn, pn_1, p1, e2(i,:));
    % Check l3
    b3 = ~checkSameArea(p1, pn, p_mid, e2(i,:));

    % If this points don't satisfy all conditions.
    if ~ (b1 && b2 && b3)
        bool = false;
        break;
    end
end
end

%% checkSameArea check if two points(p_in, p_out) are in the same area
% among two areas devided by a straight line passing through p1 and p2.
function bool = checkSameArea (p1, p2, p_in, p_out)
line_vector = p1-p2;
v_in = p_in - p2;
v_out = p_out - p2;
bool = (sign(calcAngleBetweenTwoVectors2D(line_vector,v_in) * calcAngleBetweenTwoVectors2D(line_vector,v_out)) >= 0);
end
