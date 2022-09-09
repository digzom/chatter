FROM elixir:1.13.4-alpine
WORKDIR /app
COPY . .
RUN mix local.hex --force && mix deps.get
ENTRYPOINT mix phx.server
