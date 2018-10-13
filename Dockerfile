FROM debian:stretch

MAINTAINER Anthony K GROSS

WORKDIR /code

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y usbutils && \
	apt-get install -y python3 python3-pip python3-xlib python3-dev python3-tk && \
	apt-get install -y libudev-dev libusb-1.0-0-dev && \
	touch /root/.Xauthority && \
	echo "Download completed"

COPY . /code

RUN chmod +x entrypoint.sh && \
    ./entrypoint.sh install

ENTRYPOINT ["/code/entrypoint.sh"]
CMD ["run"]