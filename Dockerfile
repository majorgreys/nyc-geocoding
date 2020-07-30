FROM jupyter/datascience-notebook

MAINTAINER Tahir Butt "tahir@tahirbutt.com"

# Install and configure Geosupport libraries and Python package
USER root
RUN mkdir /geosupport
WORKDIR  /geosupport
RUN curl -LOk http://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gdelx_18a.zip && \
    unzip gdelx_18a.zip
ENV LD_LIBRARY_PATH="/geosupport/version-18a_18.1/lib/"
ENV GEOFILES="/geosupport/version-18a_18.1/fls/"
RUN pip install python-geosupport
RUN pip install simplejson

# Create directories for notebooks and data
USER $NB_UID
WORKDIR $HOME
EXPOSE 8888
EXPOSE 8080
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser"]
