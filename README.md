# Elixir Phoenix App Using Docker

## Usage

###  1). Create Dockerfile

```
# Extend from the official Elixir image
FROM elixir:latest

RUN mix local.hex --force \
    && mix archive.install --force hex phx_new \
    && apt-get update \
    && curl -sL https://deb.nodesource.com/setup_lts.x | bash \
    && apt-get install -y apt-utils \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    && apt-get install -y inotify-tools \
    && mix local.rebar --force

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000

CMD ["mix", "phx.server"]

```

### 2). Build Image from Dockerfile in the current directory and tag the images

```
docker build -t elixir-env .
```
### 3. Create new phoenix project
```
docker run --mount type=bind,source=$(pwd),target=/app -p 4000:4000 --rm elixir_slim:latest mix phx.new --no-ecto ${project app}
```
### 4. Go to project app directory
```
cd ${project app}
```
### 5. Get all dependencies
```
docker run --mount type=bind,source=$(pwd),target=/app -p 4000:4000 --rm elixir_slim:latest mix deps.get
```
### 6. Change the http in config/dev.exs
```
# from this:
http: [ip: {127, 0, 0, 1}, port: 4000],
# to this:
http: [ip: {0, 0, 0, 0}, port: 4000],
```
### 7. Launched Application
```
docker run --mount type=bind,source=$(pwd),target=/app -p 4000:4000 --rm elixir_slim:latest mix phx.server
```
