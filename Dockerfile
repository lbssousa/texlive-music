ARG RELEASE=2022
ARG REVISION=2022-07-10
FROM registry.gitlab.com/islandoftex/images/texlive:TL${RELEASE}-${REVISION}

ARG LILYPOND_VERSION=2.22.2-1
ARG LILYPOND_INSTALL=lilypond-${LILYPOND_VERSION}.linux-64.sh
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    abcm2ps \
    bzip2 \
    && curl -O https://lilypond.org/download/binaries/linux-64/${LILYPOND_INSTALL} \
    && sh ./${LILYPOND_INSTALL} --batch \
    && rm -f ./${LILYPOND_INSTALL} \
    && apt-get -y autoremove --purge \
    && apt-get clean
