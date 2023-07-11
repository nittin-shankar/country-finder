defmodule CountryFinder.Country do
  @enforce_keys [
    :name,
    :flag_png,
    :region,
    :capital,
    :population,
    :country_alpha_code
  ]

  defstruct [
    :name,
    :flag_png,
    :region,
    :capital,
    :population,
    :country_alpha_code
  ]
end
