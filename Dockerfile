FROM owodunni/jupiterlab
ENV MAIN_PATH=/usr/local/bin/jupiterlab
ENV LIBS_PATH=${MAIN_PATH}/libs
ENV CONFIG_PATH=${MAIN_PATH}/config
ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

EXPOSE 8888

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install liblzma-dev
RUN apt-get update && apt-get -y install \
    cmake zlib1g-dev libglib2.0-0 libsm6 \
    libxext6 libxrender-dev nodejs npm \
    xvfb python-opengl ffmpeg

WORKDIR $MAIN_PATH
COPY config/requirements.txt ${CONFIG_PATH}/

RUN pip install --upgrade pip setuptools
RUN pip install -r ${CONFIG_PATH}/requirements.txt

COPY config/*.py ${CONFIG_PATH}/
COPY config/*.sh ${CONFIG_PATH}/
COPY libs/*.py ${LIBS_PATH}/

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib

CMD sh ${CONFIG_PATH}/run_jupyter.sh
