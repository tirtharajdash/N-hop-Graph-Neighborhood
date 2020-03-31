%% display the neighborhood
% Inputs:  number of locations (N), nbd (a neighborhood set)
% Outputs: None. Prints the neighbors for each location
function displayNeighbors(N,nbd)
fprintf('Vertex\t Neighbors\n');
for i=1:N
    fprintf('%d\t',i);
    for j=1:length(nbd{i})
        fprintf('%d ',nbd{i}(j));
    end
    fprintf('\n');
end
