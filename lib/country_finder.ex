defmodule CountryFinder do
  @moduledoc """
  CountryFinder keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias CountryFinder.CountryClient
  alias CountryFinder.Country

  @doc """
  Returns a list of country structs
  """
  def all_countries() do
    case CountryClient.all_countries() do
      {:ok, %Finch.Response{status: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> maps_to_structs()

      _ ->
        :error
    end
  end

  defp maps_to_structs(list_of_countries) do
    Enum.map(list_of_countries, fn country_map ->
      name = get_in(country_map, ["name", "common"])
      flag_png = get_in(country_map, ["flags", "png"])
      region = country_map["region"]
      capital = country_map["capital"]
      population = country_map["population"]

      %Country{
        name: name,
        flag_png: flag_png,
        region: region,
        capital: capital,
        population: population
      }
    end)
  end
end
