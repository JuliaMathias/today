defmodule Today.SocialMediaAccounts.TwitterAccount do
  @moduledoc """
  A Twitter account.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "twitter_account" do
    field :account_created_at, :naive_datetime
    field :handle, :string
    field :twitter_id, :string

    timestamps()
  end

  @doc false
  def changeset(twitter_account, attrs) do
    twitter_account
    |> cast(attrs, [:handle, :account_created_at, :twitter_id])
    |> validate_required([:handle])
    |> unique_constraint(:handle)
  end
end
