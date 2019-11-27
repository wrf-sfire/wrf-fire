real::a(3,4), b(10), c(3)
integer::ierr,iounit,i
namelist /na/ a
namelist /nb/ b
namelist /nc/ c
a=0
OPEN(iounit, FILE='namelist.test',FORM='FORMATTED',STATUS='OLD',ACTION='READ',IOSTAT=ierr)
read(iounit,nb,end=10)
go to 11
10 print *,'namelist nb not found'
rewind(iounit)
11 continue
read(iounit,na)
do i=1,size(a,1)
  print *,(a(i,j),j=1,size(a,2))
enddo
end
