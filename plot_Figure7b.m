clear
clc
clear  %%%%%%%%%%%%   Eigenvalue distribution text
clc
Du=0.1;
Dv=0.5;
fu=1;
fv=-1;
gu=2;
gv=-1.5;
trJ=fu+gv;
detJ=fu*gv-fv*gu;
data=zeros(100,100);

for i=1:100
    gamaR=-5+i*0.1;
  for j=1:100
    gamaI=-5+j*0.1;
    TJR=trJ+(Du+Dv)*gamaR;
    TJI=(Du+Dv)*gamaI;
    DJR=detJ+(fu*Dv+Du*gv)*gamaR+Du*Dv*(gamaR^2-gamaI^2);
    DJI=(fu*Dv+Du*gv)*gamaI+2*Du*Dv*gamaR*gamaI;
    
    A=TJR^2-TJI^2-4*DJR;
    B=2*TJR*TJI-4*DJI;
    r=sqrt((A+sqrt(A^2+B^2))/2);
    
    LambdaR=TJR+r;
    
    data(i,j)=LambdaR;

  end
end

%%%%%
for i=1:100
  for j=1:100
   if (data(i,j)>=0)
       data(i,j)=0;
   else
       data(i,j)=1.0;
   end
  end
end
%%%%%%%%%%%%%%%%


LR=[-4.9:0.1:5];
LI=[-4.9:0.1:5];
clims = [-3 2];
imagesc(LR,LI,data',clims)
set(gca,'YDir','normal')
% view(-90,90)
colormap hot
colorbar
hold on
%%%%%%%%%%%%%%%%%%%%%%
syms x;
syms y;
f=-0.288*x^4-0.128*x^2*y^2-1.536*x^3-0.896*x*y^2+3.84*y^2+0.28*x^2+3.4*x-2;
h=ezplot(f,[-2.011,0.832,-1,1]);
set( h,'Linestyle','-', 'color', 'r', 'Linewidth',2)

%%%%%%%%%%%%%%%%%%%%%%%%
% xlim([-8.5,300])
% ylim([-5,3])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('Re(\Lambda_{\alpha})','Fontname', 'Times New Roman','FontSize',20);
ylabel('Im(\Lambda_{\alpha})','Fontname', 'Times New Roman','FontSize',20);