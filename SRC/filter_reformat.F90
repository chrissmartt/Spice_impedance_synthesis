PROGRAM filter_reformat

IMPLICIT NONE

integer,parameter :: max_order=100

character*256 :: ipname
character*256 :: c0name
character*256 :: opname
real*8 :: wmin,wmax,wnorm
real*8 :: c0
integer :: nw=200
integer :: aorder,border
real*8 :: acoeff(0:max_order)
real*8 :: bcoeff(0:max_order)
real*8 :: acoeff2(0:max_order)
real*8 :: bcoeff2(0:max_order)
integer :: i

! START

write(*,*)'Enter the input filter filename'
read(*,*)ipname
write(*,*)'Enter the filename for the capacitance term'
read(*,*)c0name
write(*,*)'Enter the output filter filename'
read(*,*)opname

open(unit=10,file=ipname)
open(unit=20,file=opname)

write(*,*)'input filter filename :',trim(ipname)
write(*,*)'output filter filename:',trim(opname)


read(10,*,ERR=9000)            ! Comment line
read(10,*,ERR=9000)wmin,wmax
read(10,*,ERR=9000)            ! Comment line
read(10,*,ERR=9000)wnorm
read(10,*,ERR=9000)aorder
read(10,*,ERR=9000)(acoeff(i),i=0,aorder)
read(10,*,ERR=9000)border
read(10,*,ERR=9000)(bcoeff(i),i=0,aorder)

open(unit=15,file=c0name)
read(15,*)c0
close(unit=15)

if (c0.GT.0d0) then

! Add the capacitance term to the filter function

! apply the wnormalisation to the C0 term
  c0=c0*wnorm
    
! calculate new numerator coefficients
  acoeff2(:)=0d0
  do i=0,aorder
    acoeff2(i)=bcoeff(i)
  end do
  do i=0,border
    acoeff2(i+1)=acoeff2(i+1)+acoeff(i)*c0
  end do
  
! calculate new denominator coefficients
  bcoeff2(:)=0d0
  do i=0,border
    bcoeff2(i+1)=bcoeff(i)*c0
  end do
  
  aorder=aorder+1
  border=border+1
  
  write(20,*)aorder,' # aorder'
  write(20,*)border,' # border'
  write(20,*)wnorm,'  # wnorm'  
  
  write(20,*)'# a coefficients, constant first then increasing powers of s'
  do i=0,aorder
    write(20,*)acoeff2(i)
  end do
  write(20,*)'# b coefficients, constant first then increasing powers of s'
  do i=0,border
    write(20,*)bcoeff2(i)
  end do

else
! Keep the filter function as it is
  write(20,*)aorder,' # aorder'
  write(20,*)border,' # border'
  write(20,*)wnorm,'  # wnorm'
  write(20,*)'# a coefficients, constant first then increasing powers of s'
  do i=0,aorder
    write(20,*)acoeff(i)
  end do
  write(20,*)'# b coefficients, constant first then increasing powers of s'
  do i=0,border
    write(20,*)bcoeff(i)
  end do

end if

write(20,*)'#  wmin,wmax,nw'
!write(20,*)'0.00001 1.0 200'
write(20,*)2d0*3.1415926535d0*wmin/wnorm,2d0*3.1415926535d0*wmax/wnorm,' 1000'
!write(20,'(A2)')'C0'
!write(20,*)c0

close(unit=10)
close(unit=20)

STOP

9000 write(*,*)'Error reading filter file'
STOP

END PROGRAM filter_reformat
