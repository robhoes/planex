FROM centos:7
RUN yum -y install epel-release

WORKDIR /build/planex
COPY . /build/planex
RUN yum-builddep -y planex.spec
RUN awk '/^Requires:/ { print $2 }' planex.spec | xargs yum -y install
RUN python setup.py build
RUN python setup.py install

WORKDIR /build
RUN mkdir SPECS
RUN cp planex/planex.spec SPECS
RUN planex-init
RUN planex-pin add SPECS/planex.spec planex#HEAD
RUN make srpms

RUN useradd build
RUN usermod -aG mock build
USER build
#RUN make rpms
