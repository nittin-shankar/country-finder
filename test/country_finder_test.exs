defmodule CountryFinder.CountryFinderTest do
  use CountryFinder.DataCase

  import Mox
  import CountryFinder.CountryClientFixtures

  alias CountryFinder.Country

  setup :verify_on_exit!

  test "format_number/1 returns the number as a string formatted using the thousands seperator" do
    assert CountryFinder.format_number(2300) == "2,300"
    assert CountryFinder.format_number(12) == "12"
  end

  test "all_countries/0 returns a list of country structs from the country client" do
    success_encoeded_response_fixture()
    |> country_client_success_mock()

    assert [%Country{} = country] = CountryFinder.all_countries()

    assert country.name == "India"
    assert country.flag_png == "https://flagcdn.com/w320/in.png"
    assert country.region == "Asia"
    assert country.capital == ["New Delhi"]
    assert country.population == 1380004385
    assert country.country_alpha_code == "IND"
  end

  test "all_countries/0 retursn an error atom when country client is not accessible" do
    country_client_not_found_mock()

    assert CountryFinder.all_countries() == :error
  end



  defp country_client_success_mock(body) do
    expect CountryClientMock, :all_countries, fn ->
      {:ok, %Finch.Response{status: 200, body: body}}
    end
  end

  defp country_client_not_found_mock() do
    expect CountryClientMock, :all_countries, fn ->
      {:ok, %Finch.Response{status: 404}}
    end
  end


end
