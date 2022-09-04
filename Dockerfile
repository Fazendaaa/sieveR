FROM estat/rlang
LABEL author="fazenda"
LABEL project="siever"

RUN [ "apk", "add", "--no-cache", \
  "fontconfig-dev", \
  "fribidi-dev", \
  "harfbuzz-dev", \
  "libsodium-dev", \
  "libjpeg-turbo-dev", \
  "tiff-dev" \
]

WORKDIR /usr/src/

COPY renv.lock .

RUN [ "R", "-e", "renv::restore(prompt=FALSE)" ]

COPY DESCRIPTION .
COPY NAMESPACE .
COPY src/ src/
COPY R/ R/
COPY tests/ tests/
COPY .lintr .

RUN [ "R", "-e", "devtools::test()" ]
RUN [ "R", "-e", "devtools::install_local('.')" ]

COPY inst/ inst/

ENTRYPOINT [ "Rscript", "inst/plumber.R" ]
