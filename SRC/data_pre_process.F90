PROGRAM data_pre_process

IMPLICIT NONE

character*256 :: ipname
character*256 :: opname
character*256 :: opname2
real :: fmax
real :: f,re,im
real :: C0
integer :: count

! START

write(*,*)'Enter the input filename'
read(*,*)ipname
write(*,*)'Enter the output filename'
read(*,*)opname

opname2=trim(ipname)//'.C0'

write(*,*)'Enter the maximum frequency'
read(*,*)fmax

open(unit=10,file=ipname)
open(unit=20,file=opname)
open(unit=30,file=opname2)

write(*,*)'input filename :',trim(ipname)
write(*,*)'output filename:',trim(opname)
write(*,*)'fmax:',fmax

count=0

10 CONTINUE

  read(10,*,END=100)f,re,im
  count=count+1
  if (count.EQ.1) then     ! calculate the capacitance (pole at zero) from the imaginary part of impedance at low freq
    C0=-1.0/(6.283185*f*im)
    if (C0.LT.0d0) then  ! we assume this is an inductive impedance as f->0 so set C0 to zero
      C0=0d0
    end if
    write(30,*)C0,' # C0'
  end if
  
  if (f.LE.fmax) then
    if (c0.NE.0d0) then
      write(20,*)f,re,im+1.0/(6.283185*f*C0)       ! subtract the low frequency capacitive impedance 
    else
      write(20,*)f,re,im 
    end if
  else
    GOTO 100
  end if
  
  GOTO 10

100 CONTINUE

close(unit=10)
close(unit=20)
close(unit=30)


END PROGRAM data_pre_process
