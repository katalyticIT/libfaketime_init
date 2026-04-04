#!/bin/sh
#
# ---- copyLibfaketime.sh ----
#
# Copies the libfaketime libraries to $LFT_DESTPATH
# which should be a shared volume. Set in your deployment
# manifest:
#
#   spec:
#     ...
#     env:
#       - name: LFT_DESTPATH
#         value: /path/to/shared/volume
#

# define where the libraries got installed at build time
LFT_SRCPATH="/usr/lib/x86_64-linux-gnu/faketime/"

# make sure LFT_DESTPATH is set; default is /mnt
LFT_DESTPATH=${LFT_DESTPATH:-/mnt}

# check if destination path exists and is a writeable directory
if [ -w "${LFT_DESTPATH}" ] ; then

  # copy the library files, standard & multithreading variant
  echo "copying libfaketime library files to $LFT_DESTPATH ..."
  cp -v $LFT_SRCPATH/libfaketime*.so.1 $LFT_DESTPATH

else

  # something's wrong ...
  echo "ERROR: ${LFT_DESTPATH} is not a writeable directory; exiting."
  exit 1

fi

