defmodule TodayWeb.PageView do
  alias Today.Links

  use TodayWeb, :view

  def display_years(assigns) do
    ~H"""
    <h2><%= @account.username %></h2>
    <%= for year <- @account.years do %>
      <h3><%= year %></h3>
      <%= display_twitter_link(@account.username, year, @day, @month) %>
      <p></p>
    <% end %>

    """
  end

  def display_twitter_link(account, year, day, month) do
    link = Links.generate_twitter_link(account, year)

    ~E"""
    <p><a href="<%= link %>" target="_blank">These are your tweets for <%= day %>.<%= month %>.<%= year %></a></p>
    """
  end
end
