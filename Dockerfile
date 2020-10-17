FROM ubuntu:latest
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y --no-install-recommends \
    vim \
    git \
    g++ \
    libeigen3-dev \
    zlib1g-dev \
    libqt5opengl5-dev \
    libqt5svg5-dev \
    libgl1-mesa-dev \
    libfftw3-dev \
    libtiff5-dev \
    libpng-dev \
    tmux \
    wget \
    python \
    curl \
    ca-certificates \
    make \
    cmake-curses-gui \
    file \
    python3 \
    python3-pip \
    dc

# installing pip
RUN pip3 install joblib
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py && \
    python ./get-pip.py

# installing fsl
RUN wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py && \
    python ./fslinstaller.py --dest=/usr/local/fsl -q && \ 
    echo export FSLDIR=/usr/local/fsl >> ~/.bashrc && \
    echo export PATH=$PATH:/usr/local/fsl/bin/ >> ~/.bashrc

# installing mrtrix
RUN export GIT_SSL_NO_VERIFY=1 && \
    git clone https://github.com/MRtrix3/mrtrix3.git && \
    cd mrtrix3 && \
    ./configure && \
    ./build && \
    ./set_path

<<<<<<< HEAD
# isntalling ANTs
RUN mkdir ~/ANTs && \
    workingDir=~/ANTs && \
    git clone https://github.com/ANTsX/ANTs.git && \
    mkdir build install && \
    cd build && \
    cmake \ 
            -DCMAKE_INSTALL_PREFIX=${workingDir}/install \ 
            ../ANTs 2>&1 && \
            make -j 64 && \
    cd ANTS-build && \
    make install && \
    echo "export ANTSPATH=/root/ANTs/install/bin" >> ~/.bashrc && \
    echo "export PATH=\${ANTSPATH}:\$PATH" >> ~/.bashrc

# installing freesurfer
RUN cd ~ && \
    wget https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.1.1/freesurfer-linux-centos7_x86_64-7.1.1.tar.gz && \
    tar -C /usr/local -zxvpf freesurfer-linux* --no-same-owner && \
    echo export FREESURFER_HOME=/usr/local/freesurfer >> ~/.bashrc && \
    echo export SUBJECTS_DIR=\$FREESURFER_HOME/subjects >> ~/.bashrc && \
    echo source \$FREESURFER_HOME/SetUpFreeSurfer.sh >> ~/.bashrc && \
    cd /usr/local/freesurfer && \
    wget https://www.dropbox.com/s/5kvfdk8ob8tzntp/license.txt && \
    cd ~

 #shell settings
 WORKDIR /root

 # install utils
 RUN apt -y update
 RUN apt -y install bc libgomp1 perl tar tcsh wget vim-common
 RUN apt -y install libgl1-mesa-glx libxext-dev libsm-dev libxrender-dev libxmu-dev
 RUN apt clean all

# configuring enviroment variables
ENV OS Linux
ENV PATH /root/ANTs/install/bin:/mrtrix3/bin:/usr/local/freesurfer/bin:/usr/local/freesurfer/fsfast/bin:/usr/local/freesurfer/tktools:/usr/local/freesurfer/mni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/fsl/bin/
ENV FREESURFER_HOME /usr/local/freesurfer
ENV FREESURFER /usr/local/freesurfer
ENV SUBJECTS_DIR /usr/local/freesurfer/subjects
ENV LOCAL_DIR /usr/local/freesurfer/local
ENV FSFAST_HOME /usr/local/freesurfer/fsfast
ENV FMRI_ANALYSIS_DIR /usr/local/freesurfer/fsfast
ENV FUNCTIONALS_DIR /usr/local/freesurfer/sessions

# set default fs options
ENV FS_OVERRIDE 0
ENV FIX_VERTEX_AREA ""
ENV FSF_OUTPUT_FORMAT nii.gz

# mni env requirements
ENV MINC_BIN_DIR /usr/local/freesurfer/mni/bin
ENV MINC_LIB_DIR /usr/local/freesurfer/mni/lib
ENV MNI_DIR /usr/local/freesurfer/mni
ENV MNI_DATAPATH /usr/local/freesurfer/mni/data
ENV MNI_PERL5LIB /usr/local/freesurfer/mni/share/perl5
ENV PERL5LIB /usr/local/freesurfer/mni/share/perl5

#fsl, freesurfer, and ants ENVs
ENV FSLDIR /usr/local/fsl
ENV ANTSPATH /root/ANTs/install/bin
ENV FREESURFER_HOME /usr/local/freesurfer
ENV SUBJECTS_DIR $FREESURFER_HOME/subjects
RUN /bin/bash -c "source $FREESURFER_HOME/SetUpFreeSurfer.sh"

