function adj = ER_graph_sy(n,p,sigma)

adj=zeros(n); % initialize adjacency matrix
% just the number of nodes, n
%sigma is the normal distribution std
for i=1:n
    for j=i+1:n
         if rand<=p    
               adj(i,j)=randn*sigma; 
               adj(j,i)=adj(i,j);
         end
    end
end
  
end  % end nargin options