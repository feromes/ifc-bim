FROM ubuntu:eoan

ENV CONDA_DIR=/opt/conda

ENV PATH=$CONDA_DIR/bin:$PATH 

USER root

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    libgl1-mesa-glx \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh

RUN conda install -c conda-forge notebook && \
    conda install -c conda-forge ifcopenshell &&\
    conda install -c dlr-sc pythonocc-core && \
    conda install -c conda-forge pythreejs 
    
RUN conda install -c conda-forge pyqt

EXPOSE 8888

COPY ["*.ipynb", "ifc_viewer.py", "IfcOpenHouse/IfcOpenHouse_IFC4.ifc", "/root/"]

CMD cd ~ && \
    jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token=''
