!!!!!!!!!!!!!!!!!!!!!!!!!!!!FHN模型在对称矩阵下的MLE
program FHN_MLE
implicit none
    integer,parameter :: tran=100000,n=100,nn=200
    double precision :: dr1(nn),di1(nn),dr2(nn),di2(nn),dr3(nn),di3(nn),dr4(nn),di4(nn),tr(nn),ti(nn)
    double precision :: x(nn),y(nn),x0(nn),y0(nn),t,h=0.01d0
    integer :: i,ii,jj,k,kk
    real*8::t1,t2,c(n,n),p
    real*8:: lbound=-1.0d0,ubound=1.0d0
    real*8, external:: my_random
    real ZNORM,CUM,LEXP
    
    
    open(unit=111,file='p.txt')
    call cpu_time(t1)
    
do kk=1,100
     p=0.01*kk
     print*,p
       CUM=0.0
    call network_twodem(n,c,p)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!初值   
    do i=1,n
      call random_seed()
      x(i)=my_random(lbound,ubound)
      y(i)=my_random(lbound,ubound)
    enddo
    
    do i=1+n,nn
      call random_seed()
      x(i)=1.0
      y(i)=1.0
    enddo
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!龙格库塔法求解  
do jj=1,tran
      t=0.0d0+jj*h
     !print*,t
   do i=1,nn      
       x0(i)=x(i)
       y0(i)=y(i)
   enddo 
   call fcn(dr1,di1,n,c,p,x,y)
   do i=1,nn      
       tr(i)=x(i)+0.5d0*h*dr1(i)
       ti(i)=y(i)+0.5d0*h*di1(i)
   enddo  
   call fcn(dr2,di2,n,c,p,tr,ti)
   do i=1,nn      
       tr(i)=x(i)+0.5d0*h*dr2(i)
       ti(i)=y(i)+0.5d0*h*di2(i)
   enddo 
   call fcn(dr3,di3,n,c,p,tr,ti)
   do i=1,nn      
       tr(i)=x(i)+h*dr3(i)
       ti(i)=y(i)+h*di3(i)
   enddo
   call fcn(dr4,di4,n,c,p,tr,ti)

   do i=1,nn      
       x(i)=x0(i)+h*(dr1(i)/6.0d0+dr2(i)/3.0d0+dr3(i)/3.0d0+dr4(i)/6.0d0)
       y(i)=y0(i)+h*(di1(i)/6.0d0+di2(i)/3.0d0+di3(i)/3.0d0+di4(i)/6.0d0)
   enddo
   
   ZNORM=0.0
   do k=n+1,nn
      ZNORM=ZNORM+x(k)**2+y(k)**2
  enddo
      ZNORM=sqrt(ZNORM)
   do k=n+1,nn
      x(k)=x(k)/ZNORM
      y(k)=y(k)/ZNORM
   enddo
      CUM = CUM+alog(ZNORM)/alog(2.0)
enddo
     LEXP= CUM/1000.0
     write(111,"(2(F8.3))") p,LEXP
     !print*,LEXP
enddo

call cpu_time(t2)
write(*,*)"cpu time:", t2-t1
    
end program FHN_MLE


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 耦合方程
subroutine fcn(dr,di,n,c,p,x,y)
implicit none
integer :: n,i,j
integer,parameter :: nn=200
real*8::c(n,n),p
double precision :: x(nn),y(nn),dr(nn),di(nn)  
!!!!!! single model
do i=1,n
    dr(i)=x(i)-(x(i)**3)/3.0-y(i)
    di(i)=2*x(i)-1.5*y(i)
enddo
!!!!!! coupling term
do i=1,n
  do j=1,n
     dr(i)=dr(i)+0.1*c(i,j)*x(j)
     di(i)=di(i)+0.5*c(i,j)*y(j)
  enddo
enddo

do i=1+n,nn
    dr(i)=x(i)-(x(i-n)**2)*x(i)-y(i)
    di(i)=2*x(i)-1.5*y(i)
enddo
!!!!!! coupling term
do i=1+n,nn
  do j=1+n,nn
     dr(i)=dr(i)+0.1*c(i-n,j-n)*x(j)
     di(i)=di(i)+0.5*c(i-n,j-n)*y(j)
  enddo
enddo

return
    end subroutine
    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 对称ER网络结构，每个元素服从正态分布
!subroutine network_twodem(n,c,p)
!implicit none
!integer n,i,j
!real*8::c(n,n)
!real*8::x,pp,p
!real*8, parameter::sigma=0.1
!    do i=1,n
!        do j=1,n
!            c(i,j)=0.0
!        enddo 
!    enddo 
!      
!    do i=1,n
!        do j=i+1,n
!            call random_number(pp)    
!            if (pp<p) then
!            call random_stdnormal(x)   
!            c(i,j)=sigma*x
!            c(j,i)=c(i,j)
!            endif          
!        enddo 
!    enddo
!  return
!end subroutine 
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 非对称ER网络结构，每个元素服从正态分布
subroutine network_twodem(n,c,p)
implicit none
integer n,i,j
real*8::c(n,n)
real*8::x,pp,p
real*8, parameter::sigma=0.1
    do i=1,n
        do j=1,n
            c(i,j)=0.0
        enddo 
    enddo 
      
    do i=1,n
        do j=1,n
            call random_number(pp)    
            if (pp<p) then
            call random_stdnormal(x)   
            c(i,j)=sigma*x
            endif          
        enddo 
    enddo
    
    do i=1,n !!!!!!!!!!!!!!对角元素为0
            c(i,i)=0.0
    enddo 
    
  return
end subroutine     
     
    
subroutine random_stdnormal(x)
   implicit none
   real,parameter :: pi=3.14159265
   real*8:: u1,u2,x
   call random_number(u1)
   call random_number(u2)
   x = sqrt(-2*log(u1))*cos(2*pi*u2)
   return
end subroutine
       
   
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!产生任意区间上的随机数
function my_random (lbound,ubound)
implicit none
real*8:: lbound,ubound
real*8:: len
real*8:: my_random
real*8:: t

len=ubound-lbound
call random_number(t)
my_random=lbound+len*t
return
end function