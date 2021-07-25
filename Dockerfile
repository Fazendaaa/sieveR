FROM estat/rlang
LABEL author="fazenda"
LABEL project="siever"

RUN [ "apk", "add", "--no-cache", \
  "libsodium-dev", \
  "libjpeg-turbo-dev" \
]

WORKDIR /usr/src/

COPY DESCRIPTION .

RUN [ "R", "-e", "devtools::install_deps('.')" ]

COPY NAMESPACE .
COPY src/ src/
COPY R/ R/
COPY tests/ tests/
COPY .lintr .

RUN [ "R", "-e", "devtools::test()" ]
RUN [ "R", "-e", "devtools::install_local('.')" ]

COPY inst/ inst/
