defmodule Today.Links do
  @moduledoc """
  Module that deals with generating links for different social medias
  """

  @doc """
    Generates a list of twitter search links for a given account and year range.

  ### Example

  iex> generate_twitter_links("thejuliams", ["2010", "2011"])
  [
    "https://twitter.com/search?q=from%3Athejuliams%20since%3A2010-03-17%20until%3A2010-03-18&src=recent_search_click",
    "https://twitter.com/search?q=from%3Athejuliams%20since%3A2011-03-17%20until%3A2011-03-18&src=recent_search_click"
  ]

  """
  @spec generate_twitter_links(String.t(), range :: [String.t()]) :: list
  def generate_twitter_links(account, range) do
    today = Date.utc_today()
    tomorrow = Date.utc_today() |> Date.add(1)

    Enum.map(range, fn year ->
      "https://twitter.com/search?q=from%3A#{account}%20since%3A#{year}-#{today.month}-#{today.day}%20until%3A#{year}-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click"
    end)
  end
end
