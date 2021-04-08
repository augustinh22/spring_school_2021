FROM jupyter/scipy-notebook:latest

#
# Add additional geospatial and file related packages.
#
RUN conda install -c conda-forge --quiet --yes pandas folium spacy geopandas geopy && \
    conda clean --all -f -y

RUN python3 -m spacy download en_core_web_trf

#
# Enable lab extensions.
#
RUN jupyter labextension install @jupyterlab/geojson-extension --no-build && \
    jupyter labextension install @jupyterlab/toc --no-build && \
    jupyter labextension install jupyter-leaflet --no-build && \
    jupyter lab build -y && \
    jupyter lab clean -y && \
    npm cache clean --force

CMD ["/bin/bash"]
