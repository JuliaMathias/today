defmodule Today.SocialMediaAccountsTest do
  @moduledoc false
  use Today.DataCase

  alias Today.SocialMediaAccounts

  describe "twitter_account" do
    alias Today.SocialMediaAccounts.TwitterAccount

    import Today.SocialMediaAccountsFixtures

    @invalid_attrs %{account_created_at: nil, handle: nil}
    @valid_attrs %{account_created_at: ~N[2022-03-25 19:29:00], handle: "some handle"}

    test "list_twitter_account/0 returns all twitter_account" do
      twitter_account = twitter_account_fixture()
      assert SocialMediaAccounts.list_twitter_account() == [twitter_account]
    end

    test "get_twitter_account!/1 returns the twitter_account with given id" do
      twitter_account = twitter_account_fixture()
      assert SocialMediaAccounts.get_twitter_account!(twitter_account.id) == twitter_account
    end

    test "create_twitter_account/1 with valid data creates a twitter_account" do
      assert {:ok, %TwitterAccount{} = twitter_account} =
               SocialMediaAccounts.create_twitter_account(@valid_attrs)

      assert twitter_account.account_created_at == ~N[2022-03-25 19:29:00]
      assert twitter_account.handle == "some handle"
    end

    test "create_twitter_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               SocialMediaAccounts.create_twitter_account(@invalid_attrs)
    end

    test "create_twitter_account/1 with repeated handles returns error changeset" do
      assert {:ok, %TwitterAccount{}} = SocialMediaAccounts.create_twitter_account(@valid_attrs)

      assert {:error, %Ecto.Changeset{}} =
               SocialMediaAccounts.create_twitter_account(@valid_attrs)
    end

    test "update_twitter_account/2 with valid data updates the twitter_account" do
      twitter_account = twitter_account_fixture()
      update_attrs = %{account_created_at: ~N[2022-03-26 19:29:00], handle: "some updated handle"}

      assert {:ok, %TwitterAccount{} = twitter_account} =
               SocialMediaAccounts.update_twitter_account(twitter_account, update_attrs)

      assert twitter_account.account_created_at == ~N[2022-03-26 19:29:00]
      assert twitter_account.handle == "some updated handle"
    end

    test "update_twitter_account/2 with invalid data returns error changeset" do
      twitter_account = twitter_account_fixture()

      assert {:error, %Ecto.Changeset{}} =
               SocialMediaAccounts.update_twitter_account(twitter_account, @invalid_attrs)

      assert twitter_account == SocialMediaAccounts.get_twitter_account!(twitter_account.id)
    end

    test "delete_twitter_account/1 deletes the twitter_account" do
      twitter_account = twitter_account_fixture()

      assert {:ok, %TwitterAccount{}} =
               SocialMediaAccounts.delete_twitter_account(twitter_account)

      assert_raise Ecto.NoResultsError, fn ->
        SocialMediaAccounts.get_twitter_account!(twitter_account.id)
      end
    end

    test "change_twitter_account/1 returns a twitter_account changeset" do
      twitter_account = twitter_account_fixture()
      assert %Ecto.Changeset{} = SocialMediaAccounts.change_twitter_account(twitter_account)
    end
  end
end
