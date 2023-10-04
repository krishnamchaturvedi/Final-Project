#!/bin/bash
PROTOCOL="lftp"
URL="b2b.fadv.com" 
LOCALDIR="C:\Users\Krishnam"
REMOTEDIR="/optexpva/va_fs/FADVDump/Test/krishnam"
USER="rpacoefiles"
PASS="QuwGDA3p8x"
REGEX=".pdf"
LOG="C:\Users\Krishnam\test.pdf"



if [  ! $? -eq 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant cd to $LOCALDIR. Please make sure this local directory is valid" >> $LOG
fi

lftp  $lftp://$b2b.fadv.com <<- DOWNLOAD
    user "$rpacoefiles" "$QuwGDA3p8x"
    cd $/optexpva/va_fs/FADVDump/Test/krishnam
    mget test.pdf
DOWNLOAD

if [ ! $? -eq 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant download files. Make sure the credentials and server information are correct" >> $LOG
fi

