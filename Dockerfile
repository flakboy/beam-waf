FROM elixir:otp-29-alpine

EXPOSE 8080

WORKDIR /app

ADD mix.exs mix.exs
ADD mix.lock mix.lock
ADD lib/ lib/

RUN mix deps.get
RUN mix compile

ENTRYPOINT ["mix", "run", "--no-halt"]