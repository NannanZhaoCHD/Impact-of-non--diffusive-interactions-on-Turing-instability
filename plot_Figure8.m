clear  %%%%%%%%%%%%   Eigenvalue distribution test n£¬p£¬sigma
clc
n=100;
p=0.1;
%%%%%%%%%%%%%%%
sigma=1;
A = ER_graph_asy(n,p,sigma);
tzz=eig(A);
plot(real(tzz),imag(tzz),'c.','MarkerSize',12);
hold on
r=sigma*sqrt(n*p); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(xp,yp,'c--','linewidth',2);
hold on
%%%%%%%%%%%%%%%
sigma=0.5;
A = ER_graph_asy(n,p,sigma);
tzz=eig(A);
plot(real(tzz),imag(tzz),'r.','MarkerSize',12);
hold on
r=sigma*sqrt(n*p); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(xp,yp,'r--','linewidth',2);
hold on
%%%%%%%%%%%%%%%
sigma=0.1;
A = ER_graph_asy(n,p,sigma);
tzz=eig(A);
plot(real(tzz),imag(tzz),'g.','MarkerSize',12);
hold on
r=sigma*sqrt(n*p); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(xp,yp,'g--','linewidth',2);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%


% plot(xlim,[0,0],'b:','linewidth',1);
% hold on
% plot([0,0],ylim,'b:','linewidth',1);
% hold on

xlim([-4,4])
ylim([-4,4])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('Im(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
xlabel('Re(\Lambda)','Fontname', 'Times New Roman','FontSize',20);