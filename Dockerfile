FROM java:8-jdk
MAINTAINER Jan Schulte <jan@janschulte.com>

ENV TRIFECTA_VERSION=0.21.0 TRIFECTA_URL=https://github.com/ldaniels528/trifecta/releases/download

WORKDIR /home
RUN wget $TRIFECTA_URL/v$TRIFECTA_VERSION/trifecta_ui-$TRIFECTA_VERSION.zip && \
	unzip trifecta_ui-$TRIFECTA_VERSION.zip  && \
	rm trifecta_ui-$TRIFECTA_VERSION.zip && \
	mv trifecta_ui-$TRIFECTA_VERSION trifecta

COPY config.properties setup.sh entrypoint.sh ./trifecta/
RUN groupadd -r trifecta && useradd -r -g trifecta trifecta && chown -R trifecta /home && chgrp -R trifecta /home
USER trifecta

WORKDIR /home/trifecta
	
VOLUME /home/trifecta/conf
EXPOSE 9000

ENTRYPOINT /home/trifecta/entrypoint.sh
