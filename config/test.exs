import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :git_smart, GitSmart.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "git_smart_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :git_smart, GitSmartWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zmL17ZBqbZnxHnatAjk43oE04TBZ2eczZ6N3BcIzH8SyIpPz0lYjgloO/V2n+3sw",
  server: false

# In test we don't send emails.
config :git_smart, GitSmart.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
