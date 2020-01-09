FROM ubuntu:18.04
ADD --chown=root:root sources.list /etc/apt/sources.list
RUN apt-get -qq update && apt-get -qq install sudo && /bin/bash -c "echo -e '%sudo\tALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/99_sudo_nopasswd"
ARG UNAME
ARG UID
ARG GNAME
ARG GID
RUN ( grep -q "^$GNAME:" /etc/group && groupadd -g "$GID" -o "${GNAME}-host" || groupadd -g "$GID" -o "$GNAME" ) && useradd -m -u "$UID" -g "$GID" -G sudo -o -s /bin/bash "$UNAME"
USER $UNAME
WORKDIR "/home/$UNAME"
