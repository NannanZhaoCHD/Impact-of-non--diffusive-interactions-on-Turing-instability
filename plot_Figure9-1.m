clear
clc
subplot(3,1,1)
%%%%%%%%%%%%%%%%%%%%%%理论界
syms x;
syms y;
f=-0.288*x^4-0.128*x^2*y^2-1.536*x^3-0.896*x*y^2+3.84*y^2+0.28*x^2+3.4*x-2;
h=ezplot(f,[-2.011,0.832,-1,1]);
hold on
set( h,'Linestyle','-', 'color', 'r', 'Linewidth',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma=0.1;
n=100;
p=0.1;
A = ER_graph_asy(n,p,sigma);
tzz=eig(A);
plot(real(tzz),imag(tzz),'c.','MarkerSize',12);
hold on
r=sigma*sqrt(n*p); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(xp,yp,'c','linewidth',2);
hold on
xlim([-2.2,1.2])
ylim([-1.2,1.2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('Im(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
xlabel('Re(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2)
%%%%%%%%%%%%%%%%%%%%%%理论界
syms x;
syms y;
f=-0.288*x^4-0.128*x^2*y^2-1.536*x^3-0.896*x*y^2+3.84*y^2+0.28*x^2+3.4*x-2;
h=ezplot(f,[-2.011,0.832,-1,1]);
hold on
set( h,'Linestyle','-', 'color', 'r', 'Linewidth',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma=0.1;
n=100;
p=0.5;
A = ER_graph_asy(n,p,sigma);
tzz=eig(A);
plot(real(tzz),imag(tzz),'c.','MarkerSize',12);
hold on
r=sigma*sqrt(n*p); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(xp,yp,'c','linewidth',2);
hold on
xlim([-2.2,1.2])
ylim([-1.2,1.2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('Im(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
xlabel('Re(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3)
%%%%%%%%%%%%%%%%%%%%%%理论界
syms x;
syms y;
f=-0.288*x^4-0.128*x^2*y^2-1.536*x^3-0.896*x*y^2+3.84*y^2+0.28*x^2+3.4*x-2;
h=ezplot(f,[-2.011,0.832,-1,1]);
hold on
set( h,'Linestyle','-', 'color', 'r', 'Linewidth',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma=0.1;
n=100;
p=0.9;
A = ER_graph_asy(n,p,sigma);
tzz=eig(A);
plot(real(tzz),imag(tzz),'c.','MarkerSize',12);
hold on
r=sigma*sqrt(n*p); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(xp,yp,'c','linewidth',2);
hold on
xlim([-2.2,1.2])
ylim([-1.2,1.2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('Im(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
xlabel('Re(\Lambda)','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%