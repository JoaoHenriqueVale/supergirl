FROM debian:stretch

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      bzip2 \
      ca-certificates \
      libffi-dev \
      libgdbm3 \
      libssl-dev \
      libyaml-dev \
      libxml2-dev \
      libpq-dev \
      libxslt-dev \
      procps \
      zlib1g-dev \
      pkg-config \
      curl \
      gnupg \
      ruby \
      ruby-dev \
      && rm -rf /var/lib/apt/lists/*

# skip installing gem documentation
RUN mkdir -p /usr/local/etc \
      && { \
      echo 'install: --no-document'; \
      echo 'update: --no-document'; \
      } >> /usr/local/etc/gemrc



MAINTAINER JOAO HENRIQUE <jhm.vale@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends vim nodejs postgresql-client \
      locales dh-make build-essential autoconf autotools-dev fakeroot yarn wget \
      libc6-dev imagemagick

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar -jxvf phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs-2.1.1-linux-x86_64/bin/phantomjs
RUN mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN rm phantomjs-2.1.1-linux-x86_64.tar.bz2 && rm -rf phantomjs-2.1.1-linux-x86_64/bin
RUN chmod 755 /usr/local/bin/phantomjs

RUN mkdir -p /supergirl

WORKDIR /supergirl
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
RUN gem install bundler-audit

ADD . /supergirl
