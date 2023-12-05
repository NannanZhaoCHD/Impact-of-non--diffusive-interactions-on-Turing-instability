clear
clc
lambda=zeros(800,1);
lambda1=zeros(100,1);
lambda2=zeros(100,1);
lambda3=zeros(100,1);
for i=1:800
gama=-5+i*0.01;
TrJ=0.6*gama-0.5;
DJ=0.35*gama+0.05*gama^2+0.5;
lambda(i)=(TrJ+sqrt(TrJ^2-4*DJ))/2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1)
plot(-4.99:0.01:3,lambda(:,1),'k--','linewidth',2);
hold on
plot(xlim,[0,0],'r:','linewidth',1);
hold on
xlim([-4.9,3.1])
ylim([-0.6,1])
p=0.1;
sigma=0.1;
n=100;
A = ER_graph_sy(n,p,sigma);
Ga=eig(A);
for i=1:100
gama=Ga(i);
TrJ=0.6*gama-0.5;
DJ=0.35*gama+0.05*gama^2+0.5;
lambda1(i)=(TrJ+sqrt(TrJ^2-4*DJ))/2;
end
plot(Ga,lambda1,'m.','MarkerSize',15);
hold on
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('\Lambda_{\alpha}','Fontname', 'Times New Roman','FontSize',20);
ylabel('Re(\lambda_{\alpha})','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2)
plot(-4.99:0.01:3,lambda(:,1),'k--','linewidth',2);
hold on
plot(xlim,[0,0],'r:','linewidth',1);
hold on
xlim([-4.9,3.1])
ylim([-0.6,1])
p=0.5;
sigma=0.1;
n=100;
A = ER_graph_sy(n,p,sigma);
Ga=eig(A);
for i=1:100
gama=Ga(i);
TrJ=0.6*gama-0.5;
DJ=0.35*gama+0.05*gama^2+0.5;
lambda1(i)=(TrJ+sqrt(TrJ^2-4*DJ))/2;
end
plot(Ga,lambda1,'m.','MarkerSize',15);
hold on
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('\Lambda_{\alpha}','Fontname', 'Times New Roman','FontSize',20);
ylabel('Re(\lambda_{\alpha})','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3)
plot(-4.99:0.01:3,lambda(:,1),'k--','linewidth',2);
hold on
plot(xlim,[0,0],'r:','linewidth',1);
hold on
xlim([-4.9,3.1])
ylim([-0.6,1])
p=0.9;
sigma=0.1;
n=100;
A = ER_graph_sy(n,p,sigma);
Ga=eig(A);
for i=1:100
gama=Ga(i);
TrJ=0.6*gama-0.5;
DJ=0.35*gama+0.05*gama^2+0.5;
lambda1(i)=(TrJ+sqrt(TrJ^2-4*DJ))/2;
end
plot(Ga,lambda1,'m.','MarkerSize',15);
hold on
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('\Lambda_{\alpha}','Fontname', 'Times New Roman','FontSize',20);
ylabel('Re(\lambda_{\alpha})','Fontname', 'Times New Roman','FontSize',20);

