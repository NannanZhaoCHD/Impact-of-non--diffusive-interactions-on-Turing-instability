!!!!!!!!!!!!!!!!!!!!!!!!!!!!
program feiduichen_FHN_model
implicit none
    integer,parameter :: tran=100000,n=100
    double precision :: dr1(n),di1(n),dr2(n),di2(n),dr3(n),di3(n),dr4(n),di4(n),tr(n),ti(n)
    double precision :: x(n),y(n),x0(n),y0(n),t,h=0.01d0,e1,s1
    integer :: i,ii,jj
    real*8::t1,t2,c(n,n)
    real*8:: lbound=-1.0d0,ubound=1.0d0
    real*8, external:: my_random
    
    open(unit=111,file='p09.txt')
    call cpu_time(t1)
    

    e1=0.1d0
    s1=0.5d0    
    

    call network_twodem(n,c)
    !write(111,"(10(F8.4))") (c(i,:),i=1,n)
    !print*,c
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   
    do i=1,n
      call random_seed()
      x(i)=my_random(lbound,ubound)
      y(i)=my_random(lbound,ubound)
    enddo
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
do jj=1,tran
      t=0.0d0+jj*h
     print*,t
   do i=1,n      
       x0(i)=x(i)
       y0(i)=y(i)
   enddo 
   call fcn(dr1,di1,n,c,x,y,e1,s1)
   do i=1,n      
       tr(i)=x(i)+0.5d0*h*dr1(i)
       ti(i)=y(i)+0.5d0*h*di1(i)
   enddo  
   call fcn(dr2,di2,n,c,tr,ti,e1,s1)
   do i=1,n      
       tr(i)=x(i)+0.5d0*h*dr2(i)
       ti(i)=y(i)+0.5d0*h*di2(i)
   enddo 
   call fcn(dr3,di3,n,c,tr,ti,e1,s1)
   do i=1,n      
       tr(i)=x(i)+h*dr3(i)
       ti(i)=y(i)+h*di3(i)
   enddo
   call fcn(dr4,di4,n,c,tr,ti,e1,s1)

   do i=1,n      
       x(i)=x0(i)+h*(dr1(i)/6.0d0+dr2(i)/3.0d0+dr3(i)/3.0d0+dr4(i)/6.0d0)
       y(i)=y0(i)+h*(di1(i)/6.0d0+di2(i)/3.0d0+di3(i)/3.0d0+di4(i)/6.0d0)
   enddo
   
   write(111,"(100(F8.3))") x
   
enddo  !!!!!!!!!!!!!!!!!!!!!!!!!


!write(111,"(100(F8.4))") x

call cpu_time(t2)
write(*,*)"cpu time:", t2-t1
    
end program feiduichen_FHN_model


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine fcn(dr,di,n,c,x,y,e1,s1)
implicit none
integer :: n,i,j
real*8::c(n,n)
double precision :: e1,s1,x(n),y(n),dr(n),di(n)  
!!!!!! single mm model
do i=1,n
    dr(i)=x(i)-(x(i)**3)/3.0-y(i)
    di(i)=2*x(i)-1.5*y(i)
enddo
!!!!!! coupling term
do i=1,n
  do j=1,n
     dr(i)=dr(i)+e1*c(i,j)*x(j)
     di(i)=di(i)+s1*c(i,j)*y(j)
  enddo
enddo

return
end subroutine
    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine network_twodem(n,c)
implicit none
integer n,i,j
real*8::c(n,n)
real*8::x,pp
real*8, parameter::sigma=0.1,p=0.9
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
    
    do i=1,n !!!!!!!!!!!!!!
            c(i,i)=0.0
    enddo 
    
  return
end subroutine   
    
subroutine random_stdnormal(x)
   implicit none
   real,parameter :: pi=3.14159265
   real*8:: u1,u2,x
   !call random_stduniform(u1)
   !call random_stduniform(u2)
   call random_number(u1)
   call random_number(u2)
   x = sqrt(-2*log(u1))*cos(2*pi*u2)
   return
end subroutine
    
!subroutine random_stduniform(u)
!   implicit none
!   real*8:: u
!   real*8:: r
!   call random_number(r)
!   u = 1 - r
!end subroutine random_stduniform    
    
   
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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