clear  %%%%%%%%%%%%   Eigenvalue distribution test n£¬p£¬sigma
clc
% subplot(1,3,1)
n=100;
p=0.1;
%%%%%%%%%%%%%%%
sigma=0.01;
A = ER_graph_sy(n,p,sigma);
tzz=eig(A);
plot(tzz,sigma*ones(1,n),'c.','MarkerSize',10);
hold on
%%%%%%%%%%%%%%%
sigma=0.1;
A = ER_graph_sy(n,p,sigma);
tzz=eig(A);
plot(tzz,sigma*ones(1,n),'r.','MarkerSize',10);
hold on
%%%%%%%%%%%%%%%
sigma=1;
A = ER_graph_sy(n,p,sigma);
tzz=eig(A);
plot(tzz,sigma*ones(1,n),'g.','MarkerSize',10);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigmaa=0.001:0.001:1.0;
r1=-2*sigmaa*sqrt(n*p); 
r2=2*sigmaa*sqrt(n*p); 
plot(r1,sigmaa,'k:','linewidth',3);
hold on
plot(r2,sigmaa,'b:','linewidth',3);
hold on

% plot(xlim,[0,0],'b:','linewidth',1);
% hold on
% plot([0,0],ylim,'b:','linewidth',1);
% hold on

xlim([-7,7])
ylim([0,1.2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('\sigma','Fontname', 'Times New Roman','FontSize',20);
xlabel('\Lambda','Fontname', 'Times New Roman','FontSize',20);