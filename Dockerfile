FROM centos:7
EXPOSE 8888
RUN yum install -y python3
RUN pip3 install --upgrade pip
RUN pip3 install notebook
RUN pip3 install RISE
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter nbextension enable rise --py --sys-prefix
CMD jupyter notebook --ip=* --no-browser --allow-root
