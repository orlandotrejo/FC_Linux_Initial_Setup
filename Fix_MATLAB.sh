# MATLAB new install fix for FC
# Tested in FC25

# For plotting problems, see http://stackoverflow.com/questions/38473597/matlab-on-linux-cant-plot-anythingcant-load-libstdc-so-6-version-cxxabi-1
# (or uncomment all LDPATH_PREFIX in .matlab7rc.sh located in $MATLAB/bin folder)

LD_LIBRARY_PATH=/usr/local/lib64/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

# Add simulink to the path (in matlab startup): addpath('/usr/local/MATLAB/R2016a/toolbox/simulink/blocks')
# This has to be done as a new file in in the directory that where you start matlab, creating startup.m and adding previous line
