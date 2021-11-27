# Spectrum Protect tape heatmap project v1

This repo containst the assets to build a container to process data from the Spectrum Protect summary table and build a tape heatmap.

The Dockerfile builds a Docker R container to create the heatmap pdf. The container also includes perl to create the csv file that is used to create he heatmap pdf.

Contents of the repo:

Dockerfile - Build the Docker heatmap container

/scripts - Perl and R scripts used to build the data for the heatmap.

/sample - Sample output for your reference.

Details in the Docker R container can be found at the following link:

https://hub.docker.com/_/r-base

Here is the contents of the Dockerfile to build the heapmap container:

Dockerfile

FROM r-base
WORKDIR /heatmap_data/scripts
COPY sample /heatmap_data/sample  
COPY scripts /heatmap_data/scripts
RUN chmod 755 \*.pl
RUN Rscript packages.R
CMD ["bash"]

The "RUN Rscript packages.R" in the Dockerfile runs a Rscript to install the R ggplots2 and reshape2 packaages. These R packages are required to create the heatmap pdf.

# Build the Docker container

Build the Docker image

docker build -t heatmapapp .

This will build a large Docker image ~1.3GB in size.

# Build and run the Docker container

Start the Docker container using Spectrum Protect data from a directory on your local system.

Example:

docker run -it -v /Users/rhartwig/workspace/ibm/heatmap/heatmapdata:/heatmap_data/work_dir --name heatmap01 heatmapapp

The /Users/rhartwig/workspace/ibm/heatmap/heatmapdata is the local directory that contains the Spectrum Protect instance data. The /heatmap_data/work_dir is the container directory mount to the local directory.

# heatmap scripts

/heatmap_data/scripts

-rwxr-xr-x 1 root root 1702 Nov 27 20:23 heat_map.pl
-rw-r--r-- 1 root root 672 Nov 27 20:23 heatmap.R
-rwxr-xr-x 1 root root 884 Nov 27 20:23 mount_5.pl
-rwxr-xr-x 1 root root 866 Nov 27 20:23 mount.pl
-rw-r--r-- 1 root root 58 Nov 27 20:23 packages.R

# How to create a heatmap

1.  Go to the /heatmap_data/work_dir/< Spectrum Protect instance data > directory.

2.  Create the normalized.txt file:

$grep -i mount summary.txt | grep -v 9800 | awk -F ',' '{ print $1,$2,$21,$22}' | ../../scripts/mount.pl > normalized.txt

3.  Create the drives.unique file:

$grep -i mount summary.txt | grep -v 9800 | awk -F ',' '{ print $22}' | awk '{ print $1}' | sort -u > drives.unique

4.  Create the instane_mount.csv file using the heat_map.pl script:

$../../scripts/heat_map.pl > spsample.mount

This will take some time to process for larger envionments.

5. Remove the first 3 lines from the spsample.mount file:

$awk 'NR > 3 { print }' < spsample.mount > spsample_mount.csv

6.  Run the Rscript to create heatmap pdf.

$Rscript ../../scripts/heatmap.R spsample_mount.csv spsample_mount.pdf
