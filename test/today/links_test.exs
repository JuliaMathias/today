defmodule Today.LinksTest do
  @moduledoc false

  use ExUnit.Case
  alias Today.Links

  test "when given an account and a list of years return list of links" do
    today = Date.utc_today()
    tomorrow = Date.utc_today() |> Date.add(1)
    range = ["2010", "2011", "2012", "2013", "2014"]
    links_list = Links.generate_twitter_links("thejuliams", range)

    assert Enum.count(range) == Enum.count(links_list)

    assert links_list == [
             "https://twitter.com/search?q=from%3Athejuliams%20since%3A2010-#{today.month}-#{today.day}%20until%3A2010-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click",
             "https://twitter.com/search?q=from%3Athejuliams%20since%3A2011-#{today.month}-#{today.day}%20until%3A2011-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click",
             "https://twitter.com/search?q=from%3Athejuliams%20since%3A2012-#{today.month}-#{today.day}%20until%3A2012-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click",
             "https://twitter.com/search?q=from%3Athejuliams%20since%3A2013-#{today.month}-#{today.day}%20until%3A2013-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click",
             "https://twitter.com/search?q=from%3Athejuliams%20since%3A2014-#{today.month}-#{today.day}%20until%3A2014-#{tomorrow.month}-#{tomorrow.day}&src=recent_search_click"
           ]
  end
end
