* Submit Batch Script
    * set coupleRunDir
        * if coupleRunDir present:
            * Read last hour of the simulation to restart from
        * if not present:
            * set restart parameter no
    * set the end time of the simulation

    * Run another batch file: 
        * ./tpos1_r09_restart.sh $yyyye:$mme:$dde:$hhe $RESTART $LastNHour >& r09_log_$$_$yyyye$mme$dde


# tpos1_r09_restart.sh workflow

1. Set the start date of the simulation
2. Set the CASENAME which is the gridname variable
3. Set the configuration of the run
    a. Run ROMS only
    b. Run WRF only
    c. Run WW3 only
    d. Run ROMSandWRF
    e. Run ROMS, WRF and WW3



