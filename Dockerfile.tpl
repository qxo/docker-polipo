FROM ${BASE_IMAGE}
#MAINTAINER sameer@damagehead.com

RUN ${MIRROR_UPDATE} \ 
 apt-get update && \
 apt-get install -y polipo  && \\
 mv /etc/polipo/config /etc/polipo/config.old  &&  \\
 ${MIRROR_RESTORE} \
 rm -rf /var/lib/apt/lists/* # 20150504

EXPOSE 8123


ADD custom/ /

RUN chmod 755 /start

#CMD [\"/start\"]
