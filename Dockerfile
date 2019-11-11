FROM haskell:8.6

ENV PANDOC_VERSION "2.7.3"
ENV NODE_MAJOR_VERSION "12"

# Install TeX Utilities
RUN apt-get update -y \
  && apt-get install -y \
  --no-install-recommends \
  apt-utils \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-math-extra \
  texlive-xetex latex-xcolor \
  texlive-fonts-extra \
  texlive-bibtex-extra \
  fontconfig \
  lmodern

# Install Pandoc
RUN cabal new-update && cabal new-install pandoc-${PANDOC_VERSION}

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash -
RUN apt-get install -y nodejs