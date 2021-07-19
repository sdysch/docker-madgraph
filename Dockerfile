# This builds MadGraph5_aMC@NLO: https://launchpad.net/mg5amcnlo
# Inspired by: https://github.com/hajifkd/madgraph_docker/blob/master/Docker/Dockerfile

# pull base image, update packages
FROM ubuntu:latest
USER root
RUN apt-get update && apt-get upgrade
# https://serverfault.com/questions/949991/how-to-install-tzdata-on-a-ubuntu-docker-image#comment1357004_992421
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y wget gfortran build-essential ghostscript vim libboost-all-dev python3 python3-pip

WORKDIR /home/MG

# download MG version and extract
ENV MG=MG5_aMC_v3.1.1
ENV MGDIR=MG5_aMC_v3_1_1
RUN wget https://launchpad.net/mg5amcnlo/3.0/3.1.x/+download/${MG}.tar.gz
RUN tar -xvf ${MG}.tar.gz
RUN rm -f ${MG}.tar.gz

# dependencies needed for MG
RUN python3 -m pip install six

# disable automatic webpage opening
RUN echo "automatic_html_opening = False" > /home/MG/${MGDIR}/input/mg5_configuration.txt

# disable autoupdate
RUN rm -f /home/MG/${MGDIR}/input/.autoupdate

# install pythia and lhapdf6
RUN printf 'install pythia8\ny\n' | /home/MG/${MGDIR}/bin/mg5_aMC
RUN printf 'install lhapdf6\ny\n' | /home/MG/${MGDIR}/bin/mg5_aMC

# setup paths/permissions
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/home/MG/${MGDIR}/HEPTools/lib/
RUN chmod 777 /home/MG/${MGDIR}/models

# add mg to $PATH
ENV PATH=/home/MG/${MGDIR}/bin/:$PATH

# Add any user UFO models
ADD entry.sh /home/MG/entry.sh
ENTRYPOINT ["/home/MG/entry.sh"]
CMD ["/bin/bash"]
