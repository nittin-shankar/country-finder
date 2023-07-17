defmodule CountryFinder.CountryClientFixtures do

  def success_encoeded_response_fixture() do
    decoded_response = [%{
      "capital" => ["New Delhi"],
      "cca3" => "IND",
      "flags" => %{
        "png" => "https://flagcdn.com/w320/in.png",
      },
      "name" => %{
        "common" => "India",
      },
      "population" => 1380004385,
      "region" => "Asia"
    }]

    Jason.encode!(decoded_response)
  end
end
