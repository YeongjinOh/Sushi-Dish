% sortSegments sorts segments in descending order of number of points each segment has.
function sortedSegments = sortSegments(Segments)

%% Initialize
NumberOfEdges = length(Segments);
sortedSegments = cell(1, NumberOfEdges);
IndexOfEdge = 1:NumberOfEdges;

NumberOfPoints = zeros(NumberOfEdges);    % Number of points in i-th edge
for i = 1:NumberOfEdges
    NumberOfPoints(i) = size(Segments{i},1);
end

%% Sort segments in descending order of number of points each segment has.

% Sort for index
for i = 2:NumberOfEdges
    j = i;
    while j >= 2 && NumberOfPoints(j-1) < NumberOfPoints(j)
        % Swap
        NumberOfPoints([j-1 j]) = NumberOfPoints([j j-1]);
        IndexOfEdge([j-1 j]) = IndexOfEdge([j j-1]);
        j = j-1;        
    end
end

% Rebuild the output using sorted index
for i=1:NumberOfEdges
    sortedSegments(i) = Segments(IndexOfEdge(i));    
end

end

