FROM bloqster/jdownloader2
MAINTAINER michael.bortlik@gmail.com

RUN apt-get update \
 && apt-get install -y wget nano unzip \
 && rm -r /var/lib/apt/lists/*

RUN wget 'http://downloads.rclone.org/rclone-current-linux-amd64.zip' \
 && unzip rclone-current-linux-amd64.zip \
 && cp /rclone-*-linux-amd64/rclone /usr/sbin/ \
 && rm -r rclone* \
 && chmod 755 /usr/sbin/rclone

RUN wget -O filebot.deb 'https://netcologne.dl.sourceforge.net/project/filebot/filebot/FileBot_4.7.5/filebot_4.7.5_amd64.deb' \
 && dpkg -i filebot.deb \
 && rm filebot.deb

ADD /jdownloader2-acd-filebot_entrypoint.sh /
RUN chmod +x /jdownloader2-acd-filebot_entrypoint.sh
ENTRYPOINT ["/jdownloader2-acd-filebot_entrypoint.sh"]
