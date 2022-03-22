defmodule TodayWeb.PageController do
  use TodayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def twitter(conn, _params) do
    today = Date.utc_today()

    assigns = %{
      day: today.day,
      month: today.month,
      mooniunatik: %{username: "mooniunatik", years: ["2017", "2018", "2019", "2020", "2021"]},
      thejuliams: %{
        username: "thejuliams",
        years: [
          "2010",
          "2011",
          "2012",
          "2013",
          "2014",
          "2015",
          "2016",
          "2017",
          "2018",
          "2019",
          "2020",
          "2021"
        ]
      }
    }

    render(conn, "twitter.html", assigns)
  end
end
