FROM undeadops/storm:0.10.0
MAINTAINER Mitch Anderson <@undeadops>
RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8080
CMD /usr/bin/start-supervisor.sh
