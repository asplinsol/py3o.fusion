FROM xcgd/py3o.fusion

RUN apt-get update && apt-get install -y build-essential mercurial && rm -rf /var/lib/apt/lists/*
WORKDIR /
WORKDIR /tmp/

RUN hg clone https://bitbucket.org/asplinsolutions/py3o.template
WORKDIR /tmp/py3o.template/
RUN hg pull && hg up multiline_v1

RUN pip install Pillow 
RUN  /usr/bin/yes | pip uninstall py3o.template

RUN python setup.py install


