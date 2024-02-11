defmodule Netbots.Repo do
  use Ecto.Repo,
    otp_app: :netbots,
    adapter: Ecto.Adapters.SQLite3
end
