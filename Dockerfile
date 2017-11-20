# Pull base image.
FROM ubuntu:14.04

WORKDIR /mozilla-central

RUN sudo apt-get -y update && \
    sudo apt-get -y install mercurial wget &&  \
    apt-get -y --purge dist-upgrade && \
    apt-get -y --purge autoremove -qq && \
    apt-get clean -y

# update to latest nightly Firefox
RUN rm -rf firefox-nightly && \
    wget -O firefox-nightly.tar.bz2 'https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US' && \
    tar xjf firefox-nightly.tar.bz2 && \
    rm -rf firefox-nightly.tar.bz2 && \
    mv -i firefox firefox-nightly

CMD ["ls -la /mozilla-central/firefox-nightly"]
