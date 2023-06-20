defmodule CountryFinder.CountryClient do
  @behaviour CountryFinder.CountryClientBehaviour

  def all_countries() do
    url = "https://restcountries.com/v3.1/all?fields=flags,name,population,region,capital"
    Finch.build(:get, url) |> Finch.request(CountryFinder.Finch)
  end
end
