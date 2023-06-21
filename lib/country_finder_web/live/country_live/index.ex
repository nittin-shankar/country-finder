defmodule CountryFinderWeb.CountryLive.Index do
  use CountryFinderWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    countries = CountryFinder.all_countries()

    {:ok,
      socket
      |> stream_configure(:countries, dom_id: &(&1.name))
      |> stream(:countries, countries)
    }
  end

  @impl true
  def handle_event("search-country", _params, socket) do
    {:noreply, socket}
  end
end
