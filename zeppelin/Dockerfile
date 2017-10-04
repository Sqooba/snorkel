FROM apache/zeppelin:0.7.3

RUN apt-get update

RUN apt-get --yes install \
                vim       \
                libffi-dev

RUN mkdir /zeppelin/bootstrap/
RUN mkdir -p /zeppelin/webapps/webapp/styles/
RUN mkdir -p /zeppelin/webapps/webapp/scripts/

COPY bin/* /zeppelin/bin/
ADD bootstrap /zeppelin/bootstrap

ENV PATH="/zeppelin/bin:${PATH}"

RUN install-js.sh
RUN install-python.sh