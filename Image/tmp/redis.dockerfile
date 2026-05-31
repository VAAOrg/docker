# This is the base OCI image used for this Dockerfile execution.
FROM sloopstash/amazon-linux-2:v1.1.1

# Install system packages and dependencies for Redis database server.
RUN yum install tcl

# Download Redis from official website.
RUN wget http://download.redis.io/releases/redis-7.2.1.tar.gz -P /tmp

# Extract Redis from archive.
RUN tar xvzf /tmp/redis-7.2.1.tar.gz -C /tmp

# Compile Redis from source code.
WORKDIR /tmp/redis-7.2.1
RUN set -x \
  && make distclean \
  && make \
  && make install

 