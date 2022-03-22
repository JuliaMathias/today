defmodule TodayWeb.PageControllerTest do
  @moduledoc false
  use TodayWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /twitter", %{conn: conn} do
    conn = get(conn, "/twitter")
    assert html_response(conn, 200) =~ "These are your tweets for"
  end
end
