FROM xcgd/py3o.fusion

RUN apt-get update && apt-get install -y build-essential wget && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/
RUN wget https://github.com/asplinsol/py3o.fusion/archive/multiline_v2.tar.gz && \
    tar zxvf multiline_v2.tar.gz && \
    mv multiline_v2 py3o.template
WORKDIR /tmp/py3o.template/

RUN pip install Pillow 
RUN  /usr/bin/yes | pip uninstall py3o.template

RUN python setup.py install


