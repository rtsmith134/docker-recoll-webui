FROM debian:bookworm-slim
# Changed from stretch to bookworm because stretch is from 2017 and its Long Term Support ended in 2022
# MAINTAINER sunde41
# Maintainer is no longer supported

RUN apt-get update && \
    apt-get install -y apt-transport-https git

# Do not need to create recoll.list as bookworm already has recoll and python3-recoll.
#RUN echo deb https://www.lesbonscomptes.com/recoll/debian/ bookworm main > \
#	/etc/apt/sources.list.d/recoll.list
# 
#RUN echo deb-src https://www.lesbonscomptes.com/recoll/debian/ bookworm main >> \
#	/etc/apt/sources.list.d/recoll.list

# Added nano, and vim to the apt-get install as they help with viewing the code.
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated --force-yes recoll recollcmd python3-recoll vim nano \
    gunicorn && \
    apt-get autoremove && apt-get clean

#
# The git clone line has changed several times.
# https://@opensourceprojects.eu not longer exists
# https://github.com/koniu/recoll-webui is the python2 webui which is not compatible with bookworm
# https://framagit.org/medoc92/recollwebui is the python3 webui, but the website is often down
# https://github.com/rtsmith134/recollwebui.git is a copy of framagit.org
#
RUN mkdir /data && mkdir -p /root/.recoll && \
    git clone  https://github.com/rtsmith134/recollwebui.git recollwebui

EXPOSE 80

ADD start.sh /
RUN chmod +x /start.sh
CMD '/start.sh'
