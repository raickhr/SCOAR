program inchour
c $$$  main program documentation block

c main program:  inchour    get increment hour
c   prgmmr: kanamitsu          org: w/np51     date: 01-03-31

c abstract:  compute increment hour

c program history log:
c   01-03-31  hann-ming juang  add w3tag calls for nco implementation

c namelists:
c   namin:      parameters determining new date

c input files:

c output files:

c subprograms called:

c attributes:
c   language: fortran

c $$$


c  given two dates, compute hour increment


c THE FOLLOWING VARIABLES ARE READ FROM THE COMMAND LINE ARGUMENTS TO EXEC 
c iys -> $YYYYS  START DATE
c ims -> $MMS    START DATE
c ids -> $DDS    START DATE
c ihs -> $HHS    START DATE

c iye -> $YYYYE  END DATE
c ime -> $MME    END DATE
c ide -> $DDE    END DATE
c ihe -> $HHE    END DATE

read(5,*) iys,ims,ids,ihs,iye,ime,ide,ihe
call compjd(iye,ime,ide,ihe,0,jde,fjde)
call compjd(iys,ims,ids,ihs,0,jds,fjds)
inc=(float(jde-jds)+fjde-fjds)*24
print *,inc
stop
end program
c
subroutine compjd(jyr,jmnth,jday,jhr,jmn,jd,fjd)
  dimension ndm(12)
  data jdor/2415019/,jyr19/1900/
  data ndm/0,31,59,90,120,151,181,212,243,273,304,334/
  
  jd=jdor
  jyrm9=jyr-jyr19
  lp=jyrm9/4
  if(lp.gt.0) then
    jd=jd+1461*lp
  endif
  ny=jyrm9-4*lp
  ic=0
  if(ny.gt.0) then
    jd=jd+365*ny+1
  else
    if(jmnth.gt.2) ic=1
  endif
  jd=jd+ndm(jmnth)+jday+ic
  if(jhr.ge.12) then
    fjd=.041666667e0*float(jhr-12)+.00069444444e0*float(jmn)
  else
    jd=jd-1
    fjd=.5e0+.041666667e0*float(jhr)+.00069444444e0*float(jmn)
  endif
  return
end
