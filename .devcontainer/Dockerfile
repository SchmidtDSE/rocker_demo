FROM rocker/rstudio:4.5.1

COPY rsession.conf /etc/rstudio/rsession.conf

COPY scripts/install-claude.sh scripts/install-opencode.sh /tmp/scripts/
RUN chmod +x /tmp/scripts/*.sh \
    && su - rstudio -c /tmp/scripts/install-claude.sh \
    && su - rstudio -c /tmp/scripts/install-opencode.sh \
    && rm -rf /tmp/scripts
