real::a(3,4)
integer::ierr,iounit,i
namelist /na/ a
a=0
OPEN(iounit, FILE='namelist.test',FORM='FORMATTED',STATUS='OLD',ACTION='READ',IOSTAT=ierr)
read(iounit,na)
do i=1,size(a,1)
  print *,(a(i,j),j=1,size(a,2))
enddo
end
