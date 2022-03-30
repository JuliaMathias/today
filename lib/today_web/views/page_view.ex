defmodule TodayWeb.PageView do
  alias Today.Links

  use TodayWeb, :view

  @spec display_years(any) :: Phoenix.LiveView.Rendered.t()
  def display_years(assigns) do
    ~H"""
    <h2><%= @account.username %></h2>
    <%= for year <- @account.years do %>
      <h3><%= year %></h3>
      <%= display_twitter_link(assigns, year) %>
      <p></p>
    <% end %>

    """
  end

  def display_twitter_link(
        %{account: %{username: username}, day: day, month: month} = assigns,
        year
      ) do
    link = Links.generate_twitter_link(username, year)

    ~H"""
    <p><a href={link} target="_blank">These are your tweets for <%= day %>.<%= month %>.<%= year %></a></p>
    """
  end
end
