FROM python:3.10.7-buster
EXPOSE 8888
RUN pip3 install --upgrade pip
RUN pip3 install notebook
RUN pip3 install RISE
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter nbextension enable rise --py --sys-prefix
RUN jupyter nbextension enable hide_input_all/main --sys-prefix
RUN pip3 install jupyter_contrib_nbextensions
RUN pip3 install ipywidgets
RUN pip3 install matplotlib numpy
RUN jupyter contrib nbextension install
RUN mkdir /data
CMD cd /data; jupyter notebook --ip=* --no-browser --allow-root
