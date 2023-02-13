FROM node:18

ARG apppath="/root/workspace"
WORKDIR $apppath

COPY emptyfile_for_keeping_container_alive /root/emptyfile_for_keeping_container_alive
CMD ["sh", "-c", "tail -n 1 -f /root/emptyfile_for_keeping_container_alive"]