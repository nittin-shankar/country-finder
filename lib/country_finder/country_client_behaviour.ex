defmodule CountryFinder.CountryClientBehaviour do

  @callback all_countries() :: {:ok, Finch.Response.t()} | {:error, Exception.t()}

end
