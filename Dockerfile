FROM conda/miniconda3

MAINTAINER Tahir Butt "me@tahirbutt.com"

RUN conda install -c conda-forge jupyterlab
RUN conda install -c conda-forge nodejs
RUN conda install -c conda-forge pandas

RUN conda install -c conda-forge curl unzip
WORKDIR  /geosupport
RUN curl -LOk http://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gdelx_18a.zip && \
    unzip gdelx_18a.zip
ENV LD_LIBRARY_PATH="/geosupport/version-18a_18.1/lib/"
ENV GEOFILES="/geosupport/version-18a_18.1/fls/"

RUN pip install python-geosupport

RUN mkdir /data
RUN mkdir /work
WORKDIR /work
EXPOSE 8888
EXPOSE 8080
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser"]
