FROM xcgd/py3o.fusion:0.8.7

RUN apt-get update && apt-get install -y build-essential curl && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/
RUN mkdir py3o.template && \
  curl https://bitbucket.org/asplinsolutions/py3o.template/get/asplinsolutions.tar.gz | tar xzC py3o.template --strip 1
WORKDIR /tmp/py3o.template/

RUN pip install Pillow 
RUN  /usr/bin/yes | pip uninstall py3o.template

RUN python setup.py install


