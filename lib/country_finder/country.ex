defmodule CountryFinder.Country do
  @enforce_keys [
    :name,
    :flag_png,
    :region,
    :capital,
    :population
  ]

  defstruct [
    :name,
    :flag_png,
    :region,
    :capital,
    :population
  ]
end
