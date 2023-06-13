defmodule CountryFinderWeb.CountryLive.Index do
  use CountryFinderWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event("search-country", _params, socket) do
    {:noreply, socket}
  end


end
