FROM ros:melodic-ros-core

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt -y install \
    ros-melodic-cv-bridge \
    ros-melodic-tf \
    python-pip python-matplotlib \
    && rm -rf /var/lib/apt/lists/*

COPY . /kitti2bag

#RUN pip install pandas==0.23
RUN pip install -e /kitti2bag

WORKDIR /data

ENTRYPOINT ["/kitti2bag/docker_entrypoint.sh"]



