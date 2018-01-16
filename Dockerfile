FROM jupyter/r-notebook

# need to be root to install stuff
USER root

# update everything so R is new enough to have the packages we need
RUN conda update --all

# install gcc stuff to compile backends to R packages
RUN conda install -y \
    gcc_linux-64 \
    gxx_linux-64 \
    gfortran_linux-64

# install igraph with conda bcz it fails for some reason installing withing R
RUN conda install -y \
    r-igraph

# install monocle
RUN R -e "source('https://bioconductor.org/biocLite.R'); biocLite('monocle')"

# install sparse clustering and regression packages
RUN R -e "install.packages(c('glmnet','RSKC','mgsl'), repos = 'http://cran.us.r-project.org')"

# switch back to not being root
USER $NB_USER

