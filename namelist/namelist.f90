real::a(3,4), b(10), c(3)
integer::ierr,iounit,i
character(len=40), dimension(100)::x
data x /100*'1'/
namelist /na/ a,x
namelist /nb/ b
namelist /nc/ c
a=0
iounit = 11
OPEN(iounit, FILE='namelist.test',FORM='FORMATTED',STATUS='OLD',ACTION='READ')
read(iounit,nb,end=10)
go to 11
10 print *,'namelist nb not found'
rewind(iounit)
11 continue
read(iounit,na)
do i=1,size(a,1)
  print *,(a(i,j),j=1,size(a,2))
enddo
print *,a
close(iounit)
OPEN(iounit, FILE='namelist.out',FORM='FORMATTED',STATUS='UNKNOWN',ACTION='WRITE')
write(iounit,na)
close(iounit)
OPEN(iounit, FILE='namelist.out',FORM='FORMATTED',STATUS='OLD',ACTION='READ')
read(iounit,na)
close(iounit)
end
