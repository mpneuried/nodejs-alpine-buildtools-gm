FROM mhart/alpine-node:4.4
MAINTAINER mpneuried

# build tools for native dependencies
RUN apk add --update make gcc g++ python git

# install imagemagick
RUN apk add --upgrade imagemagick

# install graphicsmagick from source because install via apk not working
RUN mkdir /usr/install-gm-1.3.23
WORKDIR /usr/install-gm-1.3.23
RUN wget ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-1.3.23.tar.gz
RUN tar zxvf GraphicsMagick-1.3.23.tar.gz
WORKDIR /usr/install-gm-1.3.23/GraphicsMagick-1.3.23
RUN ./configure --enable-shared
RUN make
RUN make install
RUN rm -rf /usr/install-gm-1.3.23