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
      country_code = country_map["cca3"]

      %Country{
        name: name,
        flag_png: flag_png,
        region: region,
        capital: capital,
        population: population,
        country_code: country_code
      }
    end)
  end

  @doc """
     This function is to add comma every 3 digits of a integer from the right.

     Integer.to_charlist() -> Converting integer to charlist as Enum.reverse expects list of intger.
     Enum.reverse() -> Enum.join() will add comma from the left, but we want to add comma from the right,so that we are using Enum.reverse() hear.
     Enum.chunk_every(3) -> Chunk every 3 digits.
     Enum.join(",") -> Using "," in order to add comma.
     String.reverse() -> Finally reversing the order.
  """
  def format_population(integer) do
    integer
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.join(",")
    |> String.reverse()
  end
end
