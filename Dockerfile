FROM estat/rlang
LABEL author="fazenda"
LABEL project="siever"

WORKDIR /usr/src/

COPY DESCRIPTION .

RUN [ "R", "-e", "devtools::install_deps('.')" ]
RUN [ "R", "-e", "devtools::install_dev_deps('.')" ]

COPY ./R/ ./R/
COPY ./tests/ ./tests/
COPY .lintr .

RUN [ "R", "-e", "devtools::install_local('.')" ]
