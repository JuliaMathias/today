defmodule Today.LinksTest do
  @moduledoc false

  use ExUnit.Case
  alias Today.Links

  test "when given an account and a year return a twitter search link today's day and month but in that year" do
    today = Date.utc_today()
    tomorrow = Date.utc_today() |> Date.add(1)

    assert Links.generate_twitter_link("thejuliams", "2010") ==
             "https://twitter.com/search?q=from%3Athejuliams%20since%3A2010-#{today.month}-#{today.day}%20until%3A2010-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click"
  end
end
