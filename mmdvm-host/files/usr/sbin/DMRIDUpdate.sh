#!/bin/sh

# 
# Copyright 2019 BD7MQB <bd7mqb@qq.com>
# This is free software, licensed under the GNU GENERAL PUBLIC LICENSE, Version 2.0
# 

# Full path to DMR ID file
DMRIDFILE=/etc/mmdvm/DMRIds.dat
DMRIDFILE_TMP=/tmp/DMRIds.dat

# Full version
# curl 'https://www.radioid.net/static/users.csv' 2>/dev/null | awk -F ',' '{print $1"\t"$2"\t"$3"\t"$4"\t"$6}'  > ${DMRIDFILE}

# Pre-formatted version to speedup the update process
wget -O ${DMRIDFILE_TMP}.gz http://pkg.openwrt.bd7mqb.com:8088/radioid/DMRIds.dat.gz
gzip -d ${DMRIDFILE_TMP}.gz
mv ${DMRIDFILE_TMP} ${DMRIDFILE}

# Compact version
#wget -O ${DMRIDFILE} http://registry.dstar.su/dmr/DMRIds.php