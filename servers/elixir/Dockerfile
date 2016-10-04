FROM elixir
ADD . /srv/iot
WORKDIR .
ENV MIX_ENV=dev
ARG DEBIAN_FRONTEND=noninteractive
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
WORKDIR /srv/iot
#RUN mix local.rebar
RUN rm -rf deps
RUN rm -rf _build
RUN mix local.hex --force
RUN mix deps.get
RUN npm install
#RUN cd /srv/iot && mix ecto.create

#ENTRYPOINT ['/srv/iot/mix','phoenix.server']
EXPOSE 4000