defmodule CountryFinder.Repo do
  use Ecto.Repo,
    otp_app: :country_finder,
    adapter: Ecto.Adapters.Postgres
end
