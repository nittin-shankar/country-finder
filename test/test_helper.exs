Mox.defmock(CountryClientMock, for: CountryFinder.CountryClientBehaviour)
Application.put_env(:country_finder, :country_client_module, CountryClientMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(CountryFinder.Repo, :manual)
