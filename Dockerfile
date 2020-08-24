FROM ruby:2.5
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    node.js \
    postgresql-client \
    yarn

WORKDIR /product-register
# Gemfileの更新をホスト側へvolumeによって上書きする
COPY Gemfile Gemfile.lock /product-register/
# --build するたびに新しいGemがinstallされる仕組み
RUN bundle install