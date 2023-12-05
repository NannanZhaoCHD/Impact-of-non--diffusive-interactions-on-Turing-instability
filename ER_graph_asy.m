function adj = ER_graph_asy(n,p,sigma)

adj=zeros(n); % initialize adjacency matrix
% just the number of nodes, n
%sigma is the normal distribution' std
for i=1:n
    for j=1:n
         if rand<=p    
               adj(i,j)=randn*sigma; 
         end
    end
end

for k=1:n
    adj(k,k)=0; 
end
end  % end nargin options