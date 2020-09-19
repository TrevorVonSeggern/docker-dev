FROM ubuntu:latest

COPY installCommonPackages.sh ./
RUN ./installCommonPackages.sh # common packages has node...

# Python specific stuff
RUN  curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
	&& gunzip elm.gz && chmod +x elm && mv elm /usr/local/bin/

COPY entrypoint.sh ./
CMD [ "./entrypoint.sh" ]
