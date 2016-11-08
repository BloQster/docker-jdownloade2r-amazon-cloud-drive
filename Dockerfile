FROM bloqster/jdownloader2
MAINTAINER michael.bortlik@gmail.com

ENV ACD_MOUNT="/mnt/acd" \
	ACD_CLI_CACHE_PATH="/acd/.cache"

RUN apt-get update \
 && apt-get install -y python3 python3-pip fuse wget nano\
 && wget -O filebot.deb 'https://app.filebot.net/download.php?type=deb&arch=amd64' \
 && dpkg -i filebot.deb \
 && rm filebot.deb \
 && rm -r /var/lib/apt/lists/* \
 && pip3 install acdcli

RUN mkdir -p $ACD_MOUNT $ACD_CLI_CACHE_PATH

ADD /jdownloader2-acd-filebot_entrypoint.sh /
RUN chmod +x /jdownloader2-acd-filebot_entrypoint.sh
ENTRYPOINT ["/jdownloader2-acd-filebot_entrypoint.sh"]
