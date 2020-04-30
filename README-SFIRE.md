### WRF-SFIRE ###
This repository is https://github.com/wrf-sfire/WRF-SFIRE.git master branch. A mirror with a graphical log is at https://repo.or.cz/git-browser/by-commit.html?r=WRF-SFIRE.git

##Branches##
master, develop - the merged code.
WRF/master, WRF/develop - tracking WRF
filtered/* - from the original wrf-fire repository.   
ifire=1 is WRF-SFIRE, ifire=2  the fire code in WRF. Most namelist flags are the same but each has some of its own. Test problems available in test/em_fire:
rain ifire=2
hill ifire=1
two_fires ifire=2
The problems with ifire=2 should give the same result in branch master (the merged code) and in branch WRF/develop (the WRF distribution)
It seems to run serial and MPI and so far passed some limited testing on cheyenne.
Standalone is included but have not started on it yet.
Branches balbi and dvm_branch were carried over but they are not merged into master or tested yet because they were not merged into master in wrf-fire. Also I do not know how to test dvm_branch. 
I can't do real problems yet, that requires pushing data through current WPS, which Adam and Angel are working on.
