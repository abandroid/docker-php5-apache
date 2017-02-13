FROM selenium/node-firefox:3.0.1

USER root

ADD clear_x_locks.sh /opt/bin/clear_x_locks.sh
RUN chmod a+x /opt/bin/clear_x_locks.sh

ENTRYPOINT ["/opt/bin/clear_x_locks.sh"]

USER seluser