FROM haskell:8.2.2

MAINTAINER diamondyuan <admin@daimondyuan.com>

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern \
    biber \
    curl \
    jq \
    fonts-liberation

# env for installs
ENV PANDOC_VERSION "2.7.3"
ENV NODE_MAJOR_VERSION "8"

# install pandoc
RUN apt-get install -y zlib1g-dev zip unzip
RUN cabal update && cabal install pandoc-${PANDOC_VERSION} pandoc-citeproc pandoc-crossref

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y make 