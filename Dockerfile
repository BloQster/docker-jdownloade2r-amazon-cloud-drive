FROM bloqster/jdownloader2
MAINTAINER michael.bortlik@gmail.com

RUN apt-get update \
 && apt-get install -y unzip libmediainfo-dev \
 && rm -r /var/lib/apt/lists/*

RUN wget -O rclone.zip 'https://downloads.rclone.org/rclone-v1.36-linux-amd64.zip' \
 && unzip rclone.zip \
 && cp /rclone-*/rclone /usr/sbin/ \
 && rm -r rclone* \
 && chmod 755 /usr/sbin/rclone

RUN wget -O filebot.deb 'https://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_amd64.deb' \
 && dpkg -i filebot.deb \
 && rm filebot.deb

ADD /jdownloader2-acd-filebot_entrypoint.sh /
RUN chmod +x /jdownloader2-acd-filebot_entrypoint.sh
ENTRYPOINT ["/jdownloader2-acd-filebot_entrypoint.sh"]
