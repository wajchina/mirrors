#!/bin/bash

PREFIX_MIRROR="/data/mirrors"

export PATH=${PREFIX_MIRROR}/tunasync/bin:$PATH

# anaconda_size=`du -sh ${PREFIX_MIRROR}/web/anaconda/ | awk '{print $1}'`
# tunasynctl set-size -w worker-anaconda anaconda $anaconda_size

# bioconductor_size=`du -sh ${PREFIX_MIRROR}/web/bioconductor/ | awk '{print $1}'`
# tunasynctl set-size -w worker-bioconductor bioconductor $bioconductor_size

# centos_size=`du -sh ${PREFIX_MIRROR}/web/centos/ | awk '{print $1}'`
# tunasynctl set-size -w worker-centos centos $centos_size

# centos_vault_size=`du -sh ${PREFIX_MIRROR}/web/centos-vault/ | awk '{print $1}'`
# tunasynctl set-size -w worker-centos-vault centos-vault $centos_vault_size

# CPAN_size=`du -sh ${PREFIX_MIRROR}/web/CPAN/ | awk '{print $1}'`
# tunasynctl set-size -w worker-CPAN CPAN $CPAN_size

# CRAN_size=`du -sh ${PREFIX_MIRROR}/web/CRAN/ | awk '{print $1}'`
# tunasynctl set-size -w worker-CRAN CRAN $CRAN_size

# debuginfo_size=`du -sh ${PREFIX_MIRROR}/web/debuginfo/ | awk '{print $1}'`
# tunasynctl set-size -w worker-debuginfo debuginfo $debuginfo_size

# epel_size=`du -sh ${PREFIX_MIRROR}/web/epel/ | awk '{print $1}'`
# tunasynctl set-size -w worker-epel epel $epel_size

# pypi_size=`du -sh ${PREFIX_MIRROR}/web/pypi/ | awk '{print $1}'`
# tunasynctl set-size -w worker-pypi pypi $pypi_size

sleep 5

/bin/mv -f ${PREFIX_MIRROR}/web/jobs.json ${PREFIX_MIRROR}/web/jobs.json.bak
/usr/bin/wget -c http://localhost:14242/jobs -O ${PREFIX_MIRROR}/web/jobs.json -o ${PREFIX_MIRROR}/log/wget.log
