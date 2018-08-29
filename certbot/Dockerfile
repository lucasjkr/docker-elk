FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install --no-install-recommends software-properties-common  && \
    add-apt-repository ppa:certbot/certbot && \
    apt-get update && \
    apt-get -y install --no-install-recommends certbot cron && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Added to resolve "/bin/sh: can't access tty; job control turned off" error
# https://superuser.com/questions/410472/bin-sh-cant-access-tty-job-control-turned-off-error-when-running-shellcode
RUN rm -f /dev/console && \
    ln -s /dev/ttyS0 /dev/console

COPY jobs/update-last-run-log /etc/cron.d/update-last-run-log

RUN chmod 644 /etc/cron.d/update-last-run-log && \
    touch /var/log/cron.log
CMD cron -f && tail -f /var/log/cron.log

# This works (size 160 MB)