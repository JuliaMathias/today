defmodule Today.SocialMediaAccounts do
  @moduledoc """
  The SocialMediaAccounts context.
  """

  import Ecto.Query, warn: false
  alias Today.Repo

  alias Today.SocialMediaAccounts.TwitterAccount

  @doc """
  Returns the list of twitter_account.

  ## Examples

      iex> list_twitter_account()
      [%TwitterAccount{}, ...]

  """
  def list_twitter_account do
    Repo.all(TwitterAccount)
  end

  @doc """
  Gets a single twitter_account.

  Raises `Ecto.NoResultsError` if the Twitter account does not exist.

  ## Examples

      iex> get_twitter_account!(123)
      %TwitterAccount{}

      iex> get_twitter_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_twitter_account!(id), do: Repo.get!(TwitterAccount, id)

  @doc """
  Creates a twitter_account.

  ## Examples

      iex> create_twitter_account(%{field: value})
      {:ok, %TwitterAccount{}}

      iex> create_twitter_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_twitter_account(attrs \\ %{}) do
    %TwitterAccount{}
    |> TwitterAccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a twitter_account.

  ## Examples

      iex> update_twitter_account(twitter_account, %{field: new_value})
      {:ok, %TwitterAccount{}}

      iex> update_twitter_account(twitter_account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_twitter_account(%TwitterAccount{} = twitter_account, attrs) do
    twitter_account
    |> TwitterAccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a twitter_account.

  ## Examples

      iex> delete_twitter_account(twitter_account)
      {:ok, %TwitterAccount{}}

      iex> delete_twitter_account(twitter_account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_twitter_account(%TwitterAccount{} = twitter_account) do
    Repo.delete(twitter_account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking twitter_account changes.

  ## Examples

      iex> change_twitter_account(twitter_account)
      %Ecto.Changeset{data: %TwitterAccount{}}

  """
  def change_twitter_account(%TwitterAccount{} = twitter_account, attrs \\ %{}) do
    TwitterAccount.changeset(twitter_account, attrs)
  end
end
