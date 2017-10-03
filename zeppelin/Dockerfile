FROM apache/zeppelin:0.7.3

RUN apt-get --yes --ignore-missing install \
                vim                    \
                libffi-dev

COPY bin/* /bin/

RUN install-js.sh
RUN install-python.sh