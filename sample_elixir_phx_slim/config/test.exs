import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sample_elixir_phx_slim, SampleElixirPhxSlimWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "aoaHdm5d5WR2Dnz8/hhzJP2cVoUIkwW7USlI9YGTLVXbEKHgnbeRR60qZ0+4qpui",
  server: false

# In test we don't send emails.
config :sample_elixir_phx_slim, SampleElixirPhxSlim.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
