defmodule Today.SocialMediaAccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Today.SocialMediaAccounts` context.
  """

  @doc """
  Generate a twitter_account.
  """
  def twitter_account_fixture(attrs \\ %{}) do
    {:ok, twitter_account} =
      attrs
      |> Enum.into(%{
        account_created_at: ~N[2022-03-25 19:29:00],
        handle: "some handle"
      })
      |> Today.SocialMediaAccounts.create_twitter_account()

    twitter_account
  end
end
