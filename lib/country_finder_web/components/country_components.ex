defmodule CountryFinderWeb.CountryComponents do
  use Phoenix.Component
  use Phoenix.VerifiedRoutes,
    router: CountryFinderWeb.Router,
    endpoint: CountryFinderWeb.Endpoint

  alias CountryFinder.Country

  attr :country, Country, required: true

  def card(assigns) do
    ~H"""
    <div class="shadow-sm rounded-md w-full bg-white">
      <.link patch={~p"/#{@country.country_code}"}>
        <img class="aspect-video rounded-t-md w-full object-cover" src={@country.flag_png} alt="">
        <div class="p-5">
          <h3 class="text-lg font-semibold"><%= @country.name %></h3>

          <div class="py-2 flex flex-col gap-y-0.5">
            <div>
              <span class="font-medium">Population: </span><%= @country.population %>
            </div>
            <div>
              <span class="font-medium">Region: </span><%= @country.region %>
            </div>
            <div>
              <span class="font-medium">Capital: </span><%= @country.capital %>
            </div>
          </div>
        </div>
      </.link>
    </div>
    """
  end
end
