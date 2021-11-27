FROM r-base
WORKDIR /heatmap_data/scripts
COPY sample /heatmap_data/sample
COPY scripts /heatmap_data/scripts
RUN chmod 755 *.pl
RUN Rscript packages.R
CMD ["bash"]


