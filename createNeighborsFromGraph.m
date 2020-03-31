%% Construct neighborhood from a Graph G=(V,E)
% Inputs: filename (format: [vertex1 vertex2 dist])
%       : nbdsize (neighborsize: positive integer)
% Outputs: nbd (neighborhood; contains neighbors for each vertex)
function nbd = createNeighborsFromGraph(filename,nbdsize)

%load the file here to a variable
D = load(filename);

%proporties of the file (row,col)
[r,~] = size(D);

%number of boxes (clauses)
N = length(unique(D));

%check for invalid argument
if nbdsize < 1
    fprintf('Error: nbdsize should be >= 1.')
    return
end

%create a base case of the recursion (nbdsize=1)
if nbdsize == 1
    for i=1:N
        nbd{i} = [];
    end
    for i=1:r
        nbd{D(i,1)} = [nbd{D(i,1)} D(i,2)];
        %comment out this statement if your input graph is directed
        nbd{D(i,2)} = [nbd{D(i,2)} D(i,1)];
    end
else
    %create a recursion for higher neighborhood formation
    nbd = createNeighborsFromGraph(filename,nbdsize-1);
    nbd1 = createNeighborsFromGraph(filename,1);
    temp_nbd = nbd;
    for i=1:N
        for j=1:length(nbd{i})
            temp_nbd{i} = [temp_nbd{i} nbd1{nbd{i}(j)}];
        end
        temp_nbd{i} = setdiff(temp_nbd{i},i);
    end
    nbd = temp_nbd;
end

%print neighbors
%displayNeighbors(N,nbd)